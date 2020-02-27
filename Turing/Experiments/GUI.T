% Connor Cerisano
% Practice: GUI (buttons)
% 2016-12-05

import GUI
View.Set ("graphics:568,285,nobuttonbar,position:450,300")
var Value : int
var font1 := Font.New ("ariel:12")

Value := 10

procedure SliderMoved (value : int)
    Text.LocateXY (340, 270)
    Text.Color (white)
    Text.ColorBack (black)
    put "Slider Amount: ", value : 1
    Value := value - 1
end SliderMoved

procedure circle
    for i : 0 .. Value
	View.Update
	drawfilloval (Rand.Int (50, maxx), Rand.Int (35, maxy - 39), 5, 5, Rand.Int (0, 255))
    end for
end circle

procedure box
    for i : 0 .. Value
	View.Update
	var x : int := Rand.Int (50, maxx)
	var y : int := Rand.Int (30, maxy - 39)
	drawfillbox (x, y, x + 10, y + 10, Rand.Int (0, 255))
    end for
end box

procedure mapleleaf
    for i : 0 .. Value
	View.Update
	var x : int := Rand.Int (50, maxx)
	var y : int := Rand.Int (30, maxy - 44)
	drawfillmapleleaf (x, y, x + 10, y + 10, Rand.Int (0, 255))
    end for
end mapleleaf

procedure arc
    for i : 0 .. Value
	View.Update
	drawfillarc (Rand.Int (50, maxx), Rand.Int (35, maxy - 39), 5, 5, Rand.Int (0, 1000), Rand.Int (10, 1000), Rand.Int (0, 255))
    end for
end arc

procedure star
    for i : 0 .. Value
	View.Update
	var x : int := Rand.Int (50, maxx)
	var y : int := Rand.Int (30, maxy - 39)
	drawfillstar (x, y, x + 10, y + 10, Rand.Int (0, 255))
    end for
end star

procedure spam
    for i : 0 .. 9999
	drawdot (Rand.Int (50, maxx), Rand.Int (35, maxy - 30), Rand.Int (1, 255))
    end for
end spam

procedure polygon
    for i : 0 .. Value
	var x : array 1 .. 5 of int
	var y : array 1 .. 5 of int
	for n : 1 .. 5
	    x (n) := Rand.Int (50, maxx)
	    y (n) := Rand.Int (35, maxy - 39)
	end for
	drawfillpolygon (x, y, 5, Rand.Int (0, 255))
    end for
end polygon

procedure clear
    drawfillbox (45, 30, maxx, maxy - 28, 0)
end clear

var slider := GUI.CreateVerticalSlider (20, 50, 180, 1, 10000, 10, SliderMoved)
var button1 : int := GUI.CreateButton (140, 5, 30, "Create a Circle", circle)
var button2 : int := GUI.CreateButton (255, 5, 30, "Create a Box", box)
var button3 : int := GUI.CreateButton (0, 5, 30, "Create a Maple Leaf", mapleleaf)
var button4 : int := GUI.CreateButton (357, 5, 30, "Create an Arc", arc)
var button5 : int := GUI.CreateButton (465, 5, 30, "Create a Star", star)
var button6 : int := GUI.CreateButton (130, 260, 30, "Spam Dots", spam)
var button7 : int := GUI.CreateButton (0, 260, 30, "Clear Screen", clear)
var button8 : int := GUI.CreateButton (round (maxx / 2) - 30, 260, 30, "Polygon", polygon)
GUI.SetColor (button1, brightred)
GUI.SetColor (button2, 11)
GUI.SetColor (button3, brightgreen)
GUI.SetColor (button4, 58)
GUI.SetColor (button5, 43)
GUI.SetColor (button6, 14)
GUI.SetColor (button7, 58)
GUI.SetColor (button8, 31)
GUI.SetBackgroundColor (black)
drawfillbox (45, 30, maxx, maxy - 28, 0)

loop
    exit when GUI.ProcessEvent
end loop
