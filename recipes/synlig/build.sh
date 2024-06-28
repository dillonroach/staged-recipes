#! /bin/bash

set -e
set -x

export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"

mkdir build
cd build

cmake ${CMAKE_ARGS} \
    -DCMAKE_CXX_STANDARD=17 \
    -DSYNLIG_USE_HOST_ALL=ON \
    -DCMAKE_INSTALL_RPATH=$PREFIX/lib \
    -DPython3_EXECUTABLE="$PYTHON" \
    -Dyosys_DIR="$PREFIX/lib/cmake/yosys" \
    -DSYNLIG_WITH_TCMALLOC=OFF \
    -DSYNLIG_USE_HOST_YOSYS=ON \
    ..

make -j${CPU_COUNT}
make install
