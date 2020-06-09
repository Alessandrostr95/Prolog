listaElementiUguali(Lista, Elemento, N):- 
    length(Lista, N), 
    maplist(=(Elemento), Lista).

sequenza(X,L):-
    append(_,Fine,L),
    append(X,_,Fine).


piano([ [a1,a1,a1,a4,a4],
        [a1,a1,a1,a4,a4],
        [a1,a1,a1,a10,a8],
        [a5,a5,a2,a2,a2],
        [a5,a5,a2,a2,a2],
        [a6,a6,a2,a2,a2],
        [a6,a6,a3,a3,a3],
        [a7,a7,a3,a3,a3],
        [a7,a7,a3,a3,a3],
        [a15,a16,a16,a16,a9]]).
        
piano([ [a1,a1,a1,a4,a4],
        [a15,a16,a16,a16,a9]]).

sottosequenzaElementiUguali(Seq, Lista):-
    sequenza(Seq, Lista),
    listaElementiUguali(Seq,_,_).

tutteSottosequenzaElementiUguali(Lista, TutteSottoseq):-
    setof(Seq, sottosequenzaElementiUguali(Seq,Lista), TutteSottoseq).

/*
lineaOrizzontaleInUnPianoFattaDi(A,Lunghezza,[R1|AltreRighe]):-
    piano([R1|AltreRighe]),
    sottosequenzaElementiUguali(Seq,R1),
    listaElementiUguali(Seq,A,Lunghezza).

lineaOrizzontaleInUnPianoFattaDi(_,_,[]).

lineaOrizzontaleInUnPianoFattaDi(A,Lunghezza,[R1|AltreRighe]):-
    write(a),
    piano([R1|AltreRighe]),
    write(b),
    lineaOrizzontaleInUnPianoFattaDi(A,Lunghezza,AltreRighe).*/

lineaOrizzontaleInUnPianoFattaDi(A,Lunghezza,P):-
    piano(P),
    member(Riga,P),
    tutteSottosequenzaElementiUguali(Riga, TutteSottoseq),
    member(Seq, TutteSottoseq),
    listaElementiUguali(Seq,A,Lunghezza).


