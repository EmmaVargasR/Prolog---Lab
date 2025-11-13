:- use_module(library(clpfd)).

% Australia
regions_au([wa, nt, sa, q, nsw, v, t]).
edges_au([
    wa-nt, wa-sa, nt-sa, nt-q, sa-q,
    sa-nsw, sa-v, q-nsw, nsw-v
]).


%South America
regions_sa([gf, sr, gy, ve, co, ec, pe, bo, py, cl, ar, uy, br]).
edges_sa([
    ar-bo, ar-cl, ar-py, ar-uy,
    bo-br, bo-cl, bo-pe, bo-py,
    br-co, br-gy, br-pe, br-py, br-sr, br-uy, br-ve, br-gf,
    cl-pe,
    co-ec, co-pe, co-ve,
    ec-pe,
    gy-sr, gy-gf,
    gf-sr,
    py-uy,
    ve-sr
]).

color_names([1-red, 2-green, 3-blue, 4-yellow,
    5-orange, 6-purple, 7-pink, 8-gray]).

map_color(Vars, Regions, Edges, K) :-
    Vars ins 1..K,
    maplist(different(Vars, Regions), Edges),
    labeling([], Vars).

different(Vars, Regions, A-B) :-
    region_color(A, Regions, Vars, ColorA),
    region_color(B, Regions, Vars, ColorB),
    ColorA #\= ColorB.

region_color(Region, [Region|_], [Color|_], Color).
region_color(Region, [_|RestRegions], [_|RestVars], Color) :-
    region_color(Region, RestRegions, RestVars, Color).

colorize_au(K, Vars) :-
    regions_au(Regions),
    edges_au(Edges),
    length(Regions, N),
    length(Vars, N),
    map_color(Vars, Regions, Edges, K).

colorize_sa(K, Vars) :-
    regions_sa(Regions),
    edges_sa(Edges),
    length(Regions, N),
    length(Vars, N),
    map_color(Vars, Regions, Edges, K).

pretty_color_by_region([], []).
pretty_color_by_region([Region|RestRegions], [Color|RestColors]) :-
    color_names(ColorList),
    member(Color-Name, ColorList),
    format('~w = ~w~n', [Region, Name]),
    pretty_color_by_region(RestRegions, RestColors).

run_sa(K) :-
    colorize_sa(K, Vars),
    regions_sa(Regions),
    pretty_color_by_region(Regions, Vars).
run_au(K) :-
    colorize_au(K, Vars),
    regions_au(Regions),
    pretty_color_by_region(Regions, Vars).


