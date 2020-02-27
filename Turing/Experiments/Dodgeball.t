% Connor Cerisano
% 2016 - 11 - 18
% Dodgeball

%Variables
var x, y : array 1 .. 100 of int
var xp : int
xp := 150
var chars : array char of boolean
var top, bot, left, right : int
var score : int
score := 0
View.Set ("nobuttonbar,offscreenonly,graphics:400,400,position:500,150")

for assign : 1 .. 100
    x (assign) := Rand.Int (0, maxx)
    y (assign) := maxy
end for

loop
    for random : 1 .. 5

	%Erase
	drawfilloval (x (random), y (random), 10, 10, 0)
	drawfilloval (xp, 10, 10, 10, 0)

	%Move
	y (random) := y (random) - Rand.Int (1, 10)

	Input.KeyDown (chars)
	if chars ('a') and xp > 0 then
	    xp := xp - 2
	elsif chars ('d') and xp < maxx then
	    xp := xp + 2
	end if

	%Draw
	drawfilloval (x (random), y (random), 10, 10, 12)
	drawfilloval (xp, 10, 10, 10, 13)

	%Extras
	View.Update

	if y (random) < 0 then
	    score := score + 1
	    drawfilloval (x (random), y (random), 10, 10, 0)
	    x (random) := Rand.Int (0, maxx)
	    y (random) := maxy
	end if

	top := whatdotcolor (xp + 11, 10)
	bot := whatdotcolor (xp - 11, 10)
	left := whatdotcolor (xp - 11, 10)
	right := whatdotcolor (xp + 11, 10)
    end for

    if top = 12 or bot = 12 or left = 12 or right = 12 then
	cls
	View.Update
	put "You lose!"
	exit
    end if

    if score > 30 then
	cls
	View.Update
	put "You win!"
	exit
    end if

    delay (25)
    cls
    View.Update
    put "Your Score Is:", " ", score
end loop
