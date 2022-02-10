# 设置系统名
set(CMAKE_SYSTEM_NAME Linux)

# 设置硬件平台(不是必需的)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(tools /opt/toolchain-arm_cortex-a7+neon_gcc-5.3.0_glibc-2.22_eabi)
set(my_cross arm-openwrt-linux-)
set(CMAKE_C_COMPILER ${tools}/bin/${my_cross}gcc)
set(CMAKE_CXX_COMPILER ${tools}/bin/${my_cross}g++)

# here is the target environment located
# 设置目标环境路径
SET(CMAKE_FIND_ROOT_PATH ${tools})

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search
# programs in the host environment
# 指示CMake在目标环境中查找头文件和库文件
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
