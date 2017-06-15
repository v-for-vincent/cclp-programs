#lang cclp
{PROGRAM}
cqueens(N,D) :-
  genlist(N,L),
  draw(N,L,D),
  confused(D).

genlist(N,L) :-
  gteq(N,1),
  genlist_acc(N,[],L).
genlist_acc(N,Acc,L) :-
  gt(N,1),
  minus(N,1,Nmin),
  genlist_acc(Nmin,[N|Acc],L).
genlist_acc(1,Acc,[1|Acc]).

draw(0,Any,[]).
draw(N,L,[E|R]) :-
  gt(N,0),
  minus(N,1,N1),
  member(E,L),
  draw(N1,L,R).

confused([]).
confused([Any]).
confused([A,B|C]) :-
  attack_all(A,1,[B|C]),
  confused([B|C]).

attack_all(AnyX,AnyY,[]).
attack_all(A,Off,[B|C]) :-
  plus(Off,1,Off1),
  attack(A,Off,B),
  attack_all(A,Off1,C).

attack(A,Any,A).
attack(A,Off,B) :-
  min(A,B,Diff),
  abs(Diff,Off).

{FULL EVALUATION}
genlist(γ1,α1) -> α1/γ2.
gteq(γ1,γ2).
minus(γ1,γ2,α1) -> α1/γ3.
gt(γ1,γ2).
member(α1,γ1) -> α1/γ2.
plus(γ1,γ2,α1) -> α1/γ3.
abs(γ1,α1) -> α1/γ2.
attack(γ1,γ2,γ3).

{CONCRETE CONSTANTS}
nil

{QUERY}
cqueens(γ1,α1)
