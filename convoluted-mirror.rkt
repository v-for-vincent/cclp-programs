% a (rather convoluted) way of checking whether a line of points is mirrored around the horizontal axis
% assume we have unorthodox drawing procedures, e.g. a procedure that works from the middle outwards

% this requires a multi for the conjunctions appearing before *and* after the 'mirrored' atoms (there will be no internal/external bindings)
% in any case, it is interesting to note that this scenario is theoretically possible

mirrored([0]).
mirrored([X1,X2|Xs]) :-
  invert(X1,Y),
  chop([X1,X2|Xs],Chopped),
  mirrored(Chopped),
  % draw X at last ininterrupted "empty" column
  % draw Y at column after first nonempty column
  last([X1,X2|Xs],Y).

invert(X,Y) :- Y is -X.
chop([A,B|C],Chopped) :- init([A,B|C],[A|Chopped]).
init([Any],[]).
init([X1,X2|Xs],[X1|Rest]) :- init([X2|Xs],Rest).
