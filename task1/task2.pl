% -*- Mode: Prolog -*-
%Definitionen von nat, add, times sind aus den Unterlagen der VO übernommen.

nat(0).                  % Fakt  (fact)
nat(s(X)) :- nat(X).     % Regel (rules): Kopf :- Rumpf  ( <- )
                         % Horn-Clausen (Horn-Clauses): Aussagen in dieser Form
	                 % s(X) ist ein Term, s ein Funktor


add(A,0,A)       :- nat(A).
add(A,s(B),s(C)) :- add(A,B,C).  % add(A,B+1,C+1) <= add(A,B,C)

add2(A,0,A).
add2(A,s(B),s(C)) :- add2(A,B,C).  % add(A,B+1,C+1) <= add(A,B,C)


times(_A,0,0).
times(A,s(B),X) :- times(A,B,X1),
	           add(A,X1,X).
double(A,B) :- times(s(s(0)),B, A), A\=0, B\=0.
%Testcases:

%double(s(s(0)),s(0)). true
%double(0,0). false, per definition kann keine zahl doppelt so gross wie Null sein
%double(s(s(s(s(0)))),s(s(0))). true
%double(s(s(s(0))),s(s(0))). soll falsch sein
