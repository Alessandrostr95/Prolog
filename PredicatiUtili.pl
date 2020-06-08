%listaElementiUguali(Elemento, NumVolte, Lista).

%(1) with maplist/2: creates a list of length N and then matches all its elements to X.

listaElementiUguali(X, N, List)  :- 
    length(List, N), 
    maplist(=(X), List).

%(2) with findall/3: makes loop N-times and completes List with X N-times

listaElementiUguali(X, N, List)  :- 
    findall(X, between(1, N, _), List).
    
/* predicato vero se X è una sottosequenza di L */   
sequenza(X,L):-
    append(_,Fine,L),
    append(X,_,Fine).
