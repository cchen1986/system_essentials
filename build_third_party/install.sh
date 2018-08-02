#!/bin/bash -e

CURRENT_DIR=`pwd`
INSTALLATION_DIR=~/third_party/installation
PACKAGE_NAME="OpenCV"

# Check OS
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  OUTPUT_DIR=$CURRENT_DIR/linux
  echo "Building $PACKAGE_NAME on Linux."
elif [[ "$OSTYPE" == "darwin"* ]]; then
  OUTPUT_DIR=$CURRENT_DIR/mac
  echo "Building $PACKAGE_NAME on Mac."
fi
exit

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

if [ ! -d tmp ]; then
  mkdir tmp
fi

# Get package
if [ ! -d tmp/opencv ]; then
    cd tmp
    git clone https://github.com/opencv/opencv.git
    cd ..
fi

# Get opencv_contrib
if [ ! -d tmp/opencv_contrib ]; then
    cd tmp
    git clone https://github.com/opencv/opencv_contrib.git
    cd ..
fi

# Build Ceres
cd tmp/opencv
if [ -d build ]; then
    rm -rf build
    mkdir build && cd build
else
    mkdir build && cd build
fi

export PATH=$INSTALLATION_DIR:$PATH
cmake \
  -DOPENCV_EXTRA_MODULES_PATH=$CURRENT_DIR/tmp/opencv_contrib/modules/ \
  -DBUILD_SHARED_LIBS:BOOL=OFF \
  -DBUILD_opencv_apps:BOOL=OFF \
  -DCMAKE_BUILD_TYPE=release \
  -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=TRUE \
  -DBUILD_DOCS:BOOL=OFF \
  -DWITH_LAPACK:BOOL=OFF \
  -DWITH_OPENEXR:BOOL=OFF \
  -DWITH_OPENCL:BOOL=OFF \
  -DWITH_OPENCLAMDFFT:BOOL=OFF \
  -DWITH_OPENCLAMDBLAS:BOOL=OFF \
  -DWITH_VTK:BOOL=OFF \
  -DWITH_GTK:BOOL=OFF \
  -DWITH_CUDA:BOOL=OFF \
  -DWITH_ITT:BOOL=OFF \
  -DWITH_MATLAB:BOOL=OFF \
  -DWITH_WEBP:BOOL=OFF \
  -DCMAKE_INSTALL_PREFIX=$INSTALLATION_DIR ..

# Compile and Install
make -j 8
make install

rm $OUTPUT_DIR/lib/*
rm -rf $OUTPUT_DIR/include && mkdir $OUTPUT_DIR/include
rm -rf $OUTPUT_DIR/3rdparty
cp $INSTALLATION_DIR/lib/libopencv*.a $OUTPUT_DIR/lib/.
cp -r $INSTALLATION_DIR/include/opencv $OUTPUT_DIR/include/.
cp -r $INSTALLATION_DIR/include/opencv2 $OUTPUT_DIR/include/.
cp -r $INSTALLATION_DIR/share/OpenCV/3rdparty $OUTPUT_DIR/.
