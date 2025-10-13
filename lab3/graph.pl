% basis 
edge(a, b).
edge(b, c).
edge(a, d).
edge(d, c). 
edge(c, a). 

path_basis(X,	Y)	:-	edge(X,	Y).	
path_basis(X,	Y)	:-	edge(X,	Z),	path_basis(Z,	Y).	

% handing cycles
path(X,	Y)	:-	path(X,	Y,	[X]).	

path(X,	Y,	_)	:-	edge(X,	Y).	

path(X,	Y,	Visited)	:-	
edge(X,	Z),	
\+	member(Z,	Visited),	
path(Z,	Y,	[Z|Visited]).	

% listing All Paths 

find_all_paths(Start, End, Paths) :- findall(Path, path_with_list(Start, End, Path), Paths).

path_list(Start, End, Path) :- path_list(Start, End, [Start], Path).

path_list(End, End, Visited, Path) :- reverse(Visited, Path).

path_list(Current, End, Visited, Path) :-
    edge(Current, Next),
    \+ member(Next, Visited),
    path_list(Next, End, [Next|Visited], Path).

% Maze 
