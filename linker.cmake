#
# linker.cmake
#
#  Created on: 11 dec. 2025
#      Author: Ludo
#

# Output file extension.
set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".elf")

# Linker script.
target_link_options(${PROJECT_NAME} 
    PUBLIC
        "-T${PROJECT_LINKER_PATH}/${PROJECT_LINKER_SCRIPT}"
        "-L${PROJECT_LINKER_PATH}"
)
