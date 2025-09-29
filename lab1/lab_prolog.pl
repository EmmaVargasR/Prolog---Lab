% Family Tree Knowledge
parent(jose, antonio).
parent(antonio, alonso).
parent(antonio, aide).
parent(alonso, fabian).
parent(alonso, gaby).
parent(alonso, maria).
parent(fabian, emma).
parent(fabian, claudia).
parent(gaby, maya).

% Rules 
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% Food Preferences
likes(jose, hornado).
likes(antonio, morocho).
likes(alonso, choclo).
likes(aide, cuy).
likes(fabian, locro).
likes(gaby, fritada).
likes(maria, pasta).
likes(emma, humitas).
likes(claudia, sushi).
likes(maya, sushi).


% Food Rule
food_friend(X, Y) :- likes(X, Food), likes(Y, Food), X \= Y.

% Math Utility
% Factorial recursively 

factorial(0, 1).  
factorial(X, R) :- X>0, X1 is X-1, factorial(X1, R1), R is X*R1.

% Sum_list

sum_list([], 0).
sum_list([Head|Tail], Sum) :- sum_list(Tail, Tailsum), Sum is Head + Tailsum.

% length_list 

length_list([], 0).
length_list([_|Tail], Length) :- length_list(Tail, TailLength), Length is TailLength + 1.

% append_list

append_list([], List, List). 
append_list([Head|Tail], List, [Head|Result]) :- append_list(Tail, List, Result).

