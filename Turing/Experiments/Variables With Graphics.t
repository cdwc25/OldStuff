% Connor Cerisano
% 2016-10-11
% Name: Variables with Graphics

% Variables
var x1,y1,x2,y2,scolor:int % Variables for drawfillbox

% Instruction
put "You are about to draw a rectangle/square using your own coordinates."
delay (2500)
cls

% Ask Info For Square
put "What is the first X-location? " ..
get x1
put "What is the first y-location? "..
get y1
put "What is the second x-location? "..
get x2
put "What is the second y-location? "..
get y2
put "What color should the shape be? "..
get scolor

% Extra
delay (500)
cls
put "I will now draw your shape."
delay (2000)
cls

% Draw Shape
drawfillbox (x1,y1,x2,y2,scolor)

delay (5000)
cls

% Triangle Variables
var v1,v1y,v2,v2y,v3,v3y:int

%Instruction
put "Now we are going to make a triangle."
delay (2000)
cls

% Ask Info For Triangle
put "What should point 1 be? (X, Y) "..
get v1 
get v1y

put "What should point 2 be? (X, Y) "..
get v2 
get v2y

put "What should point 3 be? (X, Y) "..
get v3 
get v3y

% Extra
cls
put "I am now going to draw the triangle."
delay (2000)
cls

% Draw The Triangle
drawline (v1, v1y, v2, v2y, 7)
drawline (v2, v2y, v3, v3y, 7)
drawline (v3, v3y, v1, v1y, 7)
drawfill (300,300,7,7)


