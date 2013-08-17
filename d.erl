-module(d).

-export([c/1, d/1]).

-define(DEBUG_OPTIONS, [debug_info, {d, 'DEBUG'}, {d, 'TEST'}]).

%% API

c(Module) when is_atom(Module) ->
    
    case get_module_info(Module) of
        {ok, Source, Options} ->
            
            %% Module will be loaded dynamicly, except for those are in use.
            case lists:member({d, 'TEST'}, Options) of
                true ->
                    io:format("debug ON~n");
                _False -> io:format("debug OFF~n")
                              end,
            c:c(Source, Options);
        Error -> Error
                     end.

d(Module) when is_atom(Module) ->
    case get_module_info(Module) of
        {ok, Source, Options} ->
            Macros = proplists:get_all_values(d, Options),
            Options1 = case lists:member('DEBUG', Macros) of
                           true ->
                               io:format("debug OFF~n"),
                               Options -- ?DEBUG_OPTIONS;
                           false ->
                               io:format("debug ON~n"),
                               ?DEBUG_OPTIONS ++ Options
                                   end,
            c:c(Source, Options1);
        Error -> Error
                     end.

%% Internal functions

get_module_info(Module) ->
    ModuleInfo = Module:module_info(),
    Compile = proplists:get_value(compile, ModuleInfo),
    Options = proplists:get_value(options, Compile),
    Source = proplists:get_value(source, Compile),
    {ok, Source, Options}.

