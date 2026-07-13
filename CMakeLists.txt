cmake_minimum_required(VERSION 3.20)

project(
    EnterpriseRestService
    VERSION 1.0.0
    LANGUAGES CXX
)


set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


################################
# Application
################################

add_executable(
    enterprise-service
    src/main.cpp
)



################################
# GoogleTest
################################

enable_testing()


add_subdirectory(
    third_party/googletest
)


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
