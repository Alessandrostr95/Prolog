/*
 * P01 (*) Find the last element of a list.
 * 		Example:
 * 		?- my_last(X,[a,b,c,d]).
 * 		X = d
 * */

my_last(A,[A]).
my_last(X,[_|R]):-my_last(X,R).


/*
 * P02 (*) Find the last but one element of a list.
 * */
secondToLast(A,[A,_]).
secondToLast(X,[_|R]):-secondToLast(X,R).

/*
 * P03 (*) Find the K'th element of a list.
 * 		The first element in the list is number 1.
 * 		Example:
 * 		?- element_at(X,[a,b,c,d,e],3).
 * 		X = c
 * */
element_at(X,[X|_],1).
element_at(X,[_|R],N):-
    element_at(X,R,M),
    N is M + 1.

/* P04 (*) Find the number of elements of a list. */
len([],0).
len([_|R],N):-
    len(R,M),
    N is M+1.

/* P05 (*) Reverse a list. */
rev([],[]).
rev([A|R1],L):-
    append(R2,[A],L),
    rev(R1,R2).

/* P06 (*) Find out whether a list is a palindrome.
 * A palindrome can be read forward or backward; e.g. [x,a,m,a,x].
 */
pal([]).
pal([_]).
pal([A|R]):-
    my_last(A,R),
    append(S,[A],R),
    pal(S).

/*
 * P07 (**) Flatten a nested list structure.
 * 			Transform a list, possibly holding lists as elements into a
 * 			`flat' list by replacing each list with its elements (recursively).
 * 
 * 			Example:
 * 			?- my_flatten([a, [b, [c, d], e]], X).
 * 			X = [a, b, c, d, e]
 * 
 * 			Hint: Use the predefined predicates is_list/1 and append/3
 * 			Vari test:	
 * 			my_flatten([[a,b,c],c,[o,c,[a,[a,b,v]],c,d,d,f],g,f,k],L).
 * */

my_flatten([],[]).
my_flatten([A|Coda],Flat):-
    is_list(A),
    my_flatten(A,Flat1),
    my_flatten(Coda,Flat2),
    append(Flat1,Flat2,Flat).
my_flatten([A|Coda],Flat):-
    \+ is_list(A),
    my_flatten(Coda,Flat2),
    append([A],Flat2,Flat).
    




