#
# artifact.cmake
#
#  Created on: 11 dec. 2025
#      Author: Ludo
#

# Print size.
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD 
    COMMAND ${CMAKE_SIZE_UTIL} ${PROJECT_NAME}.elf
)

# Convert to hex file.
add_custom_target(${PROJECT_NAME}.hex ALL 
    DEPENDS ${PROJECT_NAME}
    BYPRODUCTS ${PROJECT_NAME}.hex
    COMMAND ${CMAKE_OBJCOPY} -Oihex  ${PROJECT_NAME}.elf ${PROJECT_NAME}.hex
)

# Convert to bin file.
add_custom_target(${PROJECT_NAME}.bin ALL
    DEPENDS ${PROJECT_NAME}
    BYPRODUCTS ${PROJECT_NAME}.bin
    COMMAND ${CMAKE_OBJCOPY} -Obinary  ${PROJECT_NAME}.elf ${PROJECT_NAME}.bin
)
