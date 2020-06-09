/* Vero se Lista è una lista di N elementi tutti uguali di tipo Elemento */
listaElementiUguali(Lista, Elemento, N):- 
    length(Lista, N), 
    maplist(=(Elemento), Lista).

/* Vero se X è una sottosequenza consecutiva di L */
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

/* vero se Seq è una sottolista di Lista di tutti elementi uguali e consecutivi */
sottosequenzaElementiUguali(Seq, Lista):-
    sequenza(Seq, Lista),
    listaElementiUguali(Seq,_,_).

/* vero se TutteSottoseq è una lista di tutte le sottosequenze di elementi uguali e consecutivi di Lista */
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

/* vero se:
    - P è un piano
    - esiste nel piano P una linea di A elementi lunga Lunghezza*/
lineaOrizzontaleInUnPianoFattaDi(A,Lunghezza,P):-
    piano(P),
    member(Riga,P),
    tutteSottosequenzaElementiUguali(Riga, TutteSottoseq),
    member(Seq, TutteSottoseq),
    listaElementiUguali(Seq,A,Lunghezza).


