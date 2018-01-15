cc_library(
    name = "lemon_graph_lib",
    srcs = select({
        "@deepmap//:darwin": ["mac/lib/libemon.a"],
        "//conditions:default": [
            "linux/lib/libemon.a",
        ],
    }),
    hdrs = select({
        "@deepmap//:darwin": glob([
            "mac/**/*.hpp",
            "mac/**/*.h",
        ]),
        "//conditions:default": glob([
            "linux/**/*.hpp",
            "linux/**/*.h",
        ]),
    }),
    includes = select({
        "@deepmap//:darwin": ["mac/include"],
        "//conditions:default": ["linux/include"],
    }),
    linkstatic = 1,
    visibility = ["//visibility:public"],
)
