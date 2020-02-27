setscreen ("graphics:600;600")
var key : array char of boolean % Key Press Sensor Variable
var x, y : int := 285 % Key Press Sensor Variable
var c : int
var size : int := 80
var m, n, o, p : boolean := true

function intValid (txt : string, min : int, max : int) : int % Integer Validator
    var v : int
    loop
        put txt, " (Enter an integer between ", min, " and ", max, "): " ..
        get v
        if v >= min and v <= max then % If Valid, Var = V
            cls
            result v
        else
            put "Invalid value." % If Invalid, Repeat
            delay (2000)
            cls
        end if
    end loop
end intValid

procedure hero (x : int, y : int, si : int, col : int) % Avatar
    drawfillbox (x - round (si / 2), y - round (si / 2), x + round (si / 2), y + round (si / 2), col)
end hero

procedure block (xM : int, yM : int, x2M : int, y2M : int, var mover : boolean, var mover2 : boolean, var mover3 : boolean, var mover4 : boolean, colorer : int)
    if xM < x + round (size / 2) and x2M > x - round (size / 2) and yM = y + round (size / 2) then % Bottom Side
        mover := false
    else
        mover := true
    end if

    drawbox (xM, yM, x2M, y2M, colorer)
    if xM < x + round (size / 2) and x2M > x - round (size / 2) and y2M = y - round (size / 2) then % Top Side
        mover2 := false
    else
        mover2 := true
    end if
    
    if yM < y + round (size / 2) and y2M > y - round (size / 2) and xM = x + round (size / 2) then % Left Side
        mover4 := false
    else
        mover4 := true
    end if

    drawbox (xM, yM, x2M, y2M, colorer)
    if yM < y + round (size / 2) and y2M > y - round (size / 2) and x2M = x - round (size / 2) then % Right Side
        mover3 := false
    else
        mover3 := true
    end if
end block

procedure movHandler (si : int, var move : boolean, var move2 : boolean, var move3 : boolean, var move4 : boolean)
    loop
        delay (10)
        Input.KeyDown (key)
        cls
        if move = true and key (KEY_UP_ARROW) and not key (KEY_LEFT_ARROW) and not key (KEY_RIGHT_ARROW) then % UP
            y += 1
        elsif move2 = true and key (KEY_DOWN_ARROW) and not key (KEY_LEFT_ARROW) and not key (KEY_RIGHT_ARROW) then % DOWN
            y -= 1
        elsif move3 = true and key (KEY_LEFT_ARROW) and not key (KEY_UP_ARROW) and not key (KEY_DOWN_ARROW) then % LEFT
            x -= 1
        elsif move4 = true and key (KEY_RIGHT_ARROW) and not key (KEY_UP_ARROW) and not key (KEY_DOWN_ARROW) then % RIGHT
            x += 1
        end if
        if x > 600 + round (size / 2) then
            x := 0 - round (size / 2)
        end if
        if x < 0 - round (size / 2) then
            x := 600 + round (size / 2)
        end if

        if y > 600 + round (size / 2) then
            y := 0 - round (size / 2)
        end if
        if y < 0 - round (size / 2) then
            y := 600 + round (size / 2)
        end if
        hero (x, y, size, c)
        block (400, 200, 450, 250, m, n, o, p, 7)
    end loop
end movHandler

% MAIN SEQUENCE
c := intValid ("What color is your avatar", 0, 255)
var i : int := 0

movHandler (size, m, n, o, p)
