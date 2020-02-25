% Connor Cerisano
% 2016-11-02
% Maze Assignment

%Declare My Variables
var x, y : int %Location for player
var o1, o2, o3, o4 : int %Locations for red obstacles
var top, bottom, left, right : int %Hit detection for player
var chars : array char of boolean

var maze, maze2 : int %Make pictures for the 2 mazes
maze := Pic.FileNew ("maze.jpg")
maze2 := Pic.FileNew ("maze2.jpg")

var gotKey, got2Key : boolean %True or false setup for keys
gotKey := false
got2Key := false

%Introduction
View.Set ("offscreenonly,graphics:600,220,position:400,300,nobuttonbar,title: Maze (By Connor)")

loop
    var font : int := Font.New ("impact:18")
    var font2 : int := Font.New ("serif:14")
    drawbox (1, 1, 599, 219, black)
    Font.Draw ("Welcome to Connor's Maze Game!", 140, 150, font, black)
    Font.Draw ("Press Space To Start!", 200, 100, font, black)
    Font.Draw ("(Press ESC at any time to reset your level.)", 145, 50, font2, black)
    Font.Free (font)
    Font.Free (font2)
    View.Update
    cls
    Input.KeyDown (chars)
    if chars (' ') then
	exit
    end if
    if chars (KEY_ESC) then
	View.Update
	cls
	put "You cant reset the introduction screen..."
	View.Update
	delay (3000)
    end if
end loop

% Start First Maze
procedure mazelevel1
    % Change player start location
    x := 200
    y := 5

    % Change Run Window
    View.Set ("offscreenonly,graphics:402,405,position:500,500,nobuttonbar,title: Maze (By Connor)")

    % Obstacle Variables
    o1 := Rand.Int (0, maxx)
    o3 := Rand.Int (0, maxx)
    o4 := Rand.Int (0, maxy)
    o2 := Rand.Int (0, maxy)

    loop
	Input.KeyDown (chars) %User keyboard functionality
	Pic.Draw (maze2, 0, 0, picUnderMerge) %Draw the second maze
	drawfilloval (o1, o2, 10, 10, 12) %Draw the obstacle
	drawfilloval (o3, o4, 10, 10, 12) %Draw second obstacle
	drawfilloval (x, y, 4, 4, 0) %Erase

	% Check if the player has gotten the key
	if got2Key = false then
	    drawfillbox (180, 400, 220, 405, 7) %Block the Gate
	    drawfilloval (120, 200, 5, 5, 2) %Draw Key
	end if

	% If player decides to reset, let them press ESC
	if chars (KEY_ESC) then
	    got2Key := false
	    o1 := Rand.Int (0, maxx)
	    o3 := Rand.Int (0, maxx)
	    o4 := Rand.Int (0, maxy)
	    o2 := Rand.Int (0, maxy)
	    x := 200
	    y := 5
	    Text.Color (white)
	    Text.ColorBack (black)
	    put "You have reset the level."
	    Text.ColorBack (white)
	    Text.Color (black)
	    View.Update
	    delay (1000)
	    mazelevel1
	end if

	%Move
	if chars ('w') or y <= 0 then
	    y := y + 1
	end if

	if chars ('a') or x > maxx then
	    x := x - 1
	end if

	if chars ('s') or y > maxy then
	    y := y - 1
	end if

	if chars ('d') or x <= 0 then
	    x := x + 1
	end if

	drawfilloval (x, y, 4, 4, 53) %Draw Player

	%Collision Detection
	right := whatdotcolor (x + 5, y)
	left := whatdotcolor (x - 5, y)
	top := whatdotcolor (x, y + 5)
	bottom := whatdotcolor (x, y - 5)

	if right = 7 then
	    x := x - 3
	end if

	if top = 7 then
	    y := y - 3
	end if

	if left = 7 then
	    x := x + 3
	end if

	if bottom = 7 then
	    y := y + 3
	end if

	% If the player has gotten the key, change the variable.
	if (top or bottom or left or right) = 2 then
	    got2Key := true
	end if

	% If the player has touched an obstacle, exit loop and procedure.
	if (top or bottom or left or right) = 12 then
	    got2Key := false
	    cls
	    exit
	end if

	%Extras
	delay (6)
	View.Update
	cls
	if y = maxy then
	    exit
	end if
    end loop
end mazelevel1

