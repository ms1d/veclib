cmake_minimum_required(VERSION 3.26)

add_library(veclib INTERFACE)

include(FetchContent)

FetchContent_Declare(
    commonlib
    GIT_REPOSITORY https://github.com/ms1d/commonlib
    GIT_TAG        main
)

FetchContent_MakeAvailable(commonlib)

target_include_directories(veclib INTERFACE include)
target_link_libraries(veclib INTERFACE commonlib)

if (BUILD_TESTS)
	add_subdirectory(test)
endif()
