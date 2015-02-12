%% O O O M
%% M M O M
%% M O O M
%% M M O O

init_faits_ligne([], -1, _).

init_faits_ligne([m|Q], X, Y) :-
	init_faits_ligne(Q, X2, Y),
	X is X2+1,
	assert(mur(X,Y)).

init_faits_ligne([o|Q], X, Y) :-
	init_faits_ligne(Q, X2, Y),
	X is X2+1,
	assert(w(X,Y)).

init_faits([], -1).

init_faits([T|Q], Y) :-
	init_faits(Q, Y2),
	Y is Y2+1,
	init_faits_ligne(T, _, Y).

d(X0,Y0,X,Y) :- next_w(X0,Y0,X,Y), w(X,Y).
next_w(X0,Y0,X0,Y) :- Y is Y0+1.
next_w(X0,Y0,X,Y0) :- X is X0+1.
next_w(X0,Y0,X0,Y) :- Y is Y0-1.
next_w(X0,Y0,X,Y0) :- X is X0-1.

go(X,Y,X,Y,Path,Path).
go(X0,Y0,X,Y,SoFar,Path) :-
    d(X0,Y0,X1,Y1),
    \+ memberchk( w(X1,Y1),SoFar),
    go(X1,Y1,X,Y,[w(X1,Y1)|SoFar],Path).