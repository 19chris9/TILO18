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









linListe(nil).
linListe(list(X,Xs)) :- linListe(Xs).


head(list(X,Xs),X).
tail(list(X,Xs),Xs).
app(nil,X,X).
app(list(X,Xs),list(Y,Ys), list(X, Ws)) :- app(Xs,list(Y,Ys),Ws).

praefix(Xs,Ys) :- app(Xs,Rs,Ys).
suffix(Xs,Ys) :- app(Rs,Xs,Ys).
infix(Xs,Ys) :- app(Rs,Xs,Ws), app(Ws,Rs2,Ys), Rs\=nil, Rs2\=nil, Xs\=nil.

member1(X,list(X,Xs)). :- linListe(Xs).
member1(X,list(Y,Ys)) :- member1(X,Ys), linListe(Ys).

binbaum(nil).
binbaum(baum(X,Lb,Rb)) :- binbaum(Lb), binbaum(Rb).
root(baum(X,Lb,Rb),X) :- binbaum(Lb), binbaum(Rb).

construct(Root,Lb,Rb,baum(Root,Lb,Rb)) :- binbaum(Lb), binbaum(Rb).
knotenanz(nil,N).
knotenanz(baum(X,Lb,Rb),s(N)) :- knotenanz(Lb,N), knotenanz(Rb,N).