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


lineaOrizzontaleInUnPianoFattaDi(a1,3,P):- piano(P).
lineaOrizzontaleInUnPianoFattaDi(a2,3,P):- piano(P).
lineaOrizzontaleInUnPianoFattaDi(a3,3,P):- piano(P).
lineaOrizzontaleInUnPianoFattaDi(a4,2,P):- piano(P).
lineaOrizzontaleInUnPianoFattaDi(a5,2,P):- piano(P).
lineaOrizzontaleInUnPianoFattaDi(a6,2,P):- piano(P).
lineaOrizzontaleInUnPianoFattaDi(a7,2,P):- piano(P).
lineaOrizzontaleInUnPianoFattaDi(a8,1,P):- piano(P).
lineaOrizzontaleInUnPianoFattaDi(a9,1,P):- piano(P).
lineaOrizzontaleInUnPianoFattaDi(a10,1,P):- piano(P).
lineaOrizzontaleInUnPianoFattaDi(a15,1,P):- piano(P).
lineaOrizzontaleInUnPianoFattaDi(a16,3,P):- piano(P).


quadratoInUnPianoFattoDi(a1,3,P):- piano(P).
quadratoInUnPianoFattoDi(a2,3,P):- piano(P).
quadratoInUnPianoFattoDi(a3,3,P):- piano(P).
quadratoInUnPianoFattoDi(a4,2,P):- piano(P).
quadratoInUnPianoFattoDi(a5,2,P):- piano(P).
quadratoInUnPianoFattoDi(a6,2,P):- piano(P).
quadratoInUnPianoFattoDi(a7,2,P):- piano(P).
quadratoInUnPianoFattoDi(a8,1,P):- piano(P).
quadratoInUnPianoFattoDi(a9,1,P):- piano(P).
quadratoInUnPianoFattoDi(a10,1,P):- piano(P).
quadratoInUnPianoFattoDi(a15,1,P):- piano(P).


homePage(PaginaRiempita,[]):- piano(PaginaRiempita).
homePage(PaginaRiempita,[(Articolo,Importanza)|Coda]):-
    piano(PaginaRiempita),
    quadratoInUnPianoFattoDi(Articolo,Importanza,PaginaRiempita),
    homePage(PaginaRiempita,Coda).
