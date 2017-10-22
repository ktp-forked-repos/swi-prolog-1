% Logik und Logische Programmierung

% Logic task 1 - Solution 1
%--------------------------

% -------------------------------------
%               Task 1
% -------------------------------------

father(terach,abraham).  % Faktum (fact)
father(terach,nachor).
father(terach,haran).
%father(terach,fem).
father(abraham,isaac).
father(haran,lot).
father(haran,milcah).
father(haran,yiscah).

% mother(Mutter,Kind)
mother(sarah,isaac).
%mother(fem, femchild).
%mother(femchild, femchildchild).
male(terach).
male(abraham).
male(nachor).
male(haran).
male(isaac).
male(lot).

female(sarah).
female(milcah).
female(yiscah).

%neue Fakten
%female(fem).
%female(femchild).
%female(femchildchild).

%father(terach,fem).


son(Father,Child) :- father(Father,Child), male(Child).
son(Mother,Child) :- mother(Mother,Child), male(Child).
daughter(Father,Child) :- father(Father,Child), female(Child).
daugther(Mother,Child) :- mother(Mother,Child), female(Child).

%new rule, Assignment 1
%task 1
grandfather(Grandfather, Grandchild) :- parent(Grandfather, Father), parent(Father, Grandchild).
nephew(Nephew, UncleOrAunt) :- sibling(UncleOrAunt, Sibling) , son(Sibling, Nephew).

cousin(A,B) :- parent(P1,A), parent(P2,B), sibling(P1,P2), P1\=P2.

sibling(Child1, Child2) :- parent(Parent, Child1), parent(Parent, Child2).

% grandfather(terach, lot).
%grandfather(terach, haran).
% grandfather(terach, fem2).
%nephew(isaac, fem).

parent(X,Child) :- father(X,Child).
parent(X,Child) :- mother(X,Child).



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





% -------------------------------------
%               Task 5
% -------------------------------------






% -------------------------------------
%               Task 6
% -------------------------------------

% So we have here H as a head, T as a tail, P is the product and R is rest

prod([],0).
prod([H],H).   %explicit clause for the empty list to avoid recursive clause
prod([H|T], P) :- prod(T,R), P is H*R.

% prod([1,2,3,4,5], P).

