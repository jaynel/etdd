
%% Source code is represented as a tuple of sub-binaries
%% pointing to the original large binary read in.
%% Each sub-binary is a single line of source code.
-type etdd_src_lines() :: tuple(binary()).

%% Whitespace, comments and directives are pulled out
%% to a separate tuple by referencing the line numbers
%% they occur on.
-type etdd_src_refs()  :: tuple(pos_integer()).

%% The full source of a single file contains extra
%% fields for clearer referencing of summary information
%% about the source code data.
-record(etdd_src, {
          file = ""           :: string(),
          line_count = 0      :: non_neg_integer(),
          src_lines = {}      :: etdd_src_lines(),
          whitespace = {}     :: etdd_src_refs(),
          comments = {}       :: etdd_src_refs(),
          directives = {}     :: etdd_src_refs(),
          module = 0          :: non_neg_integer(),
          module_type = {}    :: atom() | {},
          behaviour = 0       :: non_neg_integer(),
          behaviour_type = {} :: atom() | {}
         }).

%% App source code is just the list of terms.
-type etdd_app_lines() :: list(any()).

%% App source files have different fields of interest.
-record(etdd_app_src, {
          file = ""           :: string(),
          module              :: atom(),
          line_count = 0      :: non_neg_integer(),
          app_lines = []      :: list(any()),
          start_module        :: atom()
         }).
