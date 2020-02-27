%Experiment 1
%Description: A star bounces off the screen

var x : int := 0

procedure reverse
loop
x := x - 1
drawfillstar (x,100,x + 10,110,13)
delay (5)
cls
end loop
end reverse

loop
if x < maxx then
x := x + 1
drawfillstar (x,100,x + 10,110,13)
else
reverse
end if
delay (5)
cls
end loop
