edge(entrance, a).
edge(a, b).
edge(a, c).
edge(b, exit).
edge(c, b).
edge(b, d).
edge(d, exit).
blocked(a, c).  
blocked(c, a).

can_move(X, Y) :- edge(X, Y), \+ blocked(X, Y).
reason(X, Y, 'path is open') :- can_move(X, Y).
reason(X, Y, 'path is blocked') :- blocked(X, Y).
reason(_, Y, 'destination reached') :- Y == exit.

move(X, Y, Visited, [Y|Visited]) :-
    can_move(X, Y),
    format('Moving from ~w to ~w.~n', [X, Y]).

move(X, Y, Visited, Path) :-
    can_move(X, Z),
    \+ member(Z, Visited),      
    format('Exploring from ~w to ~w...~n', [X, Z]),
    move(Z, Y, [Z|Visited], Path).
    
find_path(X, Y, Path) :- 
    format('Searching from ~w to ~w~n', [X, Y]),
    move(X, Y, [X], RevPath),
    reverse(RevPath, Path),
    format('The path was found: ~w~n', [Path]).

% tracking numbers of steps and visited nodes
track_path(Path) :- 
    length(Path, l),
    Steps is l-1, 
    format('Steps count: ~w~n', [Steps]),
    format('Visited nodes:~w~n ', [Path]). 

% predicate why
why(X, Y) :- reason(X, Y, Explanation),
    format('Reasoning from ~w to ~w: ~w~n', [X, Y, Explanation]).
