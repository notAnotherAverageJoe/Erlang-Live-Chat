-module(chat_handler).
-export([init/2, websocket_init/1, websocket_handle/2, websocket_info/2]).

init(Req, State) ->
    {cowboy_websocket, Req, State}.

websocket_init(State) ->
    {ok, State}.

websocket_handle({text, Msg}, State) ->
    io:format("Received: ~p~n", [Msg]),
    {reply, {text, Msg}, State}.

websocket_info(_Info, State) ->
    {ok, State}.
