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
praefix2(Xs,Ys) :- append(Xs,_,Ys).
suffix(Xs,Ys) :- app(Rs,Xs,Ys).
infix(Xs,Ys) :- app(Rs,Xs,Ws), app(Ws,Rs2,Ys), Rs\=nil, Rs2\=nil, Xs\=nil.

member1(X,list(X,Xs)). :- linListe(Xs).
member1(X,list(Y,Ys)) :- member1(X,Ys), linListe(Ys).

binbaum(e).
binbaum(n(X,Lb,Rb)) :- binbaum(Lb), binbaum(Rb).
root(n(X,Lb,Rb),X) :- binbaum(Lb), binbaum(Rb).

construct(Root,Lb,Rb,baum(Root,Lb,Rb)) :- binbaum(Lb), binbaum(Rb).
knotenanz(nil,N).
knotenanz(baum(X,Lb,Rb),s(N)) :- knotenanz(Lb,N), knotenanz(Rb,N).

add(o,X,X).
add(s(X),Y,s(XRes)) :- add(X,Y,XRes).


%Ys endet mit der Liste Xs
postfix(Xs,Ys) :- reverse(Rs2,Xs),praefix2(Rs2,Rs), reverse(Ys,Rs).
postfix2(Xs,Ys) :- append(_,Xs,Ys).

%Baum Xb enthält den Eintrag X : member(X,Xb)
memberB(X,n(X,Lb,Rb)):- binbaum(Lb), binbaum(Rb).
memberB(X,n(_,Lb,Rb)):- memberB(X,Lb), binbaum(Lb).
memberB(X,n(_,Lb,Rb)):- memberB(X,Rb), binbaum(Rb).

%Ys ist die Liste der Knotenbeschriftungen des Binärbaumes Xb in Präorder : präorder(Xb,Ys)
praeorder(e,[]).
praeorder(n(X,Lb,Rb),Ys) :- append([X],Ys3,Ys), append(Ys1,Ys2,Ys3), praeorder(Lb,Ys1), praeorder(Rb,Ys2).
%Ys ist die Liste der Knotenbeschriftungen des Binärbaumes Xb in Postorder : postorder(Xb,Ys)
postorder(e,[]).
postorder(n(X,Lb,Rb),Ys) :- append(Ys3,[X],Ys), append(Ys1,Ys2,Ys3), postorder(Lb,Ys1), postorder(Rb,Ys2).

roots([],[]).
roots([e|Ls],Ys) :- roots(Ls,Ys).
roots([n(X,Lb,Rb)|Ls],Ys) :- append([X],Ys1,Ys), roots(Ls,Ys1).




removeLastElement([],[]).
removeLastElement([_],[]).
removeLastElement([X|Xs],[X|Xs2]) :- removeLastElement(Xs,Xs2).




%P5
% L= {a^n b^n | n > 0}

z(z0).
z(z1).
sigma(a).
sigma(b).
gamma(a).
gamma(s).
kellersymbol(s).
start(z0).

delta(z0, [a], [s], z0, [a,s]).
delta(z0, [a], [a], z0, [a,a]).
delta(z0, [b], [a], z1, []).
delta(z1, [b], [a], z1, []).
delta(z1, [nix], [s], z1, []).




es(Z,[],[]).
es(Z,Xs,[K|Ks]) :- delta(Z,[nix],[K],Zn,Kns), append(Kns,Ks,Kns2), es(Zn,Xs,Kns2).
es(Z,[X|Xs],[K|Ks]) :- delta(Z,[X],[K],Zn,Kns), append(Kns,Ks,Kns2), es(Zn,Xs,Kns2).

sigma_stern([]).
sigma_stern([X|Ys]) :- sigma(X), sigma_stern(Ys).


lvonM(Ws) :-start(Zs), kellersymbol(K), es(Zs,Ws,[K]).

