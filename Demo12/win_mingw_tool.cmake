# the name of the target operating system
SET(CMAKE_SYSTEM_NAME Windows)

# which compilers to use for C and C++
set(TOOL_DIR C:/msys64/mingw64/bin)
SET(CMAKE_C_COMPILER ${TOOL_DIR}/gcc)
SET(CMAKE_CXX_COMPILER ${TOOL_DIR}/g++)
SET(CMAKE_RC_COMPILER ${TOOL_DIR}/windres)

# here is the target environment located
SET(CMAKE_FIND_ROOT_PATH ${TOOL_DIR}/../)

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
