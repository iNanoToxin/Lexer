cmake_minimum_required(VERSION 3.26)
project(lua)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(FetchContent)
FetchContent_Declare(fmt
    GIT_REPOSITORY https://github.com/fmtlib/fmt.git
    GIT_TAG master
)
FetchContent_MakeAvailable(fmt)

add_executable(lua main.cpp
    src/Tokenizer.cpp
    src/Parser.cpp
    src/Node.cpp
    src/Base.cpp
    src/Kind.cpp
    src/Generation.cpp
)

find_package(Threads REQUIRED)
target_include_directories(lua PUBLIC include)
target_link_libraries(lua fmt::fmt Threads::Threads)