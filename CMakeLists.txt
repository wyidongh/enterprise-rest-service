cmake_minimum_required(
	VERSION 3.20
	FATAL_ERROR
	)
cmake_policy(VERSION 3.20)

project(
    EnterpriseRestService
    VERSION 1.0.0
    LANGUAGES CXX
)


set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)



################################
# Dependencies
################################

include(FetchContent)


################################
# GoogleTest
################################

FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/refs/tags/v1.14.0.zip
)


FetchContent_MakeAvailable(googletest)



################################
# Pistache
################################


################################
# Pistache HTTP Framework
################################

include(FetchContent)

set(PISTACHE_BUILD_TESTS OFF CACHE BOOL "Disable Pistache tests" FORCE)
set(BUILD_TESTING OFF CACHE BOOL "Disable all tests" FORCE)

FetchContent_Declare(
    pistache
    GIT_REPOSITORY https://github.com/pistacheio/pistache.git
    GIT_TAG v0.4.26
)


FetchContent_MakeAvailable(pistache)


################################
# Application
################################


add_executable(
    enterprise-service
    src/main.cpp
)


target_link_libraries(
    enterprise-service
    PRIVATE
    pistache
)



################################
# Tests
################################


enable_testing()


add_executable(
    version_test
    tests/unit/version_test.cpp
)


target_link_libraries(
    version_test
    GTest::gtest_main
)


include(GoogleTest)

gtest_discover_tests(version_test)



################################
# Install
################################

install(
    TARGETS enterprise-service
    DESTINATION bin
)

