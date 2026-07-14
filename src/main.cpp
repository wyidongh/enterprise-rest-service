#include <pistache/endpoint.h>
#include <pistache/router.h>
#include <iostream>


using namespace Pistache;


int main()
{
    Http::Endpoint server(
        Address("0.0.0.0", Port(8090))
    );


    auto opts = Http::Endpoint::options()
                    .threads(2);


    Rest::Router router;


    Rest::Routes::Get(
        router,
        "/",
        [](const Rest::Request&,
           Http::ResponseWriter response)
        -> Rest::Route::Result
        {
            response.send(
                Http::Code::Ok,
                "Enterprise REST Service"
            );

            return Rest::Route::Result::Ok;
        }
    );


    Rest::Routes::Get(
        router,
        "/health",
        [](const Rest::Request&,
           Http::ResponseWriter response)
        -> Rest::Route::Result
        {
            response.send(
                Http::Code::Ok,
                R"({"status":"ok"})"
            );

            return Rest::Route::Result::Ok;
        }
    );


    Rest::Routes::Get(
        router,
        "/version",
        [](const Rest::Request&,
           Http::ResponseWriter response)
        -> Rest::Route::Result
        {
            response.send(
                Http::Code::Ok,
                R"({"version":"1.0.0"})"
            );

            return Rest::Route::Result::Ok;
        }
    );


    server.init(opts);

    server.setHandler(router.handler());


    std::cout
        << "Enterprise REST Service Started"
        << std::endl;


    server.serve();


    return 0;
}
