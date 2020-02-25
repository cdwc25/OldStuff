%Experiment 2
%Description: Random boxes draw more faster as time goes on, relative to the mouse

var mousex, mousey, x2, y2, button : int
x2 := 100
y2 := 100
var faster : int
faster := 1000

loop
    for i : 1 .. 1
	mousewhere (mousex, mousey, button)
	drawbox (mousex, mousey, x2, y2, Rand.Int (0, 255))
	View.Update
	drawdot (Rand.Int (0,maxx),Rand.Int (0,maxy),0)
	x2 := x2 + Rand.Int (-100, 100)
	y2 := y2 - Rand.Int (-100, 100)
	delay (faster)
	faster := faster - 50
    end for
end loop
