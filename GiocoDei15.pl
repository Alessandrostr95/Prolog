/*
 *        Programmazione Dichiarativa (Linguaggio esemplificativo Prolog)
 * 
 * Sulla base del gioco del 15 (https://it.wikipedia.org/wiki/Gioco_del_quindici) ma con una scacchiera 3x3, si definisca un predicato:
 * 
 *          soluzione(ScacchieraIniziale,PassiPerLaSoluzione)
 * 
 * che sia vero se:
 *    - ScacchieraIniziale è una configurazione iniziale
 *    - PassiPerLaSoluzione sono i passi necessari per arrivare alla soluzione
 * 
 * Il concetto di passo sta a voi definirlo.
 * 
*/


/* predicato swap per inveritre 2 elementi di una lista */
swap( Lst, On, With, Lst ) :-
    On = With.
swap( Lst, On, With, Res ) :-
    swap( Lst, On, With, Res, _, _ ),!.
swap( Lst, On, With, Res ) :-
    swap( Lst, With, On, Res, _, _ ).
swap( Lst, _, With, Res, E_on, E_with ) :-
    With = 1,
    Lst = [E_with|Ls],
    Res = [E_on|Ls],
    !.
swap( Lst, On, With, Res, E_on, E_with ) :-
    On = 1,
    Lst = [E_on|Es],
    Res = [E_with|Rs],
    N1 is On - 1,
    N2 is With - 1,
    swap( Es, N1, N2, Rs, E_on, E_with ),
    !.
swap( Lst, On, With, Res, E_on, E_with ) :-
    Lst = [E|Es],
    Res = [E|Rs],
    N1 is On - 1,
    N2 is With - 1,
    swap( Es, N1, N2, Rs, E_on, E_with ).
/* ======================================== */


conf(  [A1, A2, A3,
     	A4, A5, A6,
     	A7, A8, A9]	):-
    permutation([1,2,3,4,5,6,7,8,blank],[A1,A2,A3,A4,A5,A6,A7,A8,A9]).

corretto(1,2).
corretto(1,4).

corretto(2,1).
corretto(2,5).
corretto(2,3).

corretto(3,2).
corretto(3,6).

corretto(4,1).
corretto(4,5).
corretto(4,7).

corretto(5,4).
corretto(5,2).
corretto(5,6).
corretto(5,8).

corretto(6,3).
corretto(6,5).
corretto(6,9).

corretto(7,4).
corretto(7,8).

corretto(8,7).
corretto(8,5).
corretto(8,9).

corretto(9,6).
corretto(9,8).



passo(C1,C2):-
    conf(C1),
    nth1(N,C1,blank),
    corretto(N,M),
    N < M,
    swap(C1,N,M,C2),
    conf(C2).

passo(C1,C2):-
    conf(C1),
    nth1(N,C1,blank),
    corretto(N,M),
    N > M,
    swap(C2,M,N,C1),
    conf(C2).


soluzione(ScacchieraIniziale,Path):-
    path(ScacchieraIniziale,[1,2,3,4,5,6,7,8,blank],Path).

path(A,B,[(A,B)]):-
    passo(A,B),!.

path(A,B,[(A,C)|R]):-
    passo(A,C),
    path(C,B,R),!.
    
