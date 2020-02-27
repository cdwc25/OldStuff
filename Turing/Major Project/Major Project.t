% Connor Cerisano
% Started On 2016-12-16
% Finished On 2017-01-02
% Flappy Bird (Major Project Game)

%Import GUI
import GUI

%-----Variables-----%
var x, y, speed, gravity : real %Bird Location Control
var chars : array char of boolean %User Control
var random1 : array 1 .. 30 of int %Random Pipe Location Storage
var active : int %Array Switcher
var px : int := maxx + 100 %X location for Pipes
var top, left, right, bottom : int %Locations for hit detection
var score : int := 0 %Score Tracker
var picx : int := 1 %Picture Location Controller
var flap : boolean %Cooldown on fly button

%Images
var stage : int := Pic.FileNew ("stage.bmp")
var bird : int := Pic.FileNew ("bird.bmp")
var p1 : int := Pic.FileNew ("pipe.bmp")
var m1 : int := Pic.FileNew ("medal1.bmp")
var m2 : int := Pic.FileNew ("medal2.bmp")

%Fonts/Text
var font : int := Font.New ("serif:42:underline") %Font For Menu Screen
var font2 : int := Font.New ("serif:12") %Font For Other Text
var font3 : int := Font.New ("system:36") %Font For Score

%Menu Music
Music.PlayFileReturn ("Pixelland.mp3") %Score Sound Effect

procedure main
    %-----Pre-Game Setup-----%
    View.Set ("offscreenonly,nobuttonbar,graphics:500,450,position:450,100") %Custom Window
    var stage2 : int := Pic.FileNew ("stage.bmp") %Re-draw background so it isnt blurry

    %Initial Values
    x := 50
    y := 300
    speed := 4
    gravity := 0.1
    active := 1

    for assign : 1 .. 30
	random1 (assign) := Rand.Int (-200, -80) %Assign random array values for the pipe locations
    end for

    %-----Main Loop-----%
    loop
	%Move Background
	picx := picx - 1
	if picx <= -300 then
	    picx := maxx
	end if

	%Draw Stage
	Pic.Draw (stage2, picx, 0, picCopy)
	Pic.Draw (stage2, picx - 800, 0, picCopy)

	%Draw Pipe Sprites (Color: 128 in paint)
	Pic.Draw (p1, px, random1 (active), picMerge)
	Pic.Draw (p1, px, 450 + random1 (active), picMerge)

	%Move
	y := y + speed
	px := px - 5

	%Change Speed
	speed := speed - gravity

	%Draw The Player
	Pic.Draw (bird, round (x), round (y), picMerge)

	%Display The Score
	Font.Draw ("" + intstr (score), round (maxx / 2 - 18), round (maxy - 60), font3, white) %Title

	%Keyboard Control
	Input.KeyDown (chars)
	if (chars (KEY_UP_ARROW) or chars ('w')) and flap = true then
	    speed := 4 %Jump
	    flap := false
	elsif (chars (KEY_UP_ARROW) or chars ('w')) and flap = false then %Make it so you cant hold the button down
	    flap := false
	else
	    flap := true
	end if

	%Reset The Pipe
	if px < -100 then
	    score := score + 1 %If the pipes have passed the screen, get 1 score
	    Music.PlayFileReturn ("point.mp3") %Score Sound Effect
	    px := maxx + 100 %Reset the pipes x coordinate
	    active += 1 %Randomize the pipe's height.
	    if active = 30 then %If the user has dodged 30 pipes, reset/re-assign the random locations.
		active := 1
		for i : 1 .. 30
		    random1 (i) := Rand.Int (-200, -80)
		end for
	    end if
	end if

	%-----Hit Detection-----%
	bottom := whatdotcolor (round (x + 25), round (y))
	left := whatdotcolor (round (x + 5), round (y + 25))
	right := whatdotcolor (round (x + 40), round (y + 25))
	top := whatdotcolor (round (x + 25), round (y + 45))

	if top = (120) or bottom = (120) or left = (120) or right = (120) or y <= 10 or y >= maxy then %Detect colors
	    Music.PlayFileReturn ("death.mp3") %Death Sound Effect
	    cls
	    Pic.Draw (stage, 0, 0, picUnderMerge) %Background

	    %Draw Medals
	    if score >= 10 then
		Pic.Draw (m1, round (maxx / 2 - 36), round (maxy - 137), picMerge) %Medal
		Pic.Draw (m1, round (maxx / 2 - 36), round (maxy - 384), picMerge) %Medal
	    end if
	    if score >= 20 then
		Pic.Draw (m2, round (maxx / 2 - 36), round (maxy - 137), picMerge) %Medal 2
		Pic.Draw (m2, round (maxx / 2 - 36), round (maxy - 384), picMerge) %Medal 2
	    end if

	    drawbox (370, 310, maxx - 360, maxy - 310, black)
	    Font.Draw ("You died!", round (maxx / 2 - 107), round (maxy / 2 + 20), font, red) %Title
	    Font.Draw ("Your score was: " + intstr (score), round (maxx / 2 - 55), round (maxy / 2 - 20), font2, red) %Score Display
	    var button1 := GUI.CreateButton (round (maxx / 2 - 90), round (maxy / 2 - 60), 190, "Restart?", main) %Start Button
	    GUI.SetColor (button1, brightred) %Button Color

	    %Reset Values
	    x := 50
	    y := 300
	    speed := 4
	    gravity := 0.1
	    active := 1
	    px := maxx + 100
	    score := 0

	    %Extras
	    View.Update
	    loop
		exit when GUI.ProcessEvent
	    end loop
	end if

	%Update The Screen
	View.Update
	delay (10)
    end loop
