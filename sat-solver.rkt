; MIT License
;
; Copyright (c) 2016 Vincent Nys
; 
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
; 
; The above copyright notice and this permission notice shall be included in all
; copies or substantial portions of the Software.
; 
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
; SOFTWARE.

; this is a CCLP implementation of the logic programming pearl by Howe and King
; it is of particular interest because it uses the case split mechanism in CCLP

#lang cclp
{PROGRAM}
sat(Clauses, Vars) :-
  problem_setup(Clauses),
  elim_var(Vars).

elim_var([]).
elim_var([Var|Vars]) :-
  elim_var(Vars),
  assign(Var).

assign(true).
assign(false).

problem_setup([]).
problem_setup([Clause|Clauses]) :-
  clause_setup(Clause),
  problem_setup(Clauses).

clause_setup([pair(Pol,Var)|Pairs]) :- set_watch(Pairs,Var,Pol).

% TODO: verify that unify is right construct here
set_watch([], Var, Pol) :- unify(Var,Pol).
set_watch([pair(Pol2,Var2)|Pairs],Var1,Pol1):-
  watch(Var1, Pol1, Var2, Pol2, Pairs).

% TODO
% don't need block condition, that's what CCLP is for...
watch(Var1, Pol1, Var2, Pol2, Pairs) :-
nonvar(Var1) ->
update_watch(Var1, Pol1, Var2, Pol2, Pairs);
update_watch(Var2, Pol2, Var1, Pol1, Pairs).

{FULL EVALUATION}


{CONCRETE CONSTANTS}
nil

{QUERY}