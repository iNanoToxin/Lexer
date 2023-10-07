cmake_minimum_required(VERSION 3.26)
project(lua)

set(CMAKE_CXX_STANDARD 20)

add_executable(lua main.cpp
        Tokenizer.cpp
        Tokenizer.h
#        parser_old.h
#        generation.h
        Parser.cpp
        Parser.h
        Node.cpp
        Node.h
#        Base.cpp
        Base.h
        Kind.cpp
        Kind.h
)

#target_include_directories(lua PUBLIC include)