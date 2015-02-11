%% EXEMPLE

%% M M M 
%% M P D 
%% A P M

mur(1,1).
mur(1,2).
mur(1,3).
mur(2,1).
mur(3,3).

libre(2,3).
libre(2,2).
libre(3,2).

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
