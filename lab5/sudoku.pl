:- use_module(library(clpfd)).
sudoku(Rows) :-
    length(Rows, 9), %verification 
    maplist(same_length(Rows), Rows),
    append(Rows, Vars), 
    Vars ins 1..9, 
  
    maplist(all_different, Rows),
    transpose(Rows, Columns), % turns the colums into rows and viceversa
    maplist(all_different, Columns),
    blocks(Rows), maplist(label, Rows).	

    length_(Len, List) :- length(List, Len).


blocks([]).
blocks([A, B, C | Rest]) :-
    blocks3(A, B, C),
    blocks(Rest).
blocks3([], [], []).
blocks3([A1, A2, A3 | R1],
        [B1, B2, B3 | R2], 
        [C1, C2, C3 | R3]) :-
    all_distinct([A1, A2, A3, B1, B2, B3, C1, C2, C3]),
    blocks3(R1, R2, R3).

solve_sudoku :-
    Puzzle = [
        [3, _, _, _, 2, 8, _, 6, _],
        [_, 8, 5, _, 6, _, 4, _, _],
        [_, 6, _, _, _, _, _, 7, _],
        [_, _, 7, _, _, _, 6, _, _],
        [6, 4, _, 8, _, 1, _, _, _],
        [5, 3, _, _, 7, 2, _, 8, _],
        [_, _, _, 1, 5, 7, _, _, _],
        [_, _, _, _, _, _, 1, 9, _],
        [_, _, _, 3, _, _, _, 4, _]
    ],
    sudoku(Puzzle),
    maplist(writeln, Puzzle).
