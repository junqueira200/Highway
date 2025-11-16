cmake_minimum_required(VERSION 3.19)

project(Highway LANGUAGES CXX)

# Add Highway
add_subdirectory(external/highway)
find_package(Eigen3 3.3 REQUIRED)# NO_MODULE)

if (CMAKE_SYSTEM_PROCESSOR MATCHES "^(aarch64|arm64|ARM64)")
    message(STATUS ">> ARM detected")
    set(CMAKE_CXX_FLAGS "-O3")# -march=armv8-a+simd")

elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^(x86_64|AMD64|i686|x86)")
    message(STATUS ">> x86 detected")
    set(CMAKE_CXX_FLAGS "-O3")
else()
    message(WARNING "Unknown architecture: ${CMAKE_SYSTEM_PROCESSOR}")
endif()

#add_executable(teste main.cpp)
add_executable(teste payload.cpp driver.cpp)
target_include_directories(teste PRIVATE ${PROJECT_SOURCE_DIR})

target_link_libraries(teste PRIVATE hwy)
target_link_libraries(teste PRIVATE Eigen3::Eigen)
#target_include_directories(teste PRIVATE ${highway_SOURCE_DIR})
