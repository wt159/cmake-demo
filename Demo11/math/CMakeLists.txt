# CMake 最低版本号要求
cmake_minimum_required (VERSION 3.0)

# 项目信息
project (Demo10)

set(SRC_DIR ./src)
set(LIB_NAME MathFunctions)

# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_LIB_SRCS 变量
aux_source_directory(${SRC_DIR} DIR_LIB_SRCS)

# 指定生成 MathFunctions 链接库
add_library (${LIB_NAME} STATIC ${DIR_LIB_SRCS})
add_library (${LIB_NAME}_shared SHARED ${DIR_LIB_SRCS})

# 指定动态库的输出名称
set_target_properties(${LIB_NAME}_shared PROPERTIES OUTPUT_NAME ${LIB_NAME})
# 使动态库和静态库同时存在
set_target_properties(${LIB_NAME} PROPERTIES CLEAN_DIRECT_OUTPUT 1)
set_target_properties(${LIB_NAME}_shared PROPERTIES CLEAN_DIRECT_OUTPUT 1)

# 根据操作系统，设置不同的文件夹
if(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
set(INSTALL_PATH ${PROJECT_SOURCE_DIR}/dist/windows)
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
set(INSTALL_PATH ${PROJECT_SOURCE_DIR}/dist/linux)
endif()

# 指定 MathFunctions 库的安装路径
# install (TARGETS ${LIB_NAME} DESTINATION ${INSTALL_PATH}/lib)
# install (TARGETS ${LIB_NAME}_shared DESTINATION ${INSTALL_PATH}/lib)
# install (FILES ${SRC_DIR}/MathFunctions.h DESTINATION ${INSTALL_PATH}/include)

# 指定库文件安装目录
SET(CMAKE_INSTALL_PREFIX ${INSTALL_PATH})

target_include_directories(${LIB_NAME} PUBLIC
    # 包含生成库文件所需的路径
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>  
    #为自定义module生成保护路径,使用module时不用再include了
    $<INSTALL_INTERFACE:include>)   

# 定义有哪些头文件
set_target_properties(${LIB_NAME} PROPERTIES PUBLIC_HEADER "src/${LIB_NAME}.h")

# 安装库文件
install(
    # 安装目标
    TARGETS ${LIB_NAME} ${LIB_NAME}_shared
    # 导出安装库文件信息(为了生成module)
    EXPORT ${LIB_NAME}-targets
    # 头文件
    PUBLIC_HEADER DESTINATION include
    # 动态库
    ARCHIVE DESTINATION lib
    # 静态库
    LIBRARY DESTINATION lib
    # 可执行程序
    RUNTIME DESTINATION bin)

# 生成MathFunctions-config.cmake文件
install(
    # 库文件信息
    EXPORT ${LIB_NAME}-targets
    # 加上名字空间(定义了则使用时也需加上)
    NAMESPACE ${LIB_NAME}::
    # 生成<lib_name>-config.cmake文件
    FILE ${LIB_NAME}-config.cmake
    DESTINATION lib/cmake/${LIB_NAME})