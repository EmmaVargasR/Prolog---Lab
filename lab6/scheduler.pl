:- use_module(library(clpfd)).
example_tasks([
    task(a, 3, 1),
    task(b, 3, 1),
    task(c, 2, 1),
    task(d, 2, 1)
]).
schedule(Tasks, Starts, Ends, Makespan) :-
    length(Tasks, N),
    length(Starts, N),
    length(Ends, N),
    Starts ins 0..20,
    Ends ins 0..20,
    maplist(constrain_task, Tasks, Starts, Ends),
    build_disjoint(Starts, Tasks, Ends, Disjoint),
    disjoint2(Disjoint),
    foldl(maximum, Ends, 0, Makespan),
    append(Starts, [Makespan], Vars),
    labeling([min(Makespan)], Vars).

constrain_task(task(_, D, _), S, E) :- E #= S + D.
build_disjoint([], [], [], []).
build_disjoint([S|Ss], [task(_, D, R)|Ts], [E|Es], [task(S, D, E, R)|DTs]) :-
    build_disjoint(Ss, Ts, Es, DTs).
maximum(X, Y, Max) :- Max #= max(X, Y).

print_schedule([], [], []).
print_schedule([task(Name, Dur, Res)|Ts], [S|Ss], [E|Es]) :-
    format("~w [res=~d, dur=~d]   start=~d   end=~d~n", [Name, Res, Dur, S, E]),
    print_schedule(Ts, Ss, Es).
    
run :-
    example_tasks(Tasks),
    schedule(Tasks, Starts, Ends, Makespan),
    format("-- Schedule --~n"),
    print_schedule(Tasks, Starts, Ends),
    format("makespan=~d~n", [Makespan]).
