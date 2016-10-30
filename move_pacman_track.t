/*--The--Info--*\
 Guzman Isaiah
 10/29/16
 Pacman Ghost Experiment

 If ball hits an intersection, then
 the ball changes direction
 \*--End--Info--*/

% User Change Module
const background : int := 53
const FPS : int := 128
const screen_width : string := "800"
const screen_height : string := "500"

% Setup
View.Set ("graphics:" + screen_width + ";" + screen_height + ", nobuttonbar, offscreenonly")
const swap : int := -1
Text.ColorBack (background)

% Variables
const mapN : int := 7 % Number of map coordinates
var xMap : array 1 .. mapN of int := init (50, 100, 100, 50, 50, 100, 150) % Set array for x values, locations
var yMap : array 1 .. mapN of int := init (50, 50, 100, 100, 150, 150, 150) % Set array for y values, locations

const ghostN : int := 3 % Number of ghosts
var x : array 1 .. ghostN of int := init (75, 100, 75) % Set array for x values, default locations
var y : array 1 .. ghostN of int := init (50, 75, 100) % Set array for y values, default locations
var xM : array 1 .. ghostN of int := init (1, 0, 1) % Set array for x speed, default locations
var yM : array 1 .. ghostN of int := init (0, -1, 0) % Set array for y speed, default speed

const randN : int := 3 % Number of ghosts
var R : array 1 .. randN of int % Set random value for junctions

% Funnctions

% Procedures
procedure switch (xA, yA : int, var x1 : array 1 .. * of int, var y1 : array 1 .. * of int, var x2 : array 1 .. * of int, var y2 : array 1 .. * of int, col : int, mode : int)
    case mode of
            % One End Junctions
        label 1 : % Dead End
            for i : 1 .. ghostN
                if x1 (i) = xA and y1 (i) = yA then
                    x2 (i) *= swap
                    y2 (i) *= swap
                end if
            end for

            % Two End Junctions
        label 2 : % Top Right Corner
            for i : 1 .. ghostN
                if x1 (i) = xA and y1 (i) = yA and x2 (i) = 0 and y2 (i) = 1 then
                    x2 (i) := -1
                    y2 (i) := 0
                elsif x1 (i) = xA and y1 (i) = yA and x2 (i) = 1 and y2 (i) = 0 then
                    x2 (i) := 0
                    y2 (i) := -1
                end if
            end for
        label 3 : % Top Left Corner
            for i : 1 .. ghostN
                if x1 (i) = xA and y1 (i) = yA and x2 (i) = 0 and y2 (i) = 1 then
                    x2 (i) := 1
                    y2 (i) := 0
                elsif x1 (i) = xA and y1 (i) = yA and x2 (i) = -1 and y2 (i) = 0 then
                    x2 (i) := 0
                    y2 (i) := -1
                end if
            end for
        label 4 : % Bottom Left Corner
            for i : 1 .. ghostN
                if x1 (i) = xA and y1 (i) = yA and x2 (i) = 0 and y2 (i) = -1 then
                    x2 (i) := -1
                    y2 (i) := 0
                elsif x1 (i) = xA and y1 (i) = yA and x2 (i) = 1 and y2 (i) = 0 then
                    x2 (i) := 0
                    y2 (i) := 1
                end if
            end for
        label 5 : % Bottom Right Corner
            for i : 1 .. ghostN
                if x1 (i) = xA and y1 (i) = yA and x2 (i) = 0 and y2 (i) = -1 then
                    x2 (i) := 1
                    y2 (i) := 0
                elsif x1 (i) = xA and y1 (i) = yA and x2 (i) = -1 and y2 (i) = 0 then
                    x2 (i) := 0
                    y2 (i) := 1
                end if
            end for

            % Three End Junctions
        label 6 : % wNe Junction
            for i : 1 .. ghostN
                if x1 (i) = xA and y1 (i) = yA then
                    R (i) := Rand.Int (1, 3)
                    case R (i) of
                        label 1 :
                            x2 (i) := 1
                            y2 (i) := 0
                        label 2 :
                            x2 (i) := -1
                            y2 (i) := 0
                        label 3 :
                            x2 (i) := 0
                            y2 (i) := 1
                    end case
                end if
            end for
        label 7 : % nEs Junction
            for i : 1 .. ghostN
                if x1 (i) = xA and y1 (i) = yA then
                    R (i) := Rand.Int (1, 3)
                    case R (i) of
                        label 1 :
                            x2 (i) := 0
                            y2 (i) := -1
                        label 2 :
                            x2 (i) := 0
                            y2 (i) := 1
                        label 3 :
                            x2 (i) := 1
                            y2 (i) := 0
                    end case
                end if
            end for
        label 8 : % eSw Junction
            for i : 1 .. ghostN
                if x1 (i) = xA and y1 (i) = yA and y2 (i) not = 0 then
                    R (i) := Rand.Int (1, 2)
                    case R (i) of
                        label 1 :
                            x2 (i) := 1
                            y2 (i) := 0
                        label 2 :
                            x2 (i) := -1
                            y2 (i) := 0
                    end case
                elsif x1 (i) = xA and y1 (i) = yA and x2 (i) = -1 then
                    R (i) := Rand.Int (1, 2)
                    case R (i) of
                        label 1 :
                            x2 (i) := -1
                            y2 (i) := 0
                        label 2 :
                            x2 (i) := 0
                            y2 (i) := -1
                    end case
                elsif x1 (i) = xA and y1 (i) = yA and x2 (i) = 1 then
                    R (i) := Rand.Int (1, 2)
                    case R (i) of
                        label 1 :
                            x2 (i) := 1
                            y2 (i) := 0
                        label 2 :
                            x2 (i) := 0
                            y2 (i) := -1
                    end case
                end if
            end for
        label 9 : % sWn Corner
            for i : 1 .. ghostN
                if x1 (i) = xA and y1 (i) = yA and x2 (i) not = 0 then
                    R (i) := Rand.Int (1, 2)
                    case R (i) of
                        label 1 :
                            x2 (i) := 0
                            y2 (i) := 1
                        label 2 :
                            x2 (i) := 0
                            y2 (i) := -1
                    end case
                elsif x1 (i) = xA and y1 (i) = yA and y2 (i) = -1 then
                    R (i) := Rand.Int (1, 2)
                    case R (i) of
                        label 1 :
                            x2 (i) := 0
                            y2 (i) := -1
                        label 2 :
                            x2 (i) := -1
                            y2 (i) := 0
                    end case
                elsif x1 (i) = xA and y1 (i) = yA and y2 (i) = 1 then
                    R (i) := Rand.Int (1, 2)
                    case R (i) of
                        label 1 :
                            x2 (i) := 0
                            y2 (i) := 1
                        label 2 :
                            x2 (i) := -1
                            y2 (i) := 0
                    end case
                end if
            end for
            % Four End Junctions
        label 50 : % Four Way
            for i : 1 .. ghostN
                if x1 (i) = xA and y1 (i) = yA then
                    R (i) := Rand.Int (1, 4)
                    case R (i) of
                        label 1 :
                            x2 (i) := 1
                            y2 (i) := 0
                        label 2 :
                            x2 (i) := -1
                            y2 (i) := 0
                        label 3 :
                            x2 (i) := 0
                            y2 (i) := 1
                        label 4 :
                            x2 (i) := 0
                            y2 (i) := -1
                    end case
                end if
            end for
    end case
    drawfilloval (xA, yA, 3, 3, col)
