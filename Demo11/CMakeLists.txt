cmake_minimum_required(VERSION 3.0.0)
project(Demo11 VERSION 0.1.0)

# 设置库名
set(my_lib_name MathFunctions)

# 添加模块路径
SET(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} "${CMAKE_SOURCE_DIR}/math/dist/windows")

# 寻找模块
find_package(${my_lib_name} REQUIRED)

# 生成可执行程序
add_executable(Demo11 main.cpp)

# 链接库文件
target_link_libraries(${PROJECT_NAME} ${my_lib_name}::${my_lib_name})