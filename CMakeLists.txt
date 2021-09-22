cmake_minimum_required(VERSION 3.2)
project(SDCafiine CXX)
include("${DEVKITPRO}/wut/share/wut.cmake" REQUIRED)

add_executable(SDCafiine main.cpp)
wut_create_rpx(SDCafiine.rpx SDCafiine)