# 1. mkdir build && cd build
# 2. cmake .. --no-warn-unused-cli -Wno-dev -DCMAKE_BUILD_TYPE:STRING=Debug -DCMAKE_TOOLCHAIN_FILE=%cd%\..\win_mingw_tool.cmake -G "MinGW Makefiles"
# 3. mingw32-make

# which compilers to use for C and C++
set(CMAKE_C_COMPILER "F:/Qt/Qt5.14.2/Tools/mingw730_64/bin/gcc.exe")
set(CMAKE_CXX_COMPILER "F:/Qt/Qt5.14.2/Tools/mingw730_64/bin/g++.exe")

# 设置编译选项
set(CMAKE_C_FLAGS "-Wall")
set(CMAKE_CXX_FLAGS "-Wall")
