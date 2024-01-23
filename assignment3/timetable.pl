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
hour(10). hour(11). hour(12). hour(13). hour(14). hour(15).
section(1). section(2).
lunch_hour(12). lunch_hour(13).
art(10, 1).
art(11, 2).
dance(13, 1).
math(11, 15, 15, 1).
math(14, 14, 11, 2).                                           
cps(11, 11, 12, 1).
cps(12, 12, 15, 2).



%%%%% HELPER PREDICATES
% Put any helper predicates here (leave empty if you do not have any)
lunch(Time1, Time2, Time3) :- lunch_hour(Time1), lunch_hour(Time2), lunch_hour(Time3).


%%%%% RULE: solve( ListOfVars )
% Add the rules defining your solve program
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

solve([Art_section, Dance_section, Math_section, Cps_section, Lunch_time1, Lunch_time2, Lunch_time3]) :-
                                                                  art(Art_time, Art_section),
                                                                  dance(Dance_time, Dance_section),
                                                                    not Art_time = Dance_time, not Art_time is Dance_time + 1, not Art_time is Dance_time + 2,
                                                                  math(Math_time1, Math_time2, Math_time3, Math_section), 
                                                                    not Math_time1 = Art_time, not Math_time2 = Art_time, not Math_time3 = Art_time,
                                                                    not Math_time3 = Dance_time, not Math_time3 is Dance_time + 1, not Math_time3 is Dance_time + 2,
                                                                  cps(Cps_time1, Cps_time2, Cps_time3, Cps_section),
                                                                    not Cps_time1 = Art_time, not Cps_time2 = Art_time, not Cps_time3 = Art_time,
                                                                    not Cps_time3 = Dance_time, not Cps_time3 is Dance_time + 1, not Cps_time3 is Dance_time + 2,
                                                                    not Cps_time1 = Math_time1, not Cps_time2 = Math_time2, not Cps_time3 = Math_time2,
                                                                  lunch(Lunch_time1, Lunch_time2, Lunch_time3),
                                                                    not Lunch_time1 = Art_time, not Lunch_time2 = Art_time, not Lunch_time3 = Art_time,
                                                                    not Lunch_time3 = Dance_time, not Lunch_time3 is Dance_time + 1, not Lunch_time3 is Dance_time + 2,
                                                                    not Lunch_time1 = Math_time1, not Lunch_time2 = Math_time2, not Lunch_time3 = Math_time3,
                                                                    not Lunch_time1 = Cps_time1, not Lunch_time2 = Cps_time2, not Lunch_time2 = Cps_time3
                                                                  .

%%%%% RULE: print_solution ( ListOfVars )
%  Add rules the prints your solution in a readable format
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES
print_solution(Sections) :- solve([Art_section, Dance_section, Math_section, Cps_section, Lunch_time1, Lunch_time2, Lunch_time3]),
write('art section '), write(Art_section), nl,
write('dance section '), write(Dance_section), nl,
write('math section '), write(Math_section), nl,
write('compsci section '), write(Cps_section), nl,
write('lunch time on first day '), write(Lunch_time1), nl,
write('lunch time on second day '), write(Lunch_time2), nl,
write('lunch time on third day '), write(Lunch_time3), nl
.


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
