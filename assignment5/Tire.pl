	/* cps721, assignment 5, Part 1: how to replace a flat tire */
        
/* The following rules are necessary if rules with the same predicate in the head 
   are not consecutive in your program. Read Handout "How to use Eclipse Prolog 6"
   in labs for details.    */ 
%% :- dynamic inside/3, on/3, tight/3, isClosed/2, fastened/2, inflated/2.
:- discontiguous(inside/3).
:- discontiguous(on/3).
:- discontiguous(tight/3).
:- discontiguous(isClosed/2).
:- discontiguous(fastened/2).
:- discontiguous(inflated/2).

	/* Universal situations and fluents based planner  */

solve_problem(G,L,N)  :-  C0 is cputime,
                   max_length(L,N), 
                   reachable(S,L), goal_state(G,S),
                   Cf is cputime, D is Cf - C0, nl,
                   write('Elapsed time (sec): '), write(D), nl.

reachable(S,[]) :- initial_state(S).

% reachable(S2, [M | History]) :- reachable(S1,History),legal_move(S2,M,S1).

reachable(S2, [M | History]) :- reachable(S1,History),
                        legal_move(S2,M,S1),
                        not useless(M,History).

legal_move([A | S], A, S) :- poss(A,S).

initial_state([]).

max_length([],N).
max_length([_|L],N1) :- N1 > 0, N is N1 - 1, max_length(L,N).

	%% Initial situation and a domain specification %%
:- [ 'initTire' ].
/* This is to compile the file initTire.pl  before you
   run a query. Do NOT insert this file here because your program 
   might be tested using different initial and goal states.      */

		/* Precondition Axioms */
   poss(open(C),S):- isClosed(C,S), is_container(C).
   poss(close(C),S) :- not isClosed(C,S), is_container(C).
   poss(fetch(X,Y),S) :- inside(X,Y,S), not isClosed(Y,S).
   poss(putAway(X,Y),S) :- have(X,S), not isClosed(Y,S).
   poss(loosen(X,Y),S) :- have(wrench,S), nut(X), hub(Y), tight(X,Y,S), on(X,Y,S).
   poss(tighten(X,Y),S):- have(wrench,S), nut(X), hub(Y), not tight(X,Y,S), on(X,Y,S).
   % After jackUp we should not have(jack,S)
   poss(jackUp(Object),S) :- hub(Object), have(jack,S), not lifted(Object,S), on(Object,ground,S), not tight(N,Object,S).
   % we can only jackDown when we not have(jack,S)
   poss(jackDown(Object),S) :- hub(Object), lifted(Object,S), not on(Object,ground,S). %not tight(N,Object,S).
   poss(remove(N,H),S) :- nut(N), hub(H), lifted(H,S), not tight(N,H,S), on(N,H,S), have(wrench,S).
   poss(putOn(N,H),S) :- nut(N), hub(H), have(N,S), lifted(H,S), not fastened(H,S), have(wrench,S), not on(N,H,S).
   poss(remove(W,H),S) :- wheel(W), hub(H), lifted(H,S), on(W,H,S), not fastened(H,S).
   poss(putOn(W,H),S) :- wheel(W), have(W,S), lifted(H,S), free(H,S), not fastened(H,S), not on(W,H,S).
   


		/* Successor State Axioms */

isClosed(C, [close(C)|S]).
isClosed(C, [A|S]) :- not A=open(C), isClosed(C,S).

inside(Object, Container, [putAway(Object,Container) | S]) :- is_container(Container).
inside(Object, Container, [A | S]) :- inside( Object, Container, S ), not A=fetch(Object,Container).

have(jack,[jackDown(Object)|S]).
%have(jack,[A|S]) :- not A=jackUp(Object), have(jack,S).
have(X,[fetch(X,Y)|S]).
have(X,[remove(X,Y)|S]).
%have(X,[A|S]) :- not A=putAway(X,Y), have(X,S).
have(X,[A|S]) :- not A=putAway(X,Y), not A=putOn(X,H), have(X,S).

tight(N, H, [tighten(N,H)|S]).
tight(N, H, [A|S]) :- not A=loosen(N,H), tight(N,H,S).

lifted(X, [jackUp(X)|S]).
lifted(X, [A|S]) :- not A=jackDown(X), lifted(X,S).

