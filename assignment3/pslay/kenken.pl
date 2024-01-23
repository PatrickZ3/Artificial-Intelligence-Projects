% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Jason Quantrill
%%%%% NAME: Laura Jamikeshova
%%%%% NAME: Patrick Santoso Lay
%
% Add the required atomic propositions and rules in the corresponding sections. 
% If you put the propositions and rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% ATOMIC
% Put any atomic statements needed here
digit(1).
digit(2).
digit(3).
digit(4).

%%%%% HELPER PREDICATES
% Put any helper predicates here (leave empty if you do not have any
all_diff([]).
all_diff([H|T]):- not inside(H ,T), all_diff(T).
inside(X,[X|T]).
inside(X,[H|T]):- inside(X,T).
subt(X, Y, Z):- Z is X - Y.
subt(Y, X, Z):- Z is X - Y.
divi(X, Y, Z):- Z is div(X,Y).
divi(Y, X, Z):- Z is div(X,Y).
addi(X, Y, Z):- Z is X + Y.
mult(X, Y, Z):- Z is X * Y.


%%%%% RULE: solve( ListOfVars )
% Add the rules defining your solve program
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES
solve([A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, C4, D1, D2, D3, D4]) :- 

digit(A1), digit(A2), subt(A1, A2, 1),
digit(A3), digit(A4), subt(A3, A4, 3),
all_diff([A1, A2, A3, A4]),
digit(B1), digit(C1), mult(B1, C1, 12),
digit(B2), digit(B3), divi(B2, B3, 2),
digit(B4), digit(C4), addi(B4, C4, 3),
all_diff([B1, B2, B3, B4]),
digit(C2), digit(C3), subt(C2, C3, 2),
all_diff([C1, C2, C3, C4]),
digit(D1), digit(D2), subt(D1, D2, 3),
digit(D3), digit(D4), subt(D3, D4, 1),
all_diff([D1, D2, D3, D4]),
all_diff([A1, B1, C1, D1]),
all_diff([A2, B2, C2, D2]),
all_diff([A3, B3, C3, D3]),
all_diff([A4, B4, C4, D4]).




%%%%% RULE: print_solution ( ListOfVars )
%  Add rules the prints your solution in a readable format
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES
print_solution([A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, C4, D1, D2, D3, D4]):-
solve([A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, C4, D1, D2, D3, D4]),
write('Solution : '),nl,
write('-------------------------'),nl,
write('A1='),write(A1),write(' | '),write('B1='),write(B1),write(' | '),write('C1='),write(C1),write(' | '),write('D1='),write(D1),nl,
write('-------------------------'),nl,
write('A2='),write(A2),write(' | '),write('B2='),write(B2),write(' | '),write('C2='),write(C2),write(' | '),write('D2='),write(D2),nl,
write('-------------------------'),nl,
write('A3='),write(A3),write(' | '),write('B3='),write(B3),write(' | '),write('C3='),write(C3),write(' | '),write('D3='),write(D3),nl,
write('-------------------------'),nl,
write('A4='),write(A4),write(' | '),write('B4='),write(B4),write(' | '),write('C4='),write(C4),write(' | '),write('D4='),write(D4),nl,
write('-------------------------'),nl.


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
