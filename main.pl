<<<<<<< HEAD
%% FORMALISME : 
%%		- D : DÉPART 
%% 		- P : PASSAGE 
%%		- V : VISITÉ
%%		- M : MUR 
%% 		- A : ARRIVÉE 

%% EXEMPLE DE LABYRINTHE
%% [ [D,P,M],
%%   [M,P,P],
%%   [M,M,A] ]


%% TROUVER UN DÉPART SUR UNE LIGNE (IE UNE LISTE)

depart_ligne(d, 0).
depart_ligne([T|Q], X) :- 
	(
		depart_ligne(T, X2);
		depart_ligne(Q, X2)
	),
	X is X2+1.

%% TROUVER UN DÉPART DANS UN LABYRINTHE (IE UN ENSEMBLE DE LISTES)

depart([T|_], X, 0) :-
	depart_ligne(T, X2),
	X is X2-1.

depart([_|Q], X, Y) :-
	depart(Q, X, Y2),
	Y is Y2+1.

% EXEMPLE UTILISÉ
%% M M M 
%% M P D 
%% A P M

mur(1,1).
mur(1,2).
mur(1,3).
mur(2,1).
mur(3,3).

mur(2,3).
mur(2,2).
mur(3,2).

arrive(3,1).

appartient(E,[E|_]).
appartient(E,[_|Q]):-appartient(E,Q).
		
parcourir(X,Y,_,_):-arrive(X,Y),!.
parcourir(X,Y,X1,Y1):-
		libre(X,Y),
		suivant(X,Y,X1,Y1).

suivant(_,Y,_,Y1):- Y1 is Y+1. %% MONTER
suivant(_,Y,_,Y1):- Y1 is Y-1. %% DESCENDRE
suivant(X,_,X1,_):- X1 is X+1. %% ALLER À DROITE 
suivant(X,_,X1,_):- X1 is X-1. %% ALLER À GAUCHE 


chercher(X,Y,_,_,_,_):-arrive(X,Y).
chercher(X0,Y0,X,Y,Parcouru, Parcour):-
		parcourir(X0,Y0,X1,Y1),
		\+ appartient(libre(X1,Y1), Parcouru),
		chercher(X1,Y1,X,Y,[libre(X1,Y1)|Parcouru],Parcour).






=======
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
>>>>>>> 488388df475bfdc2fe38a42057a6e1a2937614f1
