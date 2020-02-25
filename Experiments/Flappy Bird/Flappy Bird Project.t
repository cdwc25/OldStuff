% GRAVITY program

%variables for ball
%notice how they are reals (for decimal values)

View.Set ("offscreenonly,nobuttonbar,graphics:500,450")

var x, y, speed, gravity : real
var chars : array char of boolean   % variable for keyboard control
var pipex, pipey : int := 0
var top, left, right, bottom : int
var score : int := 0
var random : int := Rand.Int (0,300)
var random2 : int := Rand.Int (maxy - 300,maxy)

var stage : int := Pic.FileNew ("stage.bmp")
var pipe : int := Pic.FileNew ("pipe.bmp")
var bird : int := Pic.FileNew ("bird.bmp")

%initial values
x := maxx / 2         %in middle
y := 300             %bottom
speed := 4          %not moving
gravity := 0.1     %gravity force - what happens when changed?

loop
    %Draw Stage
    Pic.Draw (stage, 0, 0, picCopy)

    %Draw Pipe Hitbox
    drawfillbox (pipex + 9, random, pipex + 90, 0, 2)
    drawfillbox (pipex + 9, random2, pipex + 90, maxy, 2)

    %move
    y := y + speed
    pipex := pipex + 2

    %change speed
    speed := speed - gravity

    %draw (notice round() to convert reals to ints
    Pic.Draw (bird, round (x), round (y), picMerge)

    %keyboard control
    Input.KeyDown (chars)

    %shoot ball into the air
    if chars (KEY_UP_ARROW) then
	speed := 3
    end if

    if pipex > maxx then
	score := score + 1
	pipex := 0
	random := Rand.Int (0,300)
	random2 := Rand.Int (maxy - 300,maxy)
    end if

    top := whatdotcolor (round (x), round (y + 21))
    bottom := whatdotcolor (round (x), round (y - 1))
    left := whatdotcolor (round (x - 1), round (y))
    right := whatdotcolor (round (x + 21), round (y))

    if (top or bottom or left or right) = 2 or y <= 10 then
	cls
	put "You lose!", " Your score was: ", score
	exit
    end if

    delay (10)
    View.Update
end loop