on(X, Y, [putOn(X,Y)|S]).
on(X, Y, [A|S]) :- not A=remove(X,Y), not A=jackUp(X), on(X,Y,S).
on(X, ground, [jackDown(X)|S]).
on(X, ground, [A|S]) :- not A=jackUp(X), on(X,ground,S).

fastened(H,[putOn(N,H)|S]) :- nut(N).
fastened(H,[A|S]) :- not A=remove(N,H), nut(N), fastened(H,S).

free(H,[remove(W,H)|S]) :- wheel(W), hub(H).
free(H,[A|S]) :- not A=(putOn(W,H)), free(H,S).


		/* Declarative  Heuristics */

%useless(A,[A|S]).
%useless(close(C), [A|S]):- useless(close(C),S).
%useless(open(C),[A|S]) :- useless(open(C),S).

%%%open happens at the beginning
useless(open(X), [open(A)|S]).
useless(open(X), [close(A)|S]).
useless(open(X), [fetch(A,B)|S]).
useless(open(X), [putAway(A,B)|S]).
useless(open(X), [jackUp(A)|S]).
useless(open(X), [jackDown(A)|S]).
useless(open(X), [loosen(A,B)|S]).
useless(open(X), [tighten(A,B)|S]).
useless(open(X), [remove(A,B)|S]).
useless(open(X), [putOn(A,B)|S]).

%%%close happens after putAway
useless(close(X), [open(A)|S]).
useless(close(X), [close(A)|S]).
useless(close(X), [fetch(A,B)|S]).
useless(close(X), [jackUp(A)|S]).
useless(close(X), [jackDown(A)|S]).
useless(close(X), [loosen(A,B)|S]).
useless(close(X), [tighten(A,B)|S]).
useless(close(X), [remove(A,B)|S]).
useless(close(X), [putOn(A,B)|S]).

%%%fetch happens after open
%%%fetch hapens after fetch
useless(fetch(X,Y), [close(A)|S]).
useless(fetch(X,Y), [putAway(A,B)|S]).
useless(fetch(X,Y), [jackUp(A)|S]).
useless(fetch(X,Y), [jackDown(A)|S]).
useless(fetch(X,Y), [loosen(A,B)|S]).
useless(fetch(X,Y), [tighten(A,B)|S]).
useless(fetch(X,Y), [remove(A,B)|S]).
useless(fetch(X,Y), [putOn(A,B)|S]).
%useless(fetch(X,Y),[putAway(A,B)|S]).
%useless(fetch(X,Y),[A|S]) :- useless(fetch(X,Y),S).

%%%putAway(W,H) happens after remove(W,H)
%%%putAway(W1,H1) happens after putOn(W2,H2)
useless(putAway(X,Y), [open(A)|S]).
useless(putAway(X,Y), [close(A)|S]).
useless(putAway(X,Y), [jackUp(A)|S]).
useless(putAway(X,Y), [jackDown(A)|S]):- wheel(X).
useless(putAway(X,Y), [jackDown(A)|S]):- nut(X).
useless(putAway(X,Y), [fetch(A,B)|S]).
useless(putAway(X,Y), [loosen(A,B)|S]).
%%% useless if we put away a nut after removving the wheel
%%% useless if we put away a nut after removving the nut
%%% useless if we put away a wheel after removving the nut
%%% useless if we put away a jack after removving the wheel
%%% useless if we put away a jack after removving the nut
%%% useless if we put away a wrench after removving the wheel
%%% useless if we put away a wrench after removving the nut
useless(putAway(X,Y), [remove(A,B)|S]) :- not wheel(X).
useless(putAway(X,Y), [putOn(A,B)|S]) :- not wheel(X), not wheel(A).

%%%loosen happens after fetch
useless(loosen(X,Y), [open(A)|S]).
useless(loosen(X,Y), [close(A)|S]).
useless(loosen(X,Y), [putAway(A,B)|S]).
useless(loosen(X,Y), [jackUp(A)|S]).
useless(loosen(X,Y), [jackDown(A)|S]).
useless(loosen(X,Y), [loosen(A,B)|S]).
useless(loosen(X,Y), [tighten(A,B)|S]).
useless(loosen(X,Y), [remove(A,B)|S]).
useless(loosen(X,Y), [putOn(A,B)|S]).
%useless(loosen(X,Y),[A|S]) :- useless(loosen(X,Y),S).

