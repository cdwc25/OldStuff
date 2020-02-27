% Connor Cerisano
% 2016-10-31
% Task: Swimming Race

%Variables
var speed : array 1 .. 5 of int := init (10, 10, 10, 10, 10)
var reverse : array 1 .. 5 of int := init (0, 0, 0, 0, 0) %Put reverse in 0, we dont want the ovals to go backwards right away
var countryname : array 1 .. 5 of string := init ("Canada", "Germany", "USA", "Russia", "China")

% Output Window Commands
View.Set ("offscreenonly")
View.Set ("graphics:500,400,position:500,500")

% Make the Racers Move
loop
    drawfillbox (0, 0, 700, 400, 78) %Background Color
    drawfillbox (500, 20, 510, 380, 7) %Race Track
    drawfillbox (0, 340, 500, 360, 7) %Race Track
    drawfillbox (0, 270, 500, 290, 7) %Race Track
    drawfillbox (0, 190, 500, 210, 7) %Race Track
    drawfillbox (0, 110, 500, 130, 7) %Race Track
    drawfillbox (0, 40, 500, 60, 7) %Race Track

    drawfilloval (speed (1), 350, 10, 10, 12)
    drawfilloval (speed (2), 280, 10, 10, 14)
    drawfilloval (speed (3), 200, 10, 10, 0)
    drawfilloval (speed (4), 120, 10, 10, 11)
    drawfilloval (speed (5), 50, 10, 10, 67)


    for i : 1 .. 5
	if speed (i) > 490 then
	    reverse (i) := 1 %Activate reverse
	end if

	if reverse (i) = 0 then
	    speed (i) += Rand.Int (1, 5) %Make the ovals start off going forward
	else
	    speed (i) += Rand.Int (-5, -1) %Make the ovals reverse
	end if

	if speed (i) < 10 then %If the race is finished
	    Text.ColorBack (77)
	    put "Racer ", countryname (i), " has won!"
	    View.Update
	    delay (99999999)
	end if
    end for

    delay (10)
    View.Update

end loop

