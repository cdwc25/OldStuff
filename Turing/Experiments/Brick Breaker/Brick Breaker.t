% Connor Cerisano
% Started on 2016-12-15
% Brick Breaker Major Project

import GUI %Import Graphical User Interface

%Declare Variables
var x, y : int %Ball
var top, bot, left, right : int %Hit Detection
var score : int := 0 %Score
var paddle1top, paddle1bot : int %Player
var chars : array char of boolean %Keyboard Control
var xchange, ychange : int := 1 %Movement Changes
var font : int := Font.New ("serif:42") %Font for Menu Screen
var font2 : int := Font.New ("serif:12") %Font for other text
var space : int := Pic.FileNew ("space.jpg") %Space Background
var bricks : array 1 .. 20 of int %Array for bricks

procedure start
    %Custom Window Settings
    View.Set ("graphics:600,400,offscreenonly,nobuttonbar,position:400,200")

    %Define Player Location
    paddle1top := round (maxx / 2 - 50)
    paddle1bot := paddle1top

    %Define Location for Ball
    x := round (maxx / 2)
    y := round (maxy / 2)

    loop
	%Draw the Ball
	drawfilloval (x, y, 10, 10, 4)

	%Draw Paddles
	drawfillbox (paddle1top, 10, paddle1bot, 20, black) %Player

	%Draw the Scores
	Text.Color (green)
	locate (1, 1)
	put "Player's Score: ", score
	
	%Draw a Border
	drawbox (0, 0, maxx, maxy - 20, black)
	drawbox (1, 1, maxx - 1, maxy - 21, black)
	drawfillbox (0, 0, maxx, 10, 0)
	
	%Draw the Bricks
	for i : 1 .. 20
	    bricks (i) := -30
	    drawfillbox (bricks (i) + 30 * i, maxy - 100, bricks (i) + 30 * (i + 1), maxy - 110, 2)
	    drawbox (bricks (i) + 30 * i, maxy - 100, bricks (i) + 30 * (i + 1), maxy - 110, white)
	end for

	%Move the Ball
	x := x - xchange
	y := y + ychange

	%Player Movement (W,S)
	Input.KeyDown (chars)
	if chars ('d') and paddle1bot < maxx then
	    paddle1top := paddle1top + 1
	elsif chars ('a') and paddle1top > 0 then
	    paddle1top := paddle1top - 1
	end if

	%Re-define locations so hit detection can work on paddle
	paddle1bot := paddle1top + 50

	%Hit Detection
	top := whatdotcolor (x, y + 11)
	bot := whatdotcolor (x, y - 11)
	left := whatdotcolor (x - 11, y)
	right := whatdotcolor (x + 11, y)

	if left = (black or 2) then
	    xchange := xchange * -1
	    x := x + 1
	elsif right = (black or 2) then
	    xchange := xchange * -1
	    x := x - 1
	elsif (top or bot) = (black or 2) then
	    ychange := ychange * -1
	end if

	%Death Screen
	if y < 0 then
	    cls
	    Text.LocateXY (round (maxx / 2 - 40), round (maxy / 2))
	    Font.Draw ("You died!", round (maxx / 2 - 100), round (maxy / 2), font, black)
	    Font.Draw ("(Good luck next time!)", round (maxx / 2 - 54), round (maxy / 2 - 25), font2, black)
	    View.Update
	    exit
	end if

	%Extras
	delay (5)
	View.Update
	cls
    end loop
end start

procedure instructions
    View.Set ("graphics:600,450,nobuttonbar,position:400,300") %Custom Window
    space := Pic.Blur (space, 10) %Blur image for better view
    Pic.Draw (space, 0, 0, picUnderMerge)

    Font.Draw ("Instructions", round (maxx / 2 - 129), round (maxy / 2 - 60), font, white) %Title
    Font.Draw ("You are an advanced alien civilization that has to defend his planet", round (maxx / 2 - 200), round (maxy / 2 - 90), font2, white)
    Font.Draw ("from huge bricks that are falling onto it!", round (maxx / 2 - 200), round (maxy / 2 - 110), font2, white)
    Font.Draw ("Press A and D to move the paddle. Your objective is to destory all the bricks!", round (maxx / 2 - 220), round (maxy / 2 - 150), font2, white)
    Font.Draw ("Use the ball and hit it off the paddle to destroy them. But remember one thing.", round (maxx / 2 - 220), round (maxy / 2 - 170), font2, white)
    Font.Draw ("If the ball misses the paddle, it will fall onto our planet, and we will all be doomed!", round (maxx / 2 - 225), round (maxy / 2 - 190), font2, white)
    Font.Draw ("To assist you in your mission, remember to collect the powerups!", round (maxx / 2 - 190), round (maxy / 2 - 210), font2, white)
    Font.Draw ("Brick Breaker", round (maxx / 2 - 155), round (maxy - 60), font, white)

    %Re-draw Menu (I couldnt make a back button)
    var button1 := GUI.CreateButton (round (maxx / 2 - 90), round (maxy - 120), 190, "Start Game", start) %Start Button
    var button2 := GUI.CreateButton (round (maxx / 2 - 90), round (maxy - 160), 190, "Instructions", instructions) %Instruction Button
    %load GUI,wait for user action
    loop
	exit when GUI.ProcessEvent
    end loop
end instructions

procedure menu
    View.Set ("graphics:600,200,nobuttonbar,position:400,300") %Custom Window
    space := Pic.Blur (space, 10) %Blur image for better view
    Pic.Draw (space, 0, 0, picUnderMerge)
    Font.Draw ("Brick Breaker", round (maxx / 2 - 155), round (maxy - 60), font, 0) %Title
    var button1 := GUI.CreateButton (round (maxx / 2 - 90), round (maxy - 120), 190, "Start Game", start) %Start Button
    var button2 := GUI.CreateButton (round (maxx / 2 - 90), round (maxy - 160), 190, "Instructions", instructions) %Instruction Button
    View.Update
    %load GUI,wait for user action
    loop
	exit when GUI.ProcessEvent
    end loop
end menu

menu
