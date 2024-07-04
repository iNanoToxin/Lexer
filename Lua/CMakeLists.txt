cmake_minimum_required(VERSION 3.27)
project(Lua_Lexer)

set(CMAKE_CXX_STANDARD 20)
include(FetchContent)

#--------------------------------FETCH-LUAU--------------------------------#
FetchContent_Declare(
    Luau
    GIT_REPOSITORY https://github.com/luau-lang/luau.git
    GIT_TAG master
)
FetchContent_MakeAvailable(Luau)
#--------------------------------FETCH-LUAU--------------------------------#

#--------------------------------FETCH-FMT---------------------------------#
FetchContent_Declare(fmt
    GIT_REPOSITORY https://github.com/fmtlib/fmt.git
    GIT_TAG master
)
FetchContent_MakeAvailable(fmt)
#--------------------------------FETCH-FMT---------------------------------#

file(GLOB_RECURSE SOURCE_FILES "src/*.cpp")


add_executable(${CMAKE_PROJECT_NAME} main.cpp ${SOURCE_FILES})
target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE "src")
target_link_libraries(${CMAKE_PROJECT_NAME} fmt::fmt Luau.Compiler Luau.VM Luau.Analysis)
