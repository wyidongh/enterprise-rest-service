#include <gtest/gtest.h>


TEST(
    VersionTest,
    CheckVersion
)
{

    std::string version="1.0.0";


    EXPECT_EQ(
        version,
        "1.0.0"
    );

}
