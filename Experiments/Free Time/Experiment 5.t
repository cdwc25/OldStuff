%Experiment 5
%Description: Random Texture Creator (That must fill the whole screen, and ends after 1 second)

var picID : int
var x, y : int
var check : int
var timerunning : int

procedure run
    Draw.FillBox (1, 1, Rand.Int (0, maxx), Rand.Int (0, maxy), Rand.Int (1, 255))
    Draw.FillStar (1, 1, Rand.Int (0, maxx), Rand.Int (0, maxy), Rand.Int (1, 255))
    Draw.FillOval (1, 1, Rand.Int (0, maxx), Rand.Int (0, maxy), Rand.Int (1, 255))
    Draw.FillMapleLeaf (1, 1, Rand.Int (0, maxx), Rand.Int (0, maxy), Rand.Int (1, 255))
    drawbox (1, 1, Rand.Int (0, maxx), Rand.Int (0, maxy), Rand.Int (1, 255))
    drawoval (1, 1, Rand.Int (0, maxx), Rand.Int (0, maxy), Rand.Int (1, 255))
    drawline (1, 1, Rand.Int (0, maxx), Rand.Int (0, maxy), Rand.Int (1, 255))
    drawstar (1, 1, Rand.Int (0, maxx), Rand.Int (0, maxy), Rand.Int (1, 255))
    drawmapleleaf (1, 1, Rand.Int (0, maxx), Rand.Int (0, maxy), Rand.Int (1, 255))
    picID := Pic.New (0, 0, maxx, maxy)
    for i : 1 .. 1000
	x := Rand.Int (0, maxx) % Random X
	y := Rand.Int (0, maxy) % Random Y
	Pic.Draw (picID, x, y, picCopy)
    end for
    Pic.Free (picID)
end run

loop
    clock (timerunning)
    check := whatdotcolor (Rand.Int (0, maxx), Rand.Int (0, maxy))
    if check = 0 then
	run
    end if
    if timerunning = 1000 then
	put "testing" 
    end if
    if timerunning > 1000 then
	exit
    end if
end loop
