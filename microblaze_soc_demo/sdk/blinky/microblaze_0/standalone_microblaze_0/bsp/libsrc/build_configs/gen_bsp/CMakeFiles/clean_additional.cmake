# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "C:\\Users\\alexa\\vivado_projects\\microblaze_soc_demo\\sdk\\blinky\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\sleep.h"
  "C:\\Users\\alexa\\vivado_projects\\microblaze_soc_demo\\sdk\\blinky\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\xiltimer.h"
  "C:\\Users\\alexa\\vivado_projects\\microblaze_soc_demo\\sdk\\blinky\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\xtimer_config.h"
  "C:\\Users\\alexa\\vivado_projects\\microblaze_soc_demo\\sdk\\blinky\\microblaze_0\\standalone_microblaze_0\\bsp\\lib\\libxiltimer.a"
  )
endif()
