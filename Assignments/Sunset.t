% Connor Cerisano
% Sunset Scene Assignment
% 2016-09-29

% Sky
    drawfillbox (0,0,640,640,82)
    
% Sun
    drawfilloval (70,50,55,50,91)
       
% Trees
    drawfillbox (150,50,160,70,138)% Tree 1 Bark
    drawfilloval (155,70,10,10,120)% Lower Leaves for Tree 1
    drawfilloval (155,85,15,15,120)% Higher Leaves for Tree 1
	drawfillbox (500,50,510,70,138)% Tree 2 Bark
	drawfilloval (505,70,10,10,120)% Lower Leaves for Tree 2
	drawfilloval (505,85,15,15,120)% Higher Leaves for Tree 2
	    drawfillbox (50,50,60,70,138)% Tree 3 Bark
	    drawfilloval (55,70,10,10,120)% Lower Leaves for Tree 3
	    drawfilloval (55,85,15,15,120)% Higher leaves for Tree 3
		drawfillbox (600,50,610,70,138)% Tree 4 Bark
		drawfilloval (605,70,10,10,120) % Lower leaves for Tree 4
		drawfilloval (605,85,15,15,120) %Higher Leaves for Tree 4
    
% Moon
    drawfilloval (560,420,50,50,0)    

% Ground
    drawfillbox (0,0,648,50,190)
 
% Clouds
    drawfilloval (300,400,50,30,30)
    drawfilloval (250,390,50,30,30)
    drawfilloval (90,390,50,30,30)
    drawfilloval (60,385,50,30,30)
     
% Stars
    drawfillstar (50,200,60,210,90)
    drawfillstar (500,290,490,300,90)
    drawfillstar (600,100,610,110,90)
    drawfillstar (50,200,60,210,90)
    drawfillstar (150,310,160,320,90)
    drawfillstar (200,100,210,110,90)

% House
    drawfillbox (240,50,450,200,138)%Building
    drawfillbox (320,50,370,100,24)%Door
    drawfilloval (330,75,5,5,43)%Doorknob
	%Windows
	drawfillbox (270,120,330,150,0)%Window 1
	drawline (299,120,299,150,7)%Window 1 Pane
	drawfillbox (360,120,420,150,0)%Window 2
	drawline (390,120,390,150,7)%Window 2 Pane
	drawfilloval (345,178,20,20,0)%Attic Window
	drawline (345,158,345,200,7)%Attic Pane
	drawline (325,177,365,177,7)%Attic Pane 2
	%Roof
	drawline (240,200,345,300,7)% Left line
	drawline (345,300,450,200,7)% Right Line
	drawline (450,200,240,200,7)% Bottom line for the next command to work right
	drawfill (270,210,186,7)%Fill in the triangle with color
	%Pathway
	drawfillbox (320,0,370,50,174)
	drawline (320,49,370,49,7) 
	
% Pond
    drawfilloval (500,25,45,13,79)%Water
    drawfilloval (530,27,40,13,79)%Extra Water
    drawfillarc (480,25,7,4,75,345,193)%Lilypad 1
    drawfillarc (550,30,7,4,345,230,193)%Lilypad 2
    drawfillarc (514,25,7,4,120,0,193)%Lilypad 3

% Canadian Flag
    drawfillbox (190,20,195,90,0) %Flag Pole
    drawfillbox (195,60,220,90,40)%Left Red
    drawfillbox (245,60,220,90,0)%Middle White Background
    drawfillmapleleaf (220,60,246,90,40)%Maple Leaf
    drawfillbox (247,90,270,60,40)%Right Red
    drawfilloval (192,90,5,5,30)%Flag Pole Top
    


