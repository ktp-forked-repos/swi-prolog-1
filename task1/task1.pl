% -*- Mode: Prolog -*-

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

