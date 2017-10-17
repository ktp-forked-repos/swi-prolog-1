% Logik und Logische Programmierung
% VU vom 9.10.2017
% Bernhard K. Aichernig

% Rekursive Programmierung in reinem Prolog
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Arithmetische Programme

nat(0).                  % Fakt  (fact)
nat(s(X)) :- nat(X).     % Regel (rules): Kopf :- Rumpf  ( <- )
                         % Horn-Clausen (Horn-Clauses): Aussagen in dieser Form
	                 % s(X) ist ein Term, s ein Funktor

	
% Anfragen (Queries)
%%%%%%%%%%%%%%%%%%%%

% [prolog02]. laedt ein Prolog-Programm

% nat(0).    Anfragen von Fakten:
%            Operationelle Semantik: Suche im Programm einen Fakt, der die
%            Anfrage impliziert. Identischer Fakt? -> Yes, sonst No.


% nat(s(s(s(0)))). Ist diese Grundanfrage eine logische Folgerung des
%	           Programmes P?

	
% Algorithmus: Initialisiere die Resolvente mit Grundanfrage G ;
%              solange die Resolvente A1, ..., An nicht leer ist
%              begin
%                waehle ein Ziel Ai, 1 <= i <= n und
%	           eine solche Grundinstanz einer Clause
%                  A :- B1,...Bk aus P, dasz A=Ai gilt
%	           (gibt es keine solche Clause beende die Schleife);
%                  bestimme die neue Resolvente
%                  A1,....,A(i-1), B1,...Bk, A(i+1),...,An 	
%              end
%              Ist die Resolvente leer, antworte true, ansonsten false.
	

% nat(X). Existenzanfrage: Sucht eine Loesung (Substitution) fuer P(X)
%         Mit ; bekommt man weitere Loesungen und somit
%         die deklarative Bedeutung des Programmes nat.

% nat(x). Variablen werden immer grosz geschrieben!!!

% trace.   schaltet den Trace-modus ein.
% notrace. schaltet ihn ab.

% add(Op1,Op2,Res)	
add(A,0,A)       :- nat(A).
add(A,s(B),s(C)) :- add(A,B,C).  % add(A,B+1,C+1) <= add(A,B,C)

add2(A,0,A).
add2(A,s(B),s(C)) :- add2(A,B,C).  % add(A,B+1,C+1) <= add(A,B,C)


% Anfragen:

% add(s(s(0)),s(s(0)),s(s(s(s(0))))).

% add(s(s(0)),s(s(s(0))),X).

% add(X,s(s(s(0))),s(s(s(s(0))))).

% add(X,Y,s(s(s(s(0))))).

% add(X,Y,Z).

times(A,0,0).
times(A,s(B),X) :- times(A,B,X1),
	           add(A,X1,X).


% Anfragen:

% times(s(s(0)),s(s(0)),s(s(s(s(0))))).

% times(s(s(0)),s(s(s(0))),X).

% times(X,s(s(s(0))),s(s(s(s(s(s(0))))))).

% times(X,Y,s(s(s(s(0))))).

% times(X,Y,Z).

fact(0,s(0)).
%fact(s(0),s(0)).
fact(s(N),F) :- fact(N,F1),
	        times(s(N),F1,F).

% fact(s(s(s(0))),s(s(s(s(s(s(0))))))).

% fact(s(s(s(0))),X).

% fact(X,s(s(s(s(s(s(0))))))).

% fact(X,Y).

% fact(s(s(s(s(s(s(s(s(0)))))))),X). fact(8) = 5,040 ergibt stack overflow

% Mit vordefinierter Arithmetik:

fact2(0,1).
fact2(N,F) :- N1 is N-1,
	      fact2(N1,R),
	      F is N*R.

% fact2(3,X).

% fact2(20,X).   % Arithmetik Operatoren sind effizienter.

% fact2(X,6).    % aber nicht umkehrbar!

% Programmierung mit Listen
%--------------------------
