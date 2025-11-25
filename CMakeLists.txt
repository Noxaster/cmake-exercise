cmake_minimum_required(VERSION 3.16)
project(cmake_exercise)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(deal.II REQUIRED)
find_package(yaml-cpp REQUIRED)

add_executable(main
    main.cpp
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    fem/fem.cpp
    yamlParser/yamlParser.cpp
)

target_link_libraries(main Boost::filesystem yaml-cpp)

DEAL_II_SETUP_TARGET(main)