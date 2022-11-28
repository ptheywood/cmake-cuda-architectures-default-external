# CMake CUDA Architectures Default Value External Repo

This repo is for developing / testing nicely setting a default value for `CMAKE_CUDA_ARCHITECTURES`, while allowing users to provide their own value, but when the library providing the default (and hopefully the relevant CMake Logic) is a fetch content'd repository. 

Unfortunately with how `CMAKE_CUDA_ARCHITECTURES` is implemeneted, this requires CMake code prior to the enabling of the CUDA laguage, including when used as a project language.


## Usage


```bash
mkdir -p build && cd build
cmake ..
cmake --build .
```

Optionally set `CUDAARCHS` as an environment variable before the first configure, or set `CMAKE_CUDA_ARCHITECTURES` on any configure. Unset to revert to default (all-major equivalent).