var key : array char of boolean
var x, y : int := 300
procedure avatar (x : int, y : int, mode : int)
    var x2 : int := x
    var y2 : int := y
    drawoval (x, y, 30, 30, 7)
    case mode of
	label 0 :
	    drawfilloval (x2, y2, 10, 10, 7)
	label 1 : % RIGHT
	    drawfilloval (x2 + 10, y2, 10, 10, 7)
	label 2 : % UP
	    drawfilloval (x2, y2 + 10, 10, 10, 7)
	label 3 : % LEFT
	    drawfilloval (x2 - 10, y2, 10, 10, 7)
	label 4 : % DOWN
	    drawfilloval (x2, y2 - 10, 10, 10, 7)
	label 5 : % UPRIGHT
	    drawfilloval (x2 + 10, y2 + 10, 10, 10, 7)
	label 6 : % UPLEFT
	    drawfilloval (x2 - 10, y2 + 10, 10, 10, 7)
	label 7 : % DOWNRIGHT
	    drawfilloval (x2 + 10, y2 - 10, 10, 10, 7)
	label 8 : % DOWNLEFT
	    drawfilloval (x2 - 10, y2 - 10, 10, 10, 7)
    end case
end avatar
loop
    delay (10)
    Input.KeyDown (key)
    cls
    if key (KEY_UP_ARROW) and not key (KEY_LEFT_ARROW) and not key (KEY_RIGHT_ARROW) then
	y := y + 1
	avatar (x, y, 2)
    elsif key (KEY_DOWN_ARROW) and not key (KEY_LEFT_ARROW) and not key (KEY_RIGHT_ARROW) then
	y := y - 1
	avatar (x, y, 4)
    elsif key (KEY_LEFT_ARROW) and not key (KEY_UP_ARROW) and not key (KEY_DOWN_ARROW) then
	x := x - 1
	avatar (x, y, 3)
    elsif key (KEY_RIGHT_ARROW) and not key (KEY_UP_ARROW) and not key (KEY_DOWN_ARROW) then
	x := x + 1
	avatar (x, y, 1)
    elsif key (KEY_UP_ARROW) and key (KEY_LEFT_ARROW) then
	y := y + 1
	x := x - 1
	avatar (x, y, 6)
    elsif key (KEY_UP_ARROW) and key (KEY_RIGHT_ARROW) then
	y := y + 1
	x := x + 1
	avatar (x, y, 5)
    elsif key (KEY_DOWN_ARROW) and key (KEY_LEFT_ARROW) then
	y := y - 1
	x := x - 1
	avatar (x, y, 8)
    elsif d (KEY_DOWN_ARROW) and r (KEY_RIGHT_ARROW) then
	y := y - 1
	x := x + 1
	avatar (x, y, 7)
    else
	avatar (x, y, 0)
    end if
end loop
