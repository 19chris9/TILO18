% Autor:
% Datum: 29.04.2018

maennlich(christian).
maennlich(marek).
maennlich(lukas).
maennlich(bogdan).
weiblich(hildegard).
weiblich(anna).
vater(bogdan,christian).
vater(bogdan,marek).
vater(bogdan,anna).
vater(bogdan,lukas).
mutter(hildegard,X) :- vater(bogdan,X).
sohn(X,Y) :- vater(Y,X), maennlich(X).
sohn(X,Y) :- mutter(Y,X), maennlich(X).
tochter(X,Y) :- vater(Y,X), weiblich(X).
tochter(X,Y) :- mutter(Y,X), weiblich(X).
bruder(X,Y) :- vater(Z,X), vater(Z,Y), maennlich(Y), X\=Y.
%bruder(X,Y) :- mutter(Z,X), mutter(Z,Y), maennlich(Y).
schwester(X,Y) :- vater(Z,X), vater(Z,Y), weiblich(Y), X\=Y.
%schwester(X,Y) :- mutter(Z,X), mutter(Z,Y), weiblich(Y).