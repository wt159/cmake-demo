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


message(STATUS "project source dir is ${PROJECT_SOURCE_DIR}")

message(STATUS "system name is ${CMAKE_SYSTEM_NAME}")

# 根据操作系统，设置不同的文件夹
if(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
set(INSTALL_PATH ${PROJECT_SOURCE_DIR}/dist/windows)
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
set(INSTALL_PATH ${PROJECT_SOURCE_DIR}/dist/linux)
endif()

message("install path is ${INSTALL_PATH}")

# 指定 MathFunctions 库的安装路径
# install (TARGETS ${LIB_NAME} DESTINATION ${INSTALL_PATH}/lib)
# install (TARGETS ${LIB_NAME}_shared DESTINATION ${INSTALL_PATH}/lib)
# install (FILES ${SRC_DIR}/MathFunctions.h DESTINATION ${INSTALL_PATH}/include)


SET(CMAKE_INSTALL_PREFIX ${INSTALL_PATH})

target_include_directories(${LIB_NAME} PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
    $<INSTALL_INTERFACE:include>)
message("current source dir is ${CMAKE_CURRENT_SOURCE_DIR}")

set_target_properties(${LIB_NAME} PROPERTIES PUBLIC_HEADER "src/${LIB_NAME}.h")

install(TARGETS ${LIB_NAME} ${LIB_NAME}_shared
    EXPORT ${LIB_NAME}-targets
    PUBLIC_HEADER DESTINATION include
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin)

	install(EXPORT ${LIB_NAME}-targets
    NAMESPACE ${LIB_NAME}::
    FILE ${LIB_NAME}-config.cmake
    DESTINATION lib/cmake/${LIB_NAME})


