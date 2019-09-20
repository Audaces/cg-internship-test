if(__TARGET_LIBRARIES_INCLUDED)
  return()
endif()
set(__TARGET_LIBRARIES_INCLUDED TRUE)

# Copies the given dynamic libraries output to the target output.
#
# TARGET_DYNAMIC_LIBRARIES(_target <target> 
#                          ARGN [item1 [item2 [...]]]
#                          )
# 
# _target: the target to copy to.
# ARGN: a list of targets that _target depends on.
#
macro(TARGET_DYNAMIC_LIBRARIES _target)
  foreach(_dependency ${ARGN})
    add_custom_command(
      TARGET ${_target} POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy_if_different
      "$<TARGET_FILE:${_dependency}>"
      "$<TARGET_FILE_DIR:${_target}>"
    )
  endforeach()
endmacro()