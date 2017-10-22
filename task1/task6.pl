% So we have here H as a head, T as a tail, P is the product and R is rest

prod([],0).
prod([H],H).   %explicit clause for the empty list
prod([H|T], P) :- prod(T,R), P is H*R.

% prod([1,2,3,4,5], P).
