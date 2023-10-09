cmake_minimum_required(VERSION 3.26)
project(lua)

set(CMAKE_CXX_STANDARD 20)

add_executable(lua main.cpp
    include/Tokenizer.h
    include/Parser.h
    include/Node.h
    include/Base.h
    include/Kind.h
    include/Generation.h

    src/Tokenizer.cpp
    src/Parser.cpp
    src/Node.cpp
    src/Base.cpp
    src/Kind.cpp
    src/Generation.cpp
)

target_include_directories(lua PUBLIC include)