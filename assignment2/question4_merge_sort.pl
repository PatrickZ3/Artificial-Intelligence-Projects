% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Jason Quantrill
%%%%% NAME: Laura Jamikeshova
%%%%% NAME: Patrick Santoso Lay
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% RULE: listLength
% Add the rule(s) for listLength below
listLength(listTerm(V, empty_list), Length) :- Length is 1.
listLength(listTerm(V, List), Length1) :- listLength(List, Length2), Length1 is Length2 + 1.

%%%%% RULE: divideList
% Add the rule(s) for divideList below
divideList([H1|T1], Num, [H2|T2], SecondHalf):- not Num = H1, print(H1),H2 is H1, divideList(T1, Num, T2, SecondHalf).
divideList([H1|T1], Num, [H2|T2], SecondHalf):- Num = H1, print(H1),H2 is H1, SecondHalf is T1.
%%%%% RULE: mergeSortedLists
% Add the rule(s) for mergeSortedLists below


%%%%% Helpers
% Add any additional helpers below


%%%%% RULE: mergeSort
% Add the rule(s) for mergeSort below


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