end switch

procedure map (var mX : array 1 .. * of int, var mY : array 1 .. * of int, col : int)
    for i : 1 .. (mapN)
        if i < mapN then
            drawline (mX (i), mY (i), mX (i + 1), mY (i + 1), col)
        end if
    end for

    % Connector Lines
    drawline (mX (6), mY (6), mX (3), mY (3), col)
    drawline (mX (2), mY (2), mX (2) + 50, mY (2), col)

    % Draw Alt Transition Points
    switch (xMap (2) + 50, yMap (2), x, y, xM, yM, 22, 1)

    % Draw Main Transition Points
    switch (xMap (1), yMap (1), x, y, xM, yM, 1, 1)
    switch (xMap (2), yMap (2), x, y, xM, yM, 7, 6)
    switch (xMap (3), yMap (3), x, y, xM, yM, 2, 9)
    switch (xMap (4), yMap (4), x, y, xM, yM, 1, 5)
    switch (xMap (5), yMap (5), x, y, xM, yM, 10, 3)
    switch (xMap (6), yMap (6), x, y, xM, yM, 10, 8)
    switch (xMap (7), yMap (7), x, y, xM, yM, 22, 1)
end map

procedure ghosts (var Mx : array 1 .. * of int, var My : array 1 .. * of int, col : int)
    for i : 1 .. ghostN
        drawfilloval (x (i), y (i), 7, 7, 7) % Draw Ghost Outline
        drawfilloval (x (i), y (i), 6, 6, col) % Draw Ghost
        x (i) += Mx (i) % Move Ghost X
        y (i) += My (i) % Move Ghost Y
    end for
end ghosts

% Main Sequence
loop
    delay (round (1000 / FPS)) % Frame Rate
    cls % Clear Screen
    map (xMap, yMap, 7) % Draw Map
    ghosts (xM, yM, 12) % Draw Ghosts
    View.Update
end loop
