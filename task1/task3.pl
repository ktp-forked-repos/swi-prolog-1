% -*- Mode: Prolog -*-
% Die Definitionen von nat, add und times wurden aus den VO Unterlagen übernommen


nat(0).                  
nat(s(X)) :- nat(X).     

add(A,0,A)       :- nat(A).
add(A,s(B),s(C)) :- add(A,B,C).  % add(A,B+1,C+1) <= add(A,B,C)

add2(A,0,A).
add2(A,s(B),s(C)) :- add2(A,B,C).  % add(A,B+1,C+1) <= add(A,B,C)


times(_A,0,0).
times(A,s(B),X) :- times(A,B,X1),
	           add(A,X1,X).

isbigger(A,B):- add(B,X,A), X\=0.


dist(A,X,B) :- add(B,Y,A), isbigger(Y,X).


%  dist(s(s(s(s(0)))), s(s(0)), s(0)).
%  dist(s(0),0, s(0)).
