% Connor Cerisano
% 2016-11-14
% For Loops Assignment

%Custom Window
View.Set ("graphics:420,290,nobuttonbar,position:500,200")

% Assign My Variables
var one, two, three, four, five, six : int := 0 %Counter for first dice
var one2, two2, three2, four2, five2, six2 : int := 0 %Counter for second dice
var snakeeyecounter : int := 0 %Counter for rolling 1 twice

%Roll the Dice 320 times
for x : 1 .. 320
    var random : int := Rand.Int (1, 6) %First Dice
    var random2 : int := Rand.Int (1, 6) %Second Dice
    var snk1, snk2 : boolean %True/False variable for tracking Snake Eyes

    if random = 1 then
	one += 1
    elsif random = 2 then
	two += 1
    elsif random = 3 then
	three += 1
    elsif random = 4 then
	four += 1
    elsif random = 5 then
	five += 1
    elsif random = 6 then
	six += 1
    end if

    if random = 1 then %If 1 was rolled twice, make the variable true. Else, make it false
	snk1 := true
    else
	snk1 := false
    end if

    if random2 = 1 then
	one2 += 1
    elsif random2 = 2 then
	two2 += 1
    elsif random2 = 3 then
	three2 += 1
    elsif random2 = 4 then
	four2 += 1
    elsif random2 = 5 then
	five2 += 1
    elsif random2 = 6 then
	six2 += 1
    end if

    if random2 = 1 then %If 1 was rolled twice, make the second variable true. Else, make it false
	snk2 := true
    else
	snk2 := false
    end if

    if snk1 = true and snk2 = true then %Add up all the times 1 was rolled twice
	snakeeyecounter += 1
    end if
end for

%Make the text Blue
Text.Color (blue)

%Dice Result Display and Calculate Percentage
put "Sum Of 2 Dice     ", "Times Rolled     ", "  Probability        "
put "      1                ", one, "             ", (one / 320) * 100, "%"
put "      2                ", two, "             ", (two / 320) * 100, "%"
put "      3                ", three, "             ", (three / 320) * 100, "%"
put "      4                ", four, "             ", (four / 320) * 100, "%"
put "      5                ", five, "             ", (five / 320) * 100, "%"
put "      6                ", six, "             ", (six / 320) * 100, "%"
put "      7                ", one2, "             ", (one2 / 320) * 100, "%"
put "      8                ", two2, "             ", (two2 / 320) * 100, "%"
put "      9                ", three2, "             ", (three2 / 320) * 100, "%"
put "      10               ", four2, "             ", (four2 / 320) * 100, "%"
put "      11               ", five2, "             ", (five2 / 320) * 100, "%"
put "      12               ", six2, "             ", (six2 / 320) * 100, "%"
put ""
put "       You have rolled Snake Eye's ", snakeeyecounter, " times!"