% Start Second Maze
procedure mazelevel2

    % Custom Run Window
    View.Set ("offscreenonly,graphics:533,545,position:500,500,nobuttonbar,title: Maze (By Connor)")

    % Obstacle Variables
    o1 := Rand.Int (0, maxx)
    o3 := Rand.Int (0, maxx)
    o4 := Rand.Int (0, maxy)
    o2 := Rand.Int (0, maxy)

    %Start the user
    x := 10
    y := 53

    loop
	Input.KeyDown (chars) %User keyboard functionality
	Pic.Draw (maze, -65, -40, picMerge) %Draw the maze
	drawfilloval (o1, o2, 10, 10, 12) %Draw the obstacle
	drawfilloval (o3, o4, 10, 10, 12) %Draw second obstacle

	% Check if the player has gotten the key
	if gotKey = false then
	    drawfillbox (512, 13, 528, 33, 7) %Block the Gate
	    drawfillbox (300, 495, 320, 507, 2) %Draw Key
	end if

	%If user has decided to reset the level, let them press ESC
	if chars (KEY_ESC) then
	    gotKey := false
	    o1 := Rand.Int (0, maxx)
	    o3 := Rand.Int (0, maxx)
	    o4 := Rand.Int (0, maxy)
	    o2 := Rand.Int (0, maxy)
	    x := 10
	    y := 53
	    Text.Color (white)
	    Text.ColorBack (black)
	    put "You have reset the level."
	    Text.ColorBack (white)
	    Text.Color (black)
	    View.Update
	    delay (1000)
	    mazelevel2
	end if

	%Move
	if chars ('w') or y <= 0 then
	    y := y + 1
	end if

	if chars ('a') or x > maxx then
	    x := x - 1
	end if

	if chars ('s') or y > maxy then
	    y := y - 1
	end if

	if chars ('d') or x <= 0 then
	    x := x + 1
	end if

	drawfilloval (x, y, 5, 5, 53) %Draw Player

	%Collision Detection
	right := whatdotcolor (x + 6, y)
	left := whatdotcolor (x - 6, y)
	top := whatdotcolor (x, y + 6)
	bottom := whatdotcolor (x, y - 6)

	if right = 7 then
	    x := x - 1
	end if

	if top = 7 then
	    y := y - 1
	end if

	if left = 7 then
	    x := x + 1
	end if

	if bottom = 7 then
	    y := y + 1
	end if

	% If the player has gotten the key, change the variable.
	if (top or bottom or left or right) = 2 then
	    gotKey := true
	end if

	% If the player has touched an obstacle, exit loop and procedure.
	if (top or bottom or left or right) = 12 then
	    got2Key := false
	    cls
	    exit
	end if

	%Extras
	delay (10)
	View.Update
	cls
	if x = maxx - 1 then
	    exit
	end if
    end loop
end mazelevel2

loop % Maze 1
    mazelevel1 %Start Maze 1
    % If the player has touched an obstacle, exit loop and procedure.
    if (top or bottom or left or right) = 12 then
	got2Key := false
	var font : int := Font.New ("impact:18")
	View.Set ("offscreenonly,graphics:600,220,position:400,300,nobuttonbar,title: Maze (By Connor)")
	Font.Draw ("You have died! Try again!", 190, 110, font, red)
	Font.Free (font)
	View.Update
	delay (2000)
	View.Set ("offscreenonly,graphics:402,405,position:500,500,nobuttonbar,title: Maze (By Connor)")
    else
	var font : int := Font.New ("impact:18")
	View.Set ("offscreenonly,graphics:600,220,position:400,300,nobuttonbar,title: Maze (By Connor)")
	Font.Draw ("You won! Time for the next level.", 150, 110, font, green)
	Font.Free (font)
	View.Update
	delay (2000)
	View.Set ("offscreenonly,graphics:533,545,position:500,500,nobuttonbar,title: Maze (By Connor)")
	exit
    end if
end loop

loop % Maze 2
    mazelevel2 % Start Maze 2
    if (top or bottom or left or right) = 12 then
	gotKey := false
	% You
	var font : int := Font.New ("impact:18")
	View.Set ("offscreenonly,graphics:600,220,position:400,300,nobuttonbar,title: Maze (By Connor)")
	Font.Draw ("You have died! Try again!", 190, 110, font, red)
	Font.Free (font)
	View.Update
	delay (2000)
	View.Set ("offscreenonly,graphics:533,545,position:500,500,nobuttonbar,title: Maze (By Connor)")
    else
	View.Set ("offscreenonly,graphics:600,220,position:400,300,nobuttonbar,title: Maze (By Connor)")
	var font : int := Font.New ("impact:18")
	drawbox (1, 1, 599, 219, black)
	Font.Draw ("Thanks for playing!", 210, 110, font, green)
	View.Update
	delay (2000)
	Font.Free (font)
	exit
    end if
end loop
