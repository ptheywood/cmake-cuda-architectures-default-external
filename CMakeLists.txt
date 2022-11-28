cmake_minimum_required(VERSION 3.18...3.25 FATAL_ERROR)

# Hardcode the CMAKE CUDA ARCHITECTURES - this is where users can force override it, but ideally they shouldnt. 
# set(CMAKE_CUDA_ARCHITECTURES "70")

# Include the upstream project which imports the CUDA_ARCHITECTURES logic functions.
include(${CMAKE_CURRENT_LIST_DIR}/cmake/fetch_ccad.cmake)

# The user then just has to call the provided cmake function before their project
ccad_init_cuda_architectures(PROJECT hello)

project(hello CXX CUDA)

# Or if not specifying up front, also call the explcicit set method
# ccad_set_cuda_architectures()

# Print the current value of CMAKE_CUDA_ARCHITECTURES as a test
message(STATUS "${CMAKE_CURRENT_LIST_FILE} :: ${CMAKE_CUDA_ARCHITECTURES}")

add_executable(${PROJECT_NAME} src/main.cu)

target_link_libraries(${PROJECT_NAME} ccad)

# Users should probably suppress deprected targets too (unless I make this an option on the first / apply methods?)
target_compile_options(${PROJECT_NAME} PRIVATE "$<$<COMPILE_LANGUAGE:CUDA>:-Wno-deprecated-gpu-targets>")
target_link_options(${PROJECT_NAME} PRIVATE "$<DEVICE_LINK:-Wno-deprecated-gpu-targets>")