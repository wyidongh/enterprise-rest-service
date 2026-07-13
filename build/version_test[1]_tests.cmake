add_test([=[VersionTest.CheckVersion]=]  /home/dong/devops/temp/enterprise-rest-service/build/version_test [==[--gtest_filter=VersionTest.CheckVersion]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[VersionTest.CheckVersion]=]  PROPERTIES DEF_SOURCE_LINE /home/dong/devops/temp/enterprise-rest-service/tests/unit/version_test.cpp:4 WORKING_DIRECTORY /home/dong/devops/temp/enterprise-rest-service/build SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
set(  version_test_TESTS VersionTest.CheckVersion)
