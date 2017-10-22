% -*- Mode: Prolog -*-

join(petersbach, mur).
join(mur, drau).
join(drau, donau).

floats(A, B) :- A==B ; join(A, B); join(A,X), floats(X,B).

%  floats(petersbach, mur).
%  floats(petersbach, drau).
%  floats(petersbach, donau).
