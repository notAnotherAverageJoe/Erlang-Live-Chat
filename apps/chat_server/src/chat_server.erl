-module(chat_server).
-export([start/0]).

start() ->
    application:ensure_all_started(ranch),
    application:ensure_all_started(cowboy),
    Dispatch = cowboy_router:compile([
        {'_', [{"/ws", chat_handler, []}]}
    ]),
    {ok, _} = cowboy:start_clear(my_http_listener, [{port, 8080}], #{
        env => #{dispatch => Dispatch}
    }),
    io:format("Chat server running on port 8080~n"),
    timer:sleep(infinity).
