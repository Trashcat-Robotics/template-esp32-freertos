file(GLOB_RECURSE app_sources ${CMAKE_SOURCE_DIR}/main/*.c)

file(GLOB_RECURSE app_hdrs ${CMAKE_SOURCE_DIR}/main/*.h)

idf_component_register(
  SRCS
  ${app_sources}
  ${app_hdrs}
  INCLUDE_DIRS
  ${CMAKE_SOURCE_DIR}/main/
  REQUIRES
  unity)
