% Connor Cerisano
% Started on 2016-11-23
% Frogger Project

%Custom Window Settings
View.Set ("graphics:460;435,position:500;100,nobuttonbar,offscreenonly")

%Declare my variables
var car : array 1 .. 5 of int
var xfrog, yfrog : int
var chars : array char of boolean
var top, left, right, bottom : int
var bluecar : int := Pic.FileNew ("bluecar.bmp")
var greencar : int := Pic.FileNew ("greencar.bmp")
var redcar : int := Pic.FileNew ("redcar.bmp")
var stage : int := Pic.FileNew ("stage.bmp")
var frog : int := Pic.FileNew ("frog.bmp")
var lives : int := 4

%Starting value for following variables
car (1) := 0
car (2) := 0
car (3) := 0
xfrog := 220
yfrog := 10

%Main Loop
loop
    %Movement
    Input.KeyDown (chars)
    if chars ('w') then
	yfrog := yfrog + 1
    elsif chars ('s') and yfrog > 0 then
	yfrog := yfrog - 1
    elsif chars ('a') and xfrog > 0 then
	xfrog := xfrog - 1
    elsif chars ('d') and xfrog < maxx then
	xfrog := xfrog + 1
    end if

    %Draw the Stage
    Pic.Draw (stage, 0, 0, picMerge)

    %Hitboxes
    drawfillbox (car (1), 130, car (1) + 50, 155, 12)
    drawfillbox (car (2), 75, car (2) + 50, 100, 12)
    drawfillbox (car (1), 266, car (1) + 50, 290, 12)
    drawfillbox (car (2), 195, car (2) + 50, 220, 12)
    drawfillbox (car (3), 333, car (3) + 50, 358, 12)

    %Detect Collision
    top := whatdotcolor (xfrog, yfrog + 7)
    left := whatdotcolor (xfrog - 7, yfrog)
    right := whatdotcolor (xfrog + 7, yfrog)
    bottom := whatdotcolor (xfrog, yfrog - 7)

    if (top or left or right or left) = 12 then
	cls
	Text.Color (red)
	put "          You Died!", " You have ", lives, " lives remaining!"
	Text.Color (black)
	lives := lives - 1
	xfrog := 230
	yfrog := 1
	View.Update
	delay (1000)
    end if

    %Draw Cars
    Pic.Draw (bluecar, car (1), 130, picCopy) % Draw the blue car
    Pic.Draw (redcar, car (2), 75, picCopy) % Draw the red car
    Pic.Draw (bluecar, car (1), 266, picCopy) % Draw the upper blue car
    Pic.Draw (redcar, car (2), 195, picCopy) % Draw the upper red car
    Pic.Draw (greencar, car (3), 333, picCopy) % Draw the upper green car
    Pic.Draw (frog, xfrog, yfrog, picMerge) % Draw Frog (Player)

    %Different Speeds of Cars
    car (1) := car (1) + 4
    car (2) := car (2) + 5
    car (3) := car (3) + 6

    %If a car has passed the screen, move it back to the start
    if car (1) > 600 then
	car (1) := -100
    elsif car (2) > 600 then
	car (2) := -100
    elsif car (3) > 600 then
	car (3) := -100
    end if

    %Exit when you run out of lives
    if lives = -1 then
	cls
	Text.Color (red)
	put "                       Game Over!"
	Text.Color (black)
	View.Update
	exit
    end if

    %Exit if user won
    if yfrog > maxy then
	cls
	Text.Color (green)
	put "                       You Win!"
	Text.Color (black)
	View.Update
	exit
    end if

    %Extras
    View.Update
    delay (16)

end loop
