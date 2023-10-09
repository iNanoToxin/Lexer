cmake_minimum_required(VERSION 3.26)
project(Lua)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(FetchContent)
FetchContent_Declare(fmt
    GIT_REPOSITORY https://github.com/fmtlib/fmt.git
    GIT_TAG master
)
FetchContent_MakeAvailable(fmt)

file(GLOB sourceFiles "src/*")
add_executable(Lua main.cpp ${sourceFiles})

find_package(Threads REQUIRED)
target_include_directories(Lua PUBLIC include)
target_link_libraries(Lua fmt::fmt Threads::Threads)