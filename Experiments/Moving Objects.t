%Custom Window Size
setscreen ("graphics:600;600")

%Variables
var x, y, x2, y2, x3, y3, x4, x5, x6, y4, y5, y6 : int := 300
var yA, xA, y2A, x2A, y3A, x3A, x4A, y4A, x5A, y5A, x6A, y6A : int := 300

%Statements for xA and yA
xA := Rand.Int (-10, 10)
yA := Rand.Int (-10, 10)
x2A := Rand.Int (-10, 10)
y2A := Rand.Int (-10, 10)
x3A := Rand.Int (-10, 10)
y3A := Rand.Int (-10, 10)
y3A := Rand.Int (-10, 10)
x3A := Rand.Int (-10, 10)
y4A := Rand.Int (-10, 10)
x4A := Rand.Int (-10, 10)
y5A := Rand.Int (-10, 10)
x5A := Rand.Int (-10, 10)
y6A := Rand.Int (-10, 10)
x6A := Rand.Int (-10, 10)

%Reverse Constant
const rev : int := -1

%Make The Object Reversable
loop
    if x + 50 > 600 then
	xA := Rand.Int (1, 2) * rev
    end if
    if y + 50 > 600 then
	yA := Rand.Int (1, 2) * rev
    end if
    if x - 50 < 0 then
	xA := Rand.Int (-2, -1) * rev
    end if
    if y - 50 < 0 then
	yA := Rand.Int (-2, -1) * rev
    end if

    if x2 + 50 > 600 then
	x2A := Rand.Int (1, 2) * rev
    end if
    if y2 + 50 > 600 then
	y2A := Rand.Int (1, 2) * rev
    end if
    if x2 - 50 < 0 then
	x2A := Rand.Int (-2, -1) * rev
    end if
    if y2 - 50 < 0 then
	y2A := Rand.Int (-2, -1) * rev
    end if

    if x3 + 50 > 600 then
	x3A := Rand.Int (1, 2) * rev
    end if
    if y3 + 50 > 600 then
	y3A := Rand.Int (1, 2) * rev
    end if
    if x3 - 50 < 0 then
	x3A := Rand.Int (-2, -1) * rev
    end if
    if y3 - 50 < 0 then
	y3A := Rand.Int (-2, -1) * rev
    end if

    if x4 + 50 > 600 then
	x4A := Rand.Int (1, 2) * rev
    end if
    if y4 + 50 > 600 then
	y4A := Rand.Int (1, 2) * rev
    end if
    if x4 - 50 < 0 then
	x4A := Rand.Int (-2, -1) * rev
    end if
    if y4 - 50 < 0 then
	y4A := Rand.Int (-2, -1) * rev
    end if

    if x5 + 50 > 600 then
	x5A := Rand.Int (1, 2) * rev
    end if
    if y5 + 50 > 600 then
	y5A := Rand.Int (1, 2) * rev
    end if
    if x5 - 50 < 0 then
	x5A := Rand.Int (-2, -1) * rev
    end if
    if y5 - 50 < 0 then
	y5A := Rand.Int (-2, -1) * rev
    end if

    if x6 + 50 > 600 then
	x6A := Rand.Int (1, 2) * rev
    end if
    if y6 + 50 > 600 then
	y6A := Rand.Int (1, 2) * rev
    end if
    if x6 - 50 < 0 then
	x6A := Rand.Int (-2, -1) * rev
    end if
    if y6 - 50 < 0 then
	y6A := Rand.Int (-2, -1) * rev
    end if
    
    drawfilloval (x, y, 40, 40, 10)
    drawfilloval (x2, y2, 40, 40, 11)
    drawfilloval (x3, y3, 40, 40, 35)
    drawfilloval (x4, y4, 40, 40, 12)
    drawfilloval (x5, y5, 40, 40, 14)
    drawfilloval (x6, y6, 40, 40, 43)
    delay (10)
    cls
  
      
    x2 := x2 + x2A
    y2 := y2 + y2A
    x := x + xA
    y := y + yA
    x3 := x3 + x3A
    y2 := y2 + y3A
    x3 := x3 + x3A
    y3 := y3 + y3A
    x4 := x4 + x4A
    y4 := y4 + y4A
    x5 := x5 + x5A
    y5 := y5 + y5A
    x6 := x6 + x6A
    y6 := y6 + y6A

end loop
