parent(john, mary).  
parent(mary, susan).  
parent(mary, bob).  
parent(susan, alice).  
grandparent(X, Y) :- parent(X, Z), parent(Z, Y). 
likes(mary, pizza).  
likes(mary, pasta).  
likes(john, pizza).  
member(X, [X | _]).  
member(X, [_ | T]) :- member(X, T).