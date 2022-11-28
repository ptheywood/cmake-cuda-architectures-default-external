cmake_minimum_required(VERSION 3.18...3.25 FATAL_ERROR)

# Hardcode the CMAKE CUDA ARCHITECTURES - this is where users can force override it, but ideally they shouldnt. 
# set(CMAKE_CUDA_ARCHITECTURES "70")

# ------
# This block should be hidden from the user (and more complciated to allow for specifying a local version etc)
# fetch the lirbary repo which provides the cmake via fetch content.
include(FetchContent)
FetchContent_Declare(
    ccad
    GIT_REPOSITORY https://github.com/ptheywood/cmake-cuda-architectures-default
    GIT_TAG        ac71da89979770fdbf1ed6382963e3a806a46b07
    GIT_SHALLOW    OFF
    GIT_PROGRESS   ON
)
FetchContent_MakeAvailable(ccad)
# /-----

# The user then just has to call the provided cmake function before their project
ccad_record_and_inject(hello)

project(hello CXX CUDA)

# Or if not specifying up front, also call the explcicit apply method
# ccad_apply()

ccad_test()

add_executable(${PROJECT_NAME} src/main.cu)

target_link_libraries(${PROJECT_NAME} ccad)

# Users should probably suppress deprected targets too (unless I make this an option on the first / apply methods?)
target_compile_options(${PROJECT_NAME} PRIVATE "$<$<COMPILE_LANGUAGE:CUDA>:-Wno-deprecated-gpu-targets>")
target_link_options(${PROJECT_NAME} PRIVATE "$<DEVICE_LINK:-Wno-deprecated-gpu-targets>")