cmake_minimum_required(VERSION 3.27)
project(Lua_Lexer)

set(CMAKE_CXX_STANDARD 20)

#--------------------------------FETCH-LUAU--------------------------------#
include(FetchContent)
FetchContent_Declare(
    Luau
    GIT_REPOSITORY https://github.com/luau-lang/luau.git
    GIT_TAG master
)
FetchContent_MakeAvailable(Luau)
#--------------------------------FETCH-LUAU--------------------------------#

file(GLOB_RECURSE SOURCE_FILES "src/*.cpp")

add_executable(${CMAKE_PROJECT_NAME} main.cpp ${SOURCE_FILES})

target_include_directories(${CMAKE_PROJECT_NAME} PUBLIC "src")
target_link_libraries(${CMAKE_PROJECT_NAME} Luau.Compiler Luau.VM)
