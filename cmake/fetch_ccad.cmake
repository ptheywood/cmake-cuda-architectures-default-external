# ------
# This block should be hidden from the user (and more complciated to allow for specifying a local version etc)
# fetch the lirbary repo which provides the cmake via fetch content.
include(FetchContent)
FetchContent_Declare(
    ccad
    GIT_REPOSITORY https://github.com/ptheywood/cmake-cuda-architectures-default
    GIT_TAG        1d02bdf657170c1e24b3145f12d3508ba52df23c
    GIT_SHALLOW    OFF
    GIT_PROGRESS   ON
)
FetchContent_MakeAvailable(ccad)
# /-----