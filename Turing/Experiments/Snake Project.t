% Connor Cerisano
% 2016-11-10
% Snake

View.Set ("offscreenonly,nobuttonbar,graphics:260,200,position:500,300")

%Declare My Variables
var top, bottom, left, right : int
var chars : array char of boolean
var key : array char of boolean % Keyboard Tracker
var detector : int := 0
var x : int := 100 % X Lock
var y : int := 100 % Y Lock
var v : int := 0 % Vertical Movement
var h : int := 0 % Horizontal Movement
var lives : int := 7

procedure game
    loop
	Input.KeyDown (key)
	if key ('w') then
	    v := 1
	    h := 0
	elsif key ('a') then
	    v := 0
	    h := -1
	elsif key ('s') then
	    v := -1
	    h := 0
	elsif key ('d') then
	    v := 0
	    h := 1
	end if

	%Collision Detection
	if h = 1 then
	    detector := whatdotcolor (x + 6, y)
	elsif h = -1 then
	    detector := whatdotcolor (x - 6, y)
	elsif v = 1 then
	    detector := whatdotcolor (x, y + 6)
	elsif v = -1 then
	    detector := whatdotcolor (x, y - 6)
	end if

	if detector = 7 then
	    lives := lives - 1
	    locate (1, 1)
	    cls
	    if lives = 0 then
		cls
		put ""
		put ""
		put ""
		put ""
		put "           Game Over!"
		exit
	    end if
	    loop
		Input.KeyDown (key)
		put ""
		put ""
		put ""
		put ""
		Text.Color (red)
		put "You died! You have ", lives, " lives left!"
		put "Use the WASD keys to restart!"
		View.Update
		delay (200)
		cls
		exit when key ('w') or key ('a') or key ('s') or key ('d')
	    end loop
	    x := 100
	    y := 100
	end if

	x += h
	y += v

	drawfilloval (x, y, 5, 5, 7)
	drawbox (0, 0, 259, 199, 7)

	%Extras
	delay (10)
	View.Update
    end loop
end game

loop
    x := 100
    y := 100
    v := 0
    h := 0
    View.Update
    cls
    game
    exit
end loop
