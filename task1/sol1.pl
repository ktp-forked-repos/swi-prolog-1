% -*- Mode: Prolog -*-
['prolog01.pl'].
['prolog02.pl'].
['prolog03.pl'].
% -------------------------------------
%               Task 1
% -------------------------------------


grandfather(Grandfather, Grandchild) :- parent(Grandfather, Father), parent(Father, Grandchild).

nephew(Nephew, UncleOrAunt) :- sibling(UncleOrAunt, Sibling) , son(Sibling, Nephew).

cousin(A,B) :- parent(P1,A), parent(P2,B), sibling(P1,P2), P1\=P2.

sibling(Child1, Child2) :- parent(Parent, Child1), parent(Parent, Child2).

% grandfather(terach, lot).
%grandfather(terach, haran).
% grandfather(terach, fem2).
%nephew(isaac, fem).



% -------------------------------------
%               Task 2
% -------------------------------------

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



% -------------------------------------
%               Task 3
% -------------------------------------

isbigger(A,B):- add(B,X,A), X\=0.

% Wenn B+Y = A ist und Y(Y ist die Distanz von B zu A) größer als X ist,
% ist A weiter von B entfernt als X
dist(A,X,B) :- add(B,Y,A), isbigger(Y,X).


%  dist(s(s(s(s(0)))), s(s(0)), s(0)). true
%  dist(s(0),0, s(0)). false
% dist(s(s(s(0))), s(0),s(0)). true
% dist(s(s(s(0))), s(s(0)),s(0)). false



% -------------------------------------
%               Task 4
% -------------------------------------


join(petersbach, mur).
join(mur, drau).
join(drau, donau).

floats(A, B) :- A==B ; join(A, B); join(A,X), floats(X,B).

%  floats(petersbach, mur).
%  floats(petersbach, drau).
%  floats(petersbach, donau).



% -------------------------------------
%               Task 5
% -------------------------------------



subst([],_,_,[]).
subst([P|L], P, R, [R|M]) :- subst(L, P, R, M).
subst([X|L], P, R, [X|M]) :- X \= P, subst(L, P, R, M).

%  subst([a,b,c], b, d, M).
%  subst([a,b,c,a,b,c], b, d, M).

% -------------------------------------
%               Task 6
% -------------------------------------

% So we have here H as a head, T as a tail, P is the product and R is rest

prod([],0).
prod([H],H).   %explicit clause for the empty list to avoid recursive clause
prod([H|T], P) :- prod(T,R), P is H*R.

% prod([1,2,3,4,5], P).