%%%tighten happens after jackDown
%%% we should be able to tighten nut after puton nut
%%% useless if we tighten nut after put on wheel
useless(tighten(X,Y), [open(A)|S]).
useless(tighten(X,Y), [close(A)|S]).
useless(tighten(X,Y), [putAway(A,B)|S]).
useless(tighten(X,Y), [jackUp(A)|S]).
useless(tighten(X,Y), [loosen(A,B)|S]).
useless(tighten(X,Y), [tighten(A,B)|S]).
useless(tighten(X,Y), [remove(A,B)|S]).
useless(tighten(N,H), [putOn(W,H)|S]) :- nut(N), wheel(W).
useless(tighten(X,Y), [fetch(A,B)|S]).

%%%jackUp happens after loosen
useless(jackUp(X), [open(A)|S]).
useless(jackUp(X), [close(A)|S]).
useless(jackUp(X), [putAway(A,B)|S]).
useless(jackUp(X), [jackUp(A)|S]).
useless(jackUp(X), [jackDown(A)|S]).
useless(jackUp(X), [fetch(A,B)|S]).
useless(jackUp(X), [tighten(A,B)|S]).
useless(jackUp(X), [remove(A,B)|S]).
useless(jackUp(X), [putOn(A,B)|S]).
%useless(jackUp(X),[A|S]) :- useless(jackUp(X),S).

%%%jackdown happens after putOn(N,H).
%%% we can jackdown regardless if the wheel or nuts is not puton so we can jack down any time we want
useless(jackDown(X), [open(A)|S]).
useless(jackDown(X), [close(A)|S]).
useless(jackDown(X), [fetch(A,B)|S]).
useless(jackDown(X), [putAway(A,B)|S]).
useless(jackDown(X), [tighten(A,B)|S]).
useless(jackDown(X), [loosen(A,B)|S]).
useless(jackDown(X), [jackUp(A)|S]).
useless(jackDown(X), [jackDown(A)|S]).
useless(jackDown(X), [tighten(A,B)|S]).
useless(jackDown(X), [remove(A,B)|S]).
% useless(jackDown(X), [putOn(A,B)|S]) :- wheel(A).

%%%putOn(N,H) happens after putOn(W,H)
%%%putOn(W2,H) happens remove(W1,H)
useless(putOn(X,Y), [open(A)|S]).
useless(putOn(X,Y), [close(A)|S]).
useless(putOn(X,Y), [fetch(A,B)|S]).
%useless(putOn(X,Y), [putAway(A,B)|S]).
useless(putOn(X,Y), [loosen(A,B)|S]).
useless(putOn(X,Y), [tighten(A,B)|S]).
useless(putOn(X,Y), [jackUp(A)|S]).
useless(putOn(X,Y), [jackDown(A)|S]).
useless(putOn(W,H), [putOn(N,H)|S]) :- nut(N), wheel(W).
useless(putOn(W,H), [remove(N,H)|S]) :- nut(N), wheel(W).
useless(putOn(N,H), [remove(N,H)|S]) :- nut(N).

%%%remove(N,H) happens after jackUp
%%%remove(W,H) happens after remove (N,H)
useless(remove(X,Y), [open(A)|S]).
useless(remove(X,Y), [close(A)|S]).
useless(remove(X,Y), [putAway(A,B)|S]).
useless(remove(X,Y), [loosen(A)|S]).
useless(remove(X,Y), [jackDown(A)|S]).
useless(remove(X,Y), [fetch(A,B)|S]).
useless(remove(X,Y), [tighten(A,B)|S]).
useless(remove(X,Y), [putOn(A,B)|S]).
useless(remove(N,H), [remove(W,B)|S]) :- nut(N), wheel(W).
useless(remove(W,H), [jackUp(A)|S]) :- wheel(W).

%useless(fetch(X,Y),[A|S]) :- not 
%useless(loosen(N,H),[A|S]) :- print(A), print(N), print(H),
                                 %print("\n"), not (A = fetch(_,_)).
%useless(loosen(N,H),[A|S]) :- print(A), print(' '), print(S), print("\n"),not A = fetch(X,Y).
%useless(jackUp(H),[A|S]) :- not A = loosen(N,H), nut(N).
%useless(remove(N,H),[A|S]) :- not A = jackUp(H).
%useless(remove(W,H),[A|S]) :- not A = remove(N,H), nut(N).
%useless(putOn(X,Y),[A|S]) :- not A = remove(Z,Y).