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
 
%%%%% ATOMIC: clockwise
% Add the atomic propositions for clockwise (part a) in this section
clockwise(north,east).
clockwise(east,south).
clockwise(south,west).
clockwise(west,north).
 
%%%%% ATOMIC: counterclockwise
% Add the atomic propositions for counterclockwise (part a) in this section
counterClockwise(east,north).
counterClockwise(south,east).
counterClockwise(west,south).
counterClockwise(north,west).
 
%%%%% ATOMIC: reverseDirection
% Add the atomic propositions for reverseDirection (part a) in this section
reverseDirection(north,south).
reverseDirection(south,north).
reverseDirection(east,west).
reverseDirection(west,east).
 
%%%%% ATOMIC: facing
% Add the atomic propositions for facing (part b) in this section
facing(toyota,south).
facing(nissan,north).
facing(chevrolet,east).
 
%%%%% ATOMIC: lightColour
% Add the atomic propositions for lightColour (part b) in this section
lightColour(north,green).
lightColour(south,green).
lightColour(east,red).
lightColour(west,red).
 
%%%%% RULE: canGo
% Add the rules for canGo in this section
% A car can turn right on a red light, if there is no car coming in on the left that can travel straight
canGo(Car,Direction) :- facing(Car,Direction2), lightColour(Direction2, Colour), Colour = red, clockwise(Direction2,Direction), not facing(Car2, Direction).
 
% A car can turn right on a yellow light.
canGo(Car,Direction) :- facing(Car,Direction2), lightColour(Direction2, Colour), Colour = yellow, counterClockwise(Direction2,Direction).
 
% A car can turn left on a yellow light. Note, that we are assuming traffic coming in the opposite direction has stopped when the light is yellow.
canGo(Car,Direction) :- facing(Car,Direction2), lightColour(Direction2, Colour), Colour = yellow, clockwise(Direction2,Direction).
 
% A car can go straight through an intersection on a green light.
canGo(Car,Direction) :- facing(Car,Direction2), lightColour(Direction2, Colour), Colour = green, Direction2 = Direction.
 
% A car can turn right on a green light.
canGo(Car,Direction) :- facing(Car,Direction2), lightColour(Direction2, Colour), Colour = green, counterClockwise(Direction,Direction2).
 
% A car can turn left on a green light if there is no car that is coming in the opposite direction.
canGo(Car,Direction) :- facing(Car,Direction2), lightColour(Direction2, Colour), Colour = green, clockwise(Direction,Direction2), reverseDirection(Direction2, ReverseDirection2), not facing(Car2, ReverseDirection2).
 
%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
