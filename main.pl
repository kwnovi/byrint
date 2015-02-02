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

depart_ligne(d).
depart_ligne([T|Q]):- depart_ligne(T); depart_ligne(Q). 

%% OK 

%% TROUVER UN DÉPART DANS UN LABYRINTHE (IE UN ENSEMBLE DE LISTES)

depart([T|Q]):-depart_ligne([T|Q]).
depart([T|Q]):- depart_ligne(T);depart_ligne(Q).