end main

procedure instructions
    View.Set ("graphics:600,360,nobuttonbar,position:400,200") %Custom Window
    stage := Pic.Blur (stage, 10) %Blur image for better view
    Pic.Draw (stage, 0, 0, picUnderMerge) %Background

    Font.Draw ("Instructions", round (maxx / 2 - 129), round (maxy / 2 - 60), font, 119) %Title
    Font.Draw ("You are a bird that has to fly through the city! But watch out, the plumbing of the city has", round (maxx / 2 - 266), round (maxy / 2 - 90), font2, 192)
    Font.Draw ("failed! There are now broken pipes everywhere. Press the up arrow key or W", round (maxx / 2 - 237), round (maxy / 2 - 110), font2, 192)
    Font.Draw ("to fly and dodge all those pesky pipes in the way! Good luck on your journey!", round (maxx / 2 - 237), round (maxy / 2 - 130), font2, 192)

    drawbox (15, 230, maxx - 15, maxy - 15, black) %Border 1
    drawbox (maxx - 15, 170, 15, 15, black) %Border 1

    %Re-draw Menu (Back buttons don't work for procedures)
    Font.Draw ("Flappy Bird", round (maxx / 2 - 128), round (maxy - 60), font, 121)
    var buttoni := GUI.CreateButton (round (maxx / 2 - 90), round (maxy - 120), 190, "Start Game", main) %Start Button
    GUI.SetColor (buttoni, 68) %Make button1 yellow

    %Extras
    View.Update
    loop
	exit when GUI.ProcessEvent
    end loop
end instructions

procedure menu
    View.Set ("graphics:600,200,nobuttonbar,position:400,300") %Custom Window
    stage := Pic.Blur (stage, 10) %Blur image for better view
    Pic.Draw (stage, 0, 0, picUnderMerge) %Background
    Font.Draw ("Flappy Bird", round (maxx / 2 - 128), round (maxy - 60), font, 121) %Title

    var button1 := GUI.CreateButton (round (maxx / 2 - 90), round (maxy - 120), 190, "Start Game", main) %Start Button
    var button2 := GUI.CreateButton (round (maxx / 2 - 90), round (maxy - 160), 190, "Instructions/How To Play", instructions) %Instruction Button
    GUI.SetColor (button1, yellow) %Make button1 yellow
    GUI.SetColor (button2, 72) %Make button2 the same color as the ground in the background

    %Extras
    View.Update
    loop
	exit when GUI.ProcessEvent
    end loop
end menu

menu %Start the program after declaring all the procedures

