#!/bin/bash -e

CURRENT_DIR=`pwd`
INSTALLATION_DIR=~/third_party/installation

PACKAGE_NAME="Lemon Graph"
PACKAGE_VERSIONED_DIR="lemon-1.3.1"
PACKAGE_TARBALL="$PACKAGE_VERSIONED_DIR.tar.gz"
PACKAGE_SOURCE="http://lemon.cs.elte.hu/pub/sources/$PACKAGE_TARBALL"
LIB_NAME="libemon"
INCLUDE_DIR="lemon"

# If use_wget==true, will use wget to download the package. Otherwise, use git.
use_wget=true

# Check OS
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  OUTPUT_DIR=$CURRENT_DIR/linux
  echo "Building $PACKAGE_NAME on Linux."
elif [[ "$OSTYPE" == "darwin"* ]]; then
  OUTPUT_DIR=$CURRENT_DIR/mac
  echo "Building $PACKAGE_NAME on Mac."
fi

if [ ! -d $OUTPUT_DIR ]; then
    mkdir -p $OUTPUT_DIR
fi

# Make sure there is an installation/ folder
if [ ! -d $INSTALLATION_DIR ]; then
    echo "Installation folder created."
    mkdir -p $INSTALLATION_DIR/include
    mkdir -p $INSTALLATION_DIR/lib
fi

# Make lib/ and include/ folders under current directory
if [ ! -d $OUTPUT_DIR/include ]; then
    mkdir -p $OUTPUT_DIR/include
fi

if [ ! -d $OUTPUT_DIR/lib ]; then
    mkdir -p $OUTPUT_DIR/lib
fi

# make a tmp folder for compiling the code.
if [ ! -d tmp ]; then
  mkdir tmp
fi

# Get package
if [ ! -d tmp/$PACKAGE_VERSIONED_DIR ]; then
    cd tmp
    wget $PACKAGE_SOURCE
    tar xzvf $PACKAGE_TARBALL
    cd ..
fi

# Prepare the build folder.
cd tmp/$PACKAGE_VERSIONED_DIR
if [ -d build ]; then
    rm -rf build
    mkdir build && cd build
else
    mkdir build && cd build
fi

# Build the package
export PATH=$INSTALLATION_DIR:$PATH
cmake \
  -DBUILD_SHARED_LIBS:BOOL=OFF \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=TRUE \
  -DBUILD_DOCS:BOOL=OFF \
  -DLEMON_DOC_SOURCE_BROWSER=NO \
  -DLEMON_DOC_USE_MATHJAX=NO \
  -DCMAKE_INSTALL_PREFIX=$INSTALLATION_DIR ..

# Compile and Install
make
# make -j 8
make install

# Remove existing lib.
if [ -d $OUTPUT_DIR/lib/ ]; then
  if [ "$(ls -A $OUTPUT_DIR/lib)" ]; then
    rm $OUTPUT_DIR/lib/*
  fi
fi

# Remove existing include files.
if [ -d $OUTPUT_DIR/include/ ]; then
  rm -rf $OUTPUT_DIR/include && mkdir $OUTPUT_DIR/include
fi

cp $INSTALLATION_DIR/lib/$LIB_NAME*.a $OUTPUT_DIR/lib/.
cp -r $INSTALLATION_DIR/include/$INCLUDE_DIR $OUTPUT_DIR/include/.
