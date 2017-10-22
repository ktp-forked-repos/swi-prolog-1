% -*- Mode: Prolog -*-
['prolog03.pl'].


subst([],_,_,[]).
subst([P|L], P, R, [R|M]) :- subst(L, P, R, M).
subst([X|L], P, R, [X|M]) :- X \= P, subst(L, P, R, M).
