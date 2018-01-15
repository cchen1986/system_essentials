#!/usr/bin/env ruby

# This script sorts static libraries in the topological order suitable for
# passing to ld. No need for --start-group/--end-group anymore. Should speed
# up the linking a bit. When the libraries contain actual circular dependecies
# the script will detect minimal groups of those and surround them with
# --start-group/--end-group.
#
# To run you need Linux (maybe OS X), Ruby 1.9+ and the rgl gem installed:
#
#   $ gem install rgl
#
# Run:
#
#   $ ./sort-libs.rb [--verbose] *.a

require "set"
require "rgl/adjacency"
require "rgl/topsort"
require "rgl/connected_components"

VERBOSE = ARGV.delete "--verbose"

if ARGV.empty?
    puts "./sort-libs.rb [--verbose] library library ..."
    exit
end

class Library
    attr_reader :imports,
                :exports

    def initialize filename
        @imports = imported_symbols filename
        @exports = exported_symbols filename
    end

    def depends_on? lib
        !(imports & lib.exports).empty?
    end

    private

    def imported_symbols filename
        nm filename, "undefined"
    end

    def exported_symbols filename
        nm filename, "defined"
    end

    def nm filename, symbol_kind
        Set.new `nm -P -extern-only -#{symbol_kind}-only '#{filename}'`
            .split("\n")
            .grep(/^(\S+) [a-zA-Z] /) { $1 }
    end
end

libs = {}
ARGV.sort.each_with_index do |i, index|
    puts "[#{index + 1}/#{ARGV.size}] Parsing #{i}" if VERBOSE
    libs[i] = Library.new i
end

puts "Sorting" if VERBOSE

# A bit of O(N^2) here
# Go through all pairs of libraries and build the adjacency list. When A depends
# on B there's an edge from A to B or A is adjacent to B.
adjacency = []
libs.each do |a, lib_a|
    libs.each do |b, lib_b|
        if a != b && lib_a.depends_on?(lib_b)
            adjacency << a
            adjacency << b
        end
    end
end

puts "Link order:" if VERBOSE
graph = RGL::DirectedAdjacencyGraph[*adjacency]

# Add leftover libraries. Nobody depends on these.
graph.add_vertices *(libs.keys - graph.vertices)

# When the dependency graph is acyclic it's trivial
if graph.acyclic?
    # Just print the libraries in topological order
  puts graph.topsort_iterator.to_a
else
    # Otherwise we have to detect strongly connected components
    # in the graph, collapse them to single nodes and topologically
    # sort those.

    # SCCs (groups of libraries with circular dependencies)
    sccs = graph.strongly_connected_components
    group_count = sccs.num_comp
    library_to_group = sccs.comp_map

    # Reverse the map of library groups
    groups = Array.new(group_count) { |i| [] }
    library_to_group.each do |library, group_index|
        groups[group_index] << library
    end

    # Build a group graph of collapsed SCCs
    group_graph = RGL::DirectedAdjacencyGraph.new

    # One vertex per library group
    group_graph.add_vertices *(0...groups.size).to_a

    # Copy edges
    graph.each_edge do |from, to|
        from_group = library_to_group[from]
        to_group = library_to_group[to]
        if from_group != to_group
            group_graph.add_edge from_group, to_group
        end
    end

    # Traverse the groups in topological order and print out
    # the libraries in each group.
    group_graph.topsort_iterator.each do |i|
        if groups[i].size == 1
            puts groups[i][0]
        else
            puts "--start-group"
            puts groups[i]
            puts "--end-group"
        end
    end
end
