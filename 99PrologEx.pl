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
    
    
/*
 * P08 (**) Eliminate consecutive duplicates of list elements.
 * 		If a list contains repeated elements they should be replaced with a
 * 		single copy of the element. The order of the elements should not be changed.
 * 
 * 		Example:
 * 		?- compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
 * 		X = [a,b,c,a,d,e]
 * */

/* 
 * Vero se la lista LOut è uguale alla lista L senza
 * la presenza dell'elemento E
 * */
rimuovi(L,E,L):-
    not(member(E,L)),!.

rimuovi([E|R],E,LOut):-
    rimuovi(R,E,LOut).

rimuovi([A|R],E,[A|LOut]):-
    A \= E,
    rimuovi(R,E,LOut).

compress([],[]).
compress([A|Coda],[A|CodaCompressa]):-
    rimuovi(Coda,A,CodaSenzaA),
    compress(CodaSenzaA,CodaCompressa).
    


/*
 * P09 (**) Pack consecutive duplicates of list elements into sublists.
 * 			If a list contains repeated elements they should be
 * 			placed in separate sublists.
 * 
 * 			Example:
 * 			?- pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
 * 			X = [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]
 * */
 
listaTuttiElementiUguali([Elem],Elem).
listaTuttiElementiUguali([Elem|R],Elem):-
    listaTuttiElementiUguali(R,Elem).

/* dividi([a,a,a,b,c,d,s,a,a], [a,a,a], [b,c,d,s,a,a]) è vera. */
dividi([],[],[]).
dividi(A,A,[]):-
    listaTuttiElementiUguali(A,_).
dividi(L,A,[B|R]):-
    append(A,[B|R],L),
    last(A,UltimoA),
    UltimoA \= B,
    listaTuttiElementiUguali(A,_).


pack([],[]):-!.
pack(L,[Pack1|R]):-
    dividi(L,Pack1,Coda),
    pack(Coda,R).


/*
 * P10 (*) Run-length encoding of a list.
 * 	    Use the result of problem P09 to implement the so-called
 *	    run-length encoding data compression method.
 *	    Consecutive duplicates of elements are encoded as terms [N,E]
 *	    where N is the number of duplicates of the element E.
 * 
 * 	    Example:
 * 	    ?- encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
 * 	    X = [[4,a],[1,b],[2,c],[2,a],[1,d][4,e]]
 * */
packedListToEconded([],[]).
packedListToEconded([A|R1],[[N,E]|R2]):-
    length(A,N),
    member(E,A),!,
    packedListToEconded(R1,R2).

encode(L,X):-
    pack(L,PackedL),
    packedListToEconded(PackedL,X).


/*
 * P11 (*) Modified run-length encoding.
 * 		Modify the result of problem P10 in such a way that if an
 * 		element has no duplicates it is simply copied into the
 * 		result list.
 * 		Only elements with duplicates are transferred as [N,E] terms.
 * 
 * 		Example:
 * 		?- encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
 * 		X = [[4,a],b,[2,c],[2,a],d,[4,e]]
 * */
packedListToEconded_modified([],[]).
packedListToEconded_modified([A|R1],[[N,E]|R2]):-
    length(A,N),
    N > 1,
    member(E,A),!,
    packedListToEconded_modified(R1,R2).

packedListToEconded_modified([[A]|R1],[A|R2]):-
    packedListToEconded_modified(R1,R2).

encode_modified(L,X):-
    pack(L,PackedL),
    packedListToEconded_modified(PackedL,X).
    
    
    
/*
 * 12 (**) Decode a run-length encoded list.
 * Given a run-length code list generated as specified in problem P11.
 * Construct its uncompressed version.
 * 		Example:
 * 		?- decode([[4,a],b,[2,c],[2,a],d,[4,e]],X).
 * 		X = [a,a,a,a,b,c,c,a,a,d,e,e,e,e].
 * */


decode([],[]).
decode([[N,E]|R1],L):-
    listaNElementiUguali(A,E,N),
    decode(R1,R2),
    flatten([A|R2],L).
    %my_flatten([A|R2],L).
    
decode([A|R1],[A|R2]):-
    not(is_list(A)),
    decode(R1,R2).


