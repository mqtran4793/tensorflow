cmake_minimum_required(VERSION 3.5)
project(label_image)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g -Wall")

set(SOURCE_FILES label_image.cpp)

add_executable(label_image ${SOURCE_FILES})

# CUDA libs
find_package(CUDA REQUIRED)
include_directories(${CUDA_INCLUDE_DIRS})
target_link_libraries(label_image ${CUDA_LIBRARIES})


# ==================== PATHS TO SPECIFY! ==================== #

# The third-party library path required by TensorFlow. If eigen, absl, and protobuf are not explicitly specified, they may report no such file or directory error.
include_directories("/usr/local/include")
include_directories("/usr/local/include/eigen")
include_directories("/usr/local/include/absl")
include_directories("/usr/local/include/protobuf/src")

# TensorFlow header file path
include_directories("/usr/local/include/tf/")
include_directories("/usr/local/include/tf/bazel-genfiles/")
include_directories("/usr/local/include/tf/tensorflow/")
include_directories("/usr/local/include/tf/third-party/")

# TensorFlow Dynamic Link Library Path
target_link_libraries(label_image "/usr/local/lib/libtensorflow_cc.so")
