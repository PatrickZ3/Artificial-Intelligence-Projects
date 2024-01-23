	/* cps721, Part 2, NASA domain: taking images from satellites */
        
/* The following is necessary if rules with the same predicate in the head are not
 consecutive in your program. Read handout about Eclipse Prolog 6 for details.*/ 
:- dynamic pointsTo/3.

	/* Universal situations and fluents based planner  */

solve_problem(L,N)  :-  C0 is cputime,
                   max_length(L,N), 
                   reachable(S,L), goal_state(S),
                   Cf is cputime, D is Cf - C0, nl,
                   write('Elapsed time (sec): '), write(D), nl.

reachable(S,[]) :- initial_state(S).
reachable(S2, [M | History]) :- reachable(S1,History),
                        legal_move(S2,M,S1).

/*
reachable(S2, [M | History]) :- reachable(S1,History),
                        legal_move(S2,M,S1),
                        not useless(M,History).
*/
legal_move([A | S], A, S) :- poss(A,S).

initial_state([]).

max_length([],N).
max_length([_|L],N1) :- N1 > 0, N is N1 - 1, max_length(L,N).

:- [ 'initNASA' ].
/* This is to compile the file initNASA.pl  before you
   run a query. Do NOT insert this file here because your program 
   will be tested using different initial and goal states.      */

		/* Precondition Axioms */

%%% a satellite can only power up one instrument at a time
poss(up(Ins,Sat),S) :- not (powered(X, Sat, S), not X = Ins), supports(Ins,Sat,_).

poss(down(Ins,Sat),S) :- powered(Ins,Sat,S).

poss(turnTo(Sat, Dir1, Dir2),S) :- powered(Ins,Sat,S), pointsTo(Sat,Dir1,S), target(Ins, Dir1).
poss(turnTo(Sat, Dir1, Dir2),S) :- powered(Ins,Sat,S), pointsTo(Sat,Dir1,S), calibrated(Ins,Sat,S).
poss(turnTo(Sat, Dir1, Dir2),S) :- powered(Ins,Sat,S).

%%%  An instrument can be calibrated if it is pointed in a prespecified direction
%%% Assume that each instrument has a specific calibration target, which will be the ground station it must be pointing to in order to run the calibration procedure
poss(runCalibrateProc(Ins, Sat, G),S) :- target(Ins,G), powered(Ins,Sat,S), available(Sat, G), pointsTo(Sat,G,S).

%%% The satellite can take an image (in a specific mode) using any instrument that supports that mode, as
%%% long as the instrument is powered up, calibrated, and pointing in the direction of interest
poss(takeImage(Ins, Sat, M, Dir),S) :- powered(Ins,Sat,S), supports(Ins,Sat,M), pointsTo(Sat,Dir,S), calibrated(Ins,Sat,S).

		/* Successor state axioms */
powered(Ins, Sat, [up(Ins,Sat)|S]).
powered(Ins, Sat, [A|S]) :- not A = down(Ins, Sat).

pointsTo(Sat, Dir2, [turnTo(Sat, Dir1, Dir2)|S]).
pointsTo(Sat, Dir2, [A|S]) :- not A = turnTo(Sat, Dir1, Dir3), not Dir2 = Dir3, pointsTo(Sat, Dir2, S).

%%% When an instrument is powered up, it becomes uncalibrated
calibrated(Instr, Sat, [runCalibrateProc(Ins,Sat,G)|S]).
calibrated(Ins, Sat, [A|S]) :- not A = up(Ins,Sat), calibrated(Instr, Satell,S).

hasImage(Sat, M, Dir, [takeImage(Ins, Sat, M, Dir)|S]).

		/* Declarative heuristics */

