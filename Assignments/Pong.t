%Group Members: Connor, Alex, Emily, Carson
%Group Project: Pong

%Custom Window Settings
View.Set ("offscreenonly,nobuttonbar,position:500,500")

%Declare Variables
var x, y : int %Ball
var top, bot, left, right : int %Hit Detection
var scoreL, scoreR : int := 0 %Score
var paddle1top, paddle1bot, paddle2top, paddle2bot : int %Paddles
var chars : array char of boolean %Keyboard Control
var xchange, ychange : int := 2 %Movement Changes

%Define Paddle Locations
paddle1top := round (maxy / 2 - 50)
paddle2top := round (maxy / 2 - 50)
paddle1bot := paddle1top
paddle2bot := paddle2top

%Define Location for Ball
x := round (maxx / 2)
y := round (maxy / 2)

loop
    %Draw Divider
    drawfillbox (300, 0, 310, maxy - 20, green)

    %Draw the Ball
    drawfilloval (x, y, 10, 10, red)

    %Draw Paddles
    drawfillbox (30, paddle1top, 40, paddle1bot, black) %Player 1
    drawfillbox (maxx - 30, paddle2top, maxx - 40, paddle2bot, black) %Player 2

    %Draw the Scores
    Text.Color (green)
    locate (1, 1)
    put "Player 1's Score: ", scoreL
    locate (1, 61)
    put "Player 2's Score: ", scoreR

    %Draw a Border
    drawbox (0, 0, maxx, maxy - 20, black)
    drawbox (1, 1, maxx - 1, maxy - 21, black)
    drawbox (2, 2, maxx - 2, maxy - 22, black)
    drawbox (3, 3, maxx - 3, maxy - 23, black)
    drawbox (4, 4, maxx - 4, maxy - 24, black)

    %Move the Ball
    x := x - xchange
    y := y + ychange

    %Player 1 Movement (W,S)
    Input.KeyDown (chars)
    if chars ('w') and paddle1bot < maxy - 24 then
	paddle1top := paddle1top + 2
    elsif chars ('s') and paddle1top > 0 then
	paddle1top := paddle1top - 2
    end if

    %Player 2 Movement (UP,DOWN)
    if chars (KEY_UP_ARROW) and paddle2bot < maxy - 24 then
	paddle2top := paddle2top + 2
    elsif chars (KEY_DOWN_ARROW) and paddle2top > 0 then
	paddle2top := paddle2top - 2
    end if

    %Re-define locations so hit detection can work on paddles
    paddle1bot := paddle1top + 50
    paddle2bot := paddle2top + 50

    %Hit Detection
    top := whatdotcolor (x, y + 11)
    bot := whatdotcolor (x, y - 11)
    left := whatdotcolor (x - 11, y)
    right := whatdotcolor (x + 11, y)

    if left = black then
	xchange := xchange * -1
	x := x + 1
    elsif right = black then
	xchange := xchange * -1
	x := x - 1
    elsif (top or bot) = black then
	ychange := ychange * -1
    end if

    %Score Tracker
    if x < 17 then
	scoreR := scoreR + 1
	delay (2000)
	%Reset Positions
	paddle1top := round (maxy / 2 - 50)
	paddle2top := round (maxy / 2 - 50)
	x := round (maxx / 2)
	y := round (maxy / 2)
    end if
    if x > maxx - 17 then
	scoreL := scoreL + 1
	delay (2000)
	%Reset Positions
	paddle1top := round (maxy / 2 - 50)
	paddle2top := round (maxy / 2 - 50)
	x := round (maxx / 2)
	y := round (maxy / 2)
    end if

    %Win Screens
    if scoreL = 5 then
	cls
	put "                               Player 1 Wins!"
	exit
    elsif scoreR = 5 then
	cls
	put "                               Player 2 Wins!"
	exit
    end if

    %Extras
    delay (5)
    View.Update
    cls
end loop

