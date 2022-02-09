# CMake 最低版本号要求
cmake_minimum_required (VERSION 2.8)

# 项目信息
project (Demo9)

set(SRC_DIR ./src)

# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_LIB_SRCS 变量
aux_source_directory(${SRC_DIR} DIR_LIB_SRCS)

# 指定生成 MathFunctions 链接库
add_library (MathFunctions STATIC ${DIR_LIB_SRCS})
add_library (MathFunctions_shared SHARED ${DIR_LIB_SRCS})

message(status "project source dir is ${PROJECT_SOURCE_DIR}")

set(INSTALL_PATH ${PROJECT_SOURCE_DIR}/dist)

# 指定 MathFunctions 库的安装路径
install (TARGETS MathFunctions DESTINATION ${INSTALL_PATH}/lib)
install (TARGETS MathFunctions_shared DESTINATION ${INSTALL_PATH}/lib)
install (FILES ${SRC_DIR}/MathFunctions.h DESTINATION ${INSTALL_PATH}/include)



