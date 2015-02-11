init_faits_ligne([], 0, _).

init_faits_ligne([m|Q], X, Y) :-
	init_faits_ligne(Q, X2, Y),
	X is X2+1,
	assert(mur(X,Y)).

init_faits_ligne([o|Q], X, Y) :-
	init_faits_ligne(Q, X2, Y),
	X is X2+1,
	assert(libre(X,Y)).

init_faits_ligne([a|Q], X, Y) :-
	init_faits_ligne(Q, X2, Y),
	X is X2+1,
	assert(arrive(X,Y)).

init_faits_ligne([d|Q], X, Y) :-
	init_faits_ligne(Q, X2, Y),
	X is X2+1,
	assert(depart(X,Y)).

init_faits([], 0).

init_faits([T|Q], Y) :-
	init_faits(Q, Y2),
	Y is Y2+1,
	init_faits_ligne(T, _, Y).