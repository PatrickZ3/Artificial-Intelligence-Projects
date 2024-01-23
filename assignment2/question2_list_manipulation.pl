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

%%%%% RULE: listMap
% Add the rule(s) for part a below
listMap([H1|T1], [H2|T2], H1, H2).
listMap([H1|T1], [H2|T2], X1, X2) :- listMap(T1, T2, X1, X2).

%%%%% RULE: encodeList
% Add the rule(s) for part b below
encodeList([], MKL, MVL, []).
encodeList([H1|T1], MKL, MVL, [H2|T2]) :- listMap(MKL, MVL, H1, H2), encodeList(T1, MKL, MVL, T2).

%%%%% RULE: consecutiveCount
%  Add the rule(s) for part c below 
consecutiveCount([],0).
consecutiveCount([X],0).
consecutiveCount(List, Count) :- sort(List,X), length(X,L), length(List,O), Count is O-L.
%%%%% RULE: splitOnInt
%  Add the rule(s) for part d below 
splitOnInt([], V, [], []).
splitOnInt([H1|T1], V, [H2|T2], []) :- H1 =< V, H1 = H2, splitOnInt(T1, V, T2, []).
splitOnInt([H1|T1], V, [], [H3|T3]) :- H1 > V, H1 = H3, splitOnInt(T1, V, [], T3).
splitOnInt([H1|T1], V, [H2|T2], [H3|T3]) :- H1 =< V, H1 = H2, splitOnInt(T1, V, T2, [H3|T3]).
splitOnInt([H1|T1], V, [H2|T2], [H3|T3]) :- H1 > V, H1 = H3, splitOnInt(T1, V, [H2|T2], T3).


%%%%% RULE: incAverage
% Add the rule(s) for part e below
incAverage([H1|T1],Av,Num) :- length([H1|T1],L), Num is L, sum([H1|T1],X), Av is X//Num. 


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
