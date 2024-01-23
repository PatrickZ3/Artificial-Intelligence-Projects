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
digit(0).
digit(1).
digit(2).
digit(3).
digit(4).
digit(5).
digit(6).
digit(7).
digit(8).
digit(9).

%%%%% HELPER PREDICATES
% Put any helper predicates here (leave empty if you do not have any
all_diff([]).
all_diff([H|T]):- not inside(H ,T), all_diff(T).
inside(X,[X|T]).
inside(X,[H|T]):- inside(X,T).

%%%%% RULE: solve( ListOfVars )
% Add the rules defining your solve program
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES
solve([A,C,H,I,O,R,S,T,W]):- 
    digit(A),
    digit(C),C > 0,
    digit(H),
    digit(I),
    digit(O),
    digit(R),
    digit(S),S > 0,
    digit(T),T > 0,
    digit(W), W > 0,
    
    % Make sure all leading digits are not zeroes
    
    % Multiplication
    S is (O * W) mod 10,M1 is (O * W)// 10,
    T is(O * A + M1) mod 10, M10 is (O * A + M1)// 10,
    R is(O * R + M10) mod 10, M100 is (O * R + M10)// 10,
    A is (O * T + M100) mod 10, M1000 is(O * T + M100)// 10,
    W is (O * S + M1000),

    W is (T * W) mod 10,M2 is (T * W)// 10,
    A is(T * A + M2) mod 10, M20 is (T * A + M2)// 10,
    R is(T * R + M20) mod 10, M200 is (T * R + M20)// 10,
    T is (T * T + M200) mod 10, M2000 is(T * T + M200)// 10,
    S is (T * S + M2000),
    
    % addition
    R is (T + W) mod 10, A1 is (T + W)// 10,
    I is (R + A + A1) mod 10, A10 is (R + A + A1)// 10,
    A is (A + R + A10) mod 10, A100 is (A + R + A10)// 10,
    H is (W + T + A100) mod 10, A1000 is (W + T + A100)// 10,
    C is (S + A1000) mod 10,
    
    % Make sure all variables have unique digit
    all_diff([A,C,H,I,O,R,S,T,W])
    .
%%%%% RULE: print_solution ( ListOfVars )
%  Add rules the prints your solution in a readable format
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES
print_solution([A,C,H,I,O,R,S,T,W]) :-
solve([A,C,H,I,O,R,S,T,W]),
write('Solution:'),nl,
write('A has the value of '), write(A),nl,
write('C has the value of '), write(C),nl,
write('H has the value of '), write(H),nl,
write('I has the value of '), write(I),nl,
write('O has the value of '), write(O),nl,
write('R has the value of '), write(R),nl,
write('S has the value of '), write(S),nl,
write('T has the value of '), write(T),nl,
write('W has the value of '), write(W).


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
    