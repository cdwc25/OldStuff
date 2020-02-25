%Connor Cerisano    %2016-11-17  %Spamming Objects with Arrays
var x, y, x2, y2, rcolor : array 1 .. 500 of int
var rshape : array 1 .. 500 of int

loop
    for spam : 1 .. 500

	%Assign variables to a random integer
	rshape (spam) := Rand.Int (0, 4)
	x (spam) := Rand.Int (0, maxx)
	y (spam) := Rand.Int (0, maxy)
	rcolor (spam) := Rand.Int (1, 255)
	
	%Draw the Shapes
	if rshape (spam) = 1 then
	    drawfillbox (x (spam), y (spam), x (spam) + 10, y (spam) + 10, rcolor (spam))
	elsif rshape (spam) = 2 then
	    drawfillstar (x (spam), y (spam), x (spam) + 10, y (spam) + 10, rcolor (spam))
	elsif rshape (spam) = 3 then
	    drawfilloval (x (spam), y (spam), 5, 5, Rand.Int (1, 255))
	elsif rshape (spam) = 4 then
	    drawfillmapleleaf (x (spam), y (spam), x (spam) + 10, y (spam) + 10, rcolor (spam))
	end if

	%Extras
	delay (10)

    end for
end loop
