rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_CXX_FLAGS="-DHWY_COMPILE_ALL_ATTAINABLE"
make -j4
