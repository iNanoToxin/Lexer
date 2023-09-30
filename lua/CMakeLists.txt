cmake_minimum_required(VERSION 3.26)
project(lua)

set(CMAKE_CXX_STANDARD 17)

add_executable(lua main.cpp
        tokenizer.h
        parser.h
        generation.h
)
