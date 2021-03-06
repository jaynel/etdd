-module(etdd_dig_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, ARGS), {I, {I, start_link, ARGS}, permanent, 5000, worker, [I]}).
-define(SUPER(I, ARGS), {I, {I, start_link, ARGS}, permanent, infinity, supervisor, [I]}).


%% ===================================================================
%% API functions
%% ===================================================================

-spec start_link() -> {ok, pid()}.

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, {}).


%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

-spec init(Args::{}) -> {ok, any()}.

init({}) ->
    DigServer = ?CHILD(etdd_dig_server, []),
    {ok, { {one_for_one, 5, 10}, [DigServer]} }.

