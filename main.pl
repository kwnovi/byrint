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

%% TRANSFORMER EN MUR TOUT LES ÉLÉMENTS DÉJÀ PASSÉS N'AYANT PAS DE VOISIN 'P' (SANS PRENDRE EN COMPTE LES DIAGONALES)
%% TRUE : SI ON RENCONTRE A(,!)
%% FALSE : SI L'ON RETOURNE SUR LE DÉPART ET QU'IL EST ENTOURÉ DE MURS 

%% PASSE(A).

%% PASSE (HAUT):- 
%% PASSE (BAS):- 
%% PASSE (GAUCHE):- 
%% PASSE (DROITE):- 

%% TROUVER UN DÉPART SUR UNE LIGNE (IE UNE LISTE)

depart_ligne(d, 0).
depart_ligne([T|Q], X) :- 
	(
		depart_ligne(T, X2);
		depart_ligne(Q, X2)
	),
	X is X2+1.

%% OK 

%% TROUVER UN DÉPART DANS UN LABYRINTHE (IE UN ENSEMBLE DE LISTES)

depart([T|_], X, 0) :-
	depart_ligne(T, X2),
	X is X2-1.

depart([_|Q], X, Y) :-
	depart(Q, X, Y2),
	Y is Y2+1.