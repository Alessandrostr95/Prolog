%https://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/ 
%Ci sono le soluzioni ma cerchiamo di non guardarle e risolvere insieme


%=================LISTS===================

%1-Trova l'ultimo elemento di una lista

%ultimo(?Elem, +Lista)

ultimo(X,[X]).

ultimo(X,[_Head|Tail]):-
    ultimo(X,Tail).



%2-Trova il penultimo elemento di una lista

%penultimo(?PenElem, +Lista)

penultimo(X,[X,_Y]).

penultimo(X,[_Testa|Coda]):-
    penultimo(X,Coda).



%3-Trova il k esimo elemento di una lista
%Conto a partire da 0

%elem_k(?ElemK, +Lista, ?PosizK)

elem_k(X,[X|_Coda],0).

elem_k(X,[_Testa|Coda],N):-
    elem_k(X,Coda,N1),
    N is N1+1.



%4-Trova il numero di elementi in una lista

%num_elem_lista(?NumElementi, +Lista)

num_elem_lista(0,[]).

num_elem_lista(N,[_Testa|Coda]):-
    num_elem_lista(N1,Coda),
    N is N1+1.



%5-Inverti una lista

%inverti_lista(?ListaInvertita, +ListaDaInvertire)

inverti_lista([],[]).

inverti_lista(X,[Testa|Coda]):-
    inverti_lista(Y,Coda),
    append(Y,[Testa],X).



%6-Verifica se una lista e' palindroma

%palindroma(+Lista)

palindroma([]).
palindroma([_X]).

palindroma([Testa|Coda]):-
    ultimo(Testa,Coda),
    inverti_lista(CodaInvertita,Coda),
    CodaInvertita =[_PrimoEl|Resto],
    palindroma(Resto).
 


%7-"Normalizza" una struttura a liste annidate

%my_flatten(?ListaFlat, +ListaAnnidata)

my_flatten([],[]).

my_flatten(FlatList, Nested):-
    Nested = [H|T],
    var(H),
    my_flatten(FlatList2, T),
    append([H], FlatList2, FlatList).

my_flatten(FlatList, Nested):-
    Nested = [H|T],
    is_list(H),
    my_flatten(FlatTemp,H),
    my_flatten(FlatList2,T),
    append(FlatTemp,FlatList2,FlatList),!.

my_flatten(FlatList, Nested):-
    Nested = [H|T],
    nonvar(H),
    my_flatten(FlatList2, T),
    append([H], FlatList2, FlatList).
 


%8-Elimina gli elementi ripetuti consecutivi in una lista

%compress(?ListaCompressa, +ListaConRipetizioni)

compress([X],[X]).

compress(ComprList,[X,Y|Tail]):-
    dif(X,Y),
    %X \= Y,
    compress(Temp, [Y|Tail]),
    append([X], Temp, ComprList).

compress(ComprList,[X,Y|Tail]):-
    X = Y,
    compress(ComprList, [Y|Tail]).



%9-Raggruppa elementi consecutivi di una lista in una sottolista

%pack(+InitialList, ?PackedList)

uguali([X],[],[X]).

uguali([H1, H2|T], Rest, Uguali):-
    H1 = H2,
    uguali([H2|T], Rest, U1),
    append([H1],U1,Uguali).

uguali([H1,H2|T], [H2|T], [H1]):-
    H1 \= H2.

pack([],[]).

pack([H|T], X):-
    uguali([H|T], Rest, U1),
    pack(Rest, U2),
    X = [U1|U2].

%10-Implementa run-length encoding su una lista
%Leggere consegna

%encode(+List, ?EncList)
%L'ultima lista non la mette tra parentesi

encode(List, EncList):-
    pack(List, PackList),
    enc(PackList, EncList).

enc([],[]):-!.
enc([[]],[]):-!.

enc([[H|T]],[N,H]):-
    length([H|T],N),!.

enc([H|T],EncList):-
    enc([H],P1),
    enc(T,P2),
    EncList = [P1|P2].

%11-Implementa modified run-length encoding su una lista 

%12-Decodifica un lista run-length encoded

%13-

%14-Duplica gli elementi di una lista
%dupli(+List, ?DuplList)

dupli([X],[X,X]).

dupli([H|T],Dupl):-
    dupli(T,Y),
    append([H,H],Y,Dupl).

%15-Duplica gli elementi di una lista un numero dato di volte

%dupliN(+List, ?NumberOfTimes, ?DuplList)

dupliN([],N,[]):-
    integer(N).
dupliN([X],1,[X]).

dupliN([X],N,[H|T]):-
    H = X,
    dupliN([X],N1,T),
    N is N1+1,!.

dupliN([H|T],N,Dupl):-
    dupliN([H],N,Y1),
    dupliN(T,N,Y2),
    append(Y1, Y2, Dupl).

%16-Cancella ogni n-esimo elemento della lista

%drop(+List, ?N, ?DropList)
%???????????????
%Il mio droppa solo l'n-esimo elemento e non ogni n-esimo
drop([], N, []):-
    integer(N).

drop([_H|_T],1,_Drop).


drop([H|T],N,Drop):-
    drop(T,N1,Y),
    N is N1+1,
    append([H],Y,Drop).


%17-Dividi una lista in due sottoliste, di cui la prima e' lunga N, senza usare predicate predefiniti

%splitt(+List, ?Lenght, ?SubList1, ?SubList2)
%Se chiedo un altra soluzione va in loop

l([],0).
l([_H|T],N):-
    l(T,N1),
    N is N1+1.

splitt([],N,[],[]):-
    integer(N).

splitt(List, N, Sub1, Sub2):-
    l(List, N1),
    l(Sub1,N),
    integer(N),
    N =< N1,
    append(Sub1, Sub2, List).


%=======ARITHMETIC===================

%31-Determina se un numero e' primo
%is_prime(7)
is_prime(2):-!.

    


%32-Determina il massimo comun divisore di due interi



%=======LOGIC and CODES===============





%========BINARY TREES=====================




%=======MULTIWAY TREES=======================




%===========GRAPHS===========================




%============MISCELLANEOUS PROBLEMS==============
