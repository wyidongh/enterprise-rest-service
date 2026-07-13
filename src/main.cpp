#include <iostream>
#include <string>
#include <thread>
#include <chrono>

int main()
{
    std::cout 
        << "Enterprise REST Service Started"
        << std::endl;

    std::cout
        << "Version: "
        << "1.0.0"
        << std::endl;


    while (true)
    {
        std::cout 
            << "Service running..."
            << std::endl;

        std::this_thread::sleep_for(
            std::chrono::seconds(10)
        );
    }


    return 0;
}
