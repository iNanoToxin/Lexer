cmake_minimum_required(VERSION 3.27)
project(Lua_Lexer)

set(CMAKE_CXX_STANDARD 20)

include(FetchContent)
FetchContent_Declare(fmt
    GIT_REPOSITORY https://github.com/fmtlib/fmt.git
    GIT_TAG master
)
FetchContent_MakeAvailable(fmt)

file(GLOB_RECURSE SOURCE_FILES "src/*.cpp")

add_executable(${CMAKE_PROJECT_NAME} main.cpp ${SOURCE_FILES})

find_package(Threads REQUIRED)
target_include_directories(${CMAKE_PROJECT_NAME} PUBLIC "src")
target_link_libraries(${CMAKE_PROJECT_NAME} fmt::fmt Threads::Threads)
