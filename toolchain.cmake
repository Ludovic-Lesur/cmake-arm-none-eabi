#
# toolchain.cmake
#
#  Created on: 10 dec. 2025
#      Author: Ludo
#

# Target operating system and processor.
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Toolchain prefix and extension.
set(TOOLCHAIN_PREFIX "arm-none-eabi-")
if(WIN32)
    set(TOOLCHAIN_EXTENSION ".exe")
else()
    set(TOOLCHAIN_EXTENSION "")
endif()

# Toolchain location.
message(STATUS "Toolchain file: ${CMAKE_TOOLCHAIN_FILE}")
if(DEFINED TOOLCHAIN_PATH AND NOT TOOLCHAIN_PATH STREQUAL "")
    message(STATUS "Toolchain path found.")
else()
    message(STATUS "Toolchain path missing.")
endif()
set(TOOLCHAIN_BIN_PATH ${TOOLCHAIN_PATH}/bin)
message(STATUS "Toolchain path: ${TOOLCHAIN_BIN_PATH}")

# Configure toolchain.
set(CMAKE_C_COMPILER ${TOOLCHAIN_BIN_PATH}/${TOOLCHAIN_PREFIX}gcc${TOOLCHAIN_EXTENSION})
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_BIN_PATH}/${TOOLCHAIN_PREFIX}g++${TOOLCHAIN_EXTENSION})
set(CMAKE_ASM_COMPILER ${TOOLCHAIN_BIN_PATH}/${TOOLCHAIN_PREFIX}gcc${TOOLCHAIN_EXTENSION})
set(CMAKE_LINKER ${TOOLCHAIN_BIN_PATH}/${TOOLCHAIN_PREFIX}gcc${TOOLCHAIN_EXTENSION})
set(CMAKE_SIZE_UTIL ${TOOLCHAIN_BIN_PATH}/${TOOLCHAIN_PREFIX}size${TOOLCHAIN_EXTENSION})
set(CMAKE_OBJCOPY ${TOOLCHAIN_BIN_PATH}/${TOOLCHAIN_PREFIX}objcopy${TOOLCHAIN_EXTENSION})
set(CMAKE_OBJDUMP ${TOOLCHAIN_BIN_PATH}/${TOOLCHAIN_PREFIX}objdump${TOOLCHAIN_EXTENSION})
set(CMAKE_NM_UTIL ${TOOLCHAIN_BIN_PATH}/${TOOLCHAIN_PREFIX}gcc-nm${TOOLCHAIN_EXTENSION})
set(CMAKE_AR ${TOOLCHAIN_BIN_PATH}/${TOOLCHAIN_PREFIX}gcc-ar${TOOLCHAIN_EXTENSION})
set(CMAKE_RANLIB ${TOOLCHAIN_BIN_PATH}/${TOOLCHAIN_PREFIX}gcc-ranlib${TOOLCHAIN_EXTENSION})

# Searching method.
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# Compilation and linker flags.
set(CMAKE_C_FLAGS "-std=gnu11 -mthumb -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialised -Wall -Wextra -Wno-scalar-storage-order -g3")
set(CMAKE_EXE_LINKER_FLAGS "-Xlinker --gc-sections ")
