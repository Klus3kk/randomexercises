% Krok 1.
kobieta(maria).
kobieta(ewa).
kobieta(joanna).
kobieta(agata).
kobieta(anna).
kobieta(agnieszka).
kobieta(beata).
kobieta(iwona).

mężczyzna(piotr).
mężczyzna(adam).
mężczyzna(marek).
mężczyzna(robert).
mężczyzna(jan).
mężczyzna(krzysztof).
mężczyzna(radek).
mężczyzna(darek).
mężczyzna(tomek).
mężczyzna(jacek).

rodzic(maria, agata).
rodzic(piotr, agata).
rodzic(maria, marek).
rodzic(piotr, marek).
rodzic(maria, jan).
rodzic(piotr, jan).
rodzic(adam, anna).
rodzic(ewa, anna).
rodzic(adam, joanna).
rodzic(ewa, joanna).
rodzic(adam, krzysztof).
rodzic(ewa, krzysztof).
rodzic(robert, radek).
rodzic(robert, beata).
rodzic(agata, radek).
rodzic(agata, beata).
rodzic(jan, darek).
rodzic(jan, tomek).
rodzic(anna, darek).
rodzic(anna, tomek).
rodzic(krzysztof, jacek).
rodzic(krzysztof, iwona).
rodzic(agnieszka, jacek).
rodzic(agnieszka, iwona).
% Krok 2
matka(X,Y) :- rodzic(X, Y), kobieta(X).
ojciec(X,Y) :- rodzic(X, Y), mężczyzna(X).
siostra(X,Y) :- rodzeństwo(X,Y), kobieta(X).
brat(X,Y) :- rodzeństwo(X,Y), mężczyzna(X).
babcia(X,Y) :- rodzic(Z,Y),rodzic(X,Z),kobieta(X).
dziadek(X,Y) :- rodzic(Z,Y),rodzic(X,Z),mężczyzna(X).
wuj(X,Y) :- rodzic(Z, Y), rodzeństwo(X,Z),kobieta(Z),mężczyzna(X).
stryj(X,Y) :- rodzic(Z, Y), rodzeństwo(X,Z),mężczyzna(Z),mężczyzna(X).
kuzyn(X,Y) :-  rodzic(Z,Y), rodzic(A, X), rodzeństwo(Z,A), mężczyzna(X).
rodzeństwo(X,Y) :- rodzic(Z,X), rodzic(Z,Y), X \= Y.
% Krok 3
małżeństwo(maria, piotr).
małżeństwo(adam, ewa).
małżeństwo(robert, agata).
małżeństwo(jan, anna).
małżeństwo(krzysztof, agnieszka).
żona(X,Y) :- małżeństwo(Y,X),(kobieta(X)).
żona(X,Y) :- małżeństwo(X,Y),(kobieta(X)).

mąż(X,Y) :- małżeństwo(X,Y),(mężczyzna(X)).
mąż(X,Y) :- małżeństwo(Y,X),(mężczyzna(X)).

teściowa(X,Y) :- matka(X,Z),małżeństwo(Y,Z), mężczyzna(Y).
teściowa(X,Y) :- matka(X,Z),małżeństwo(Z,Y), mężczyzna(Y).



szwagier(X,Y) :- żona(Z,Y), rodzeństwo(Z, X), mężczyzna(Y),mężczyzna(X). 
szwagier(X,Y) :- żona(Z,X), rodzeństwo(Z, Y), mężczyzna(X).
