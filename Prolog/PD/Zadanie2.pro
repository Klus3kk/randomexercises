% Zad 1
pionowy(odcinek(R, P)) :- R = punkt(X,Y1), P = punkt(X,Y2). 
poziomy(odcinek(R, P)) :- R = punkt(X1,Y), P = punkt(X2,Y). 

% Zad 2
regularny(prostokąt(punkt(X1,Y1),punkt(X2,Y2),punkt(X3,Y3),punkt(X4,Y4))) :- X1=X4,Y1=Y2,X2=X3,Y3=Y4.

% Zad 3 
move(state(west,W,G,west), farmer_west_cabbage, state(east,W,G,east)) :- safe(state(east,W,G,east)). % farmer west cabbage
move(state(west,west,G,C), farmer_west_wolf, state(east,east,G,C)) :- safe(state(east,east,G,C)). % farmer west wolf 
move(state(west,W,west,C), farmer_west_goat, state(east,W,east,C)) :- safe(state(east,W,east,C)). % farmer west goat
move(state(west,W,G,C), farmer_west_alone, state(east,W,G,C)) :- safe(state(east,W,G,C)). % farmer alone  
move(state(east,W,G,C), farmer_east_alone, state(west,W,G,C)) :- safe(state(west,W,G,C)). % farmer alone east 
move(state(east,W,east,C), farmer_east_goat, state(west,W,west,C)) :- safe(state(west,W,west,C)). % farmer east goat  
move(state(east,east,G,C), farmer_east_wolf, state(west,west,G,C)) :- safe(state(west,west,G,C)). % farmer east wolf 
move(state(east,W,G,east), farmer_east_cabbage, state(west,W,G,west)) :- safe(state(west,W,G,west)). % farmer east cabbage

safe(state(X,X,Y,X)).
safe(state(X,_,X,_)).

can_get(state(east, east, east, east)).
can_get(S1):- move(S1,M,S2), can_get(S2).