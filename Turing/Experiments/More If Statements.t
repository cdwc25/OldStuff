% Connor Cerisano
% 2016-10-17
% More If Statements

% Variables
var x1,x2,y1,y2,scolor:int

% Text Color
Text.Color (9)

% Ask User For Coordinates
put "What should the first X coordinate of the shape be?"
get x1

if x1 < 0 or x1 > 600 then 
put ""
Text.Color (12)
put "That is an invalid X coordinate. Try again."
Text.Color (9)
get x1
end if

put "" %Line Skipper

put "What should the first Y coordinate of the shape be?"
get y1

if y1 < 0 or y1 > 400 then 
put "" %Line Skipper
Text.Color (12)
put "That is an invalid Y coordinate. Try again."
Text.Color (9)
get y1
end if

put "" %Line Skipper

put "What should the second X coordinate of the shape be?"
get x2

if x1 > x2 and x2 < 600 then 
put "" %Line Skipper
Text.Color (12)
put "That is an invalid X coordinate. Try again."
Text.Color (9)
get x2
end if 

put "" %Line Skipper

put "What should the second Y coordinate of the shape be?"
get y2
if y1 > y2 and y2 < 400 then 
put "" %Line Skipper
Text.Color (12)
put "That is an invalid Y coordinate. Try again."
Text.Color (9)
get y2
end if

put "" %Line Skipper 

put "What should the color of the shape be? (0-255)"
get scolor 

put "" %Line Skipper

if scolor > 255 or scolor < 0 then 
Text.Color (12)
put "That is an incorrect color. Try again."
Text.Color (9)
get scolor
end if

put "" %Line Skipper

% Check and Determine The Shape
if x2-x1 not= y2-y1 then
put "Now drawing the rectangle."
else put "Now drawing the square."
end if

% Draw the square
delay (1000)
cls
drawfillbox (x1,y1,x2,y2,scolor)
