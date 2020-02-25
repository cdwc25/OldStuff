setscreen ("graphics:600;600")
var key : array char of boolean % Key Press Sensor Variable
var x, y : int := 285 % Key Press Sensor Variable
var c : int
var size : int := 20

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

procedure movHandler (si : int)
    loop
        delay (10)
        Input.KeyDown (key)
        cls
        if key (KEY_F2) then
            exit
        end if
        if x > 600 + round(size / 2) then
            x := 0 - round(size / 2)
        end if
        if x < 0 - round(size / 2) then
            x := 600 + round(size / 2)
        end if

        if y > 600 + round(size / 2) then
            y := 0 - round(size / 2)
        end if
        if y < 0 - round(size / 2) then
            y := 600 + round(size / 2)
        end if
        if key (KEY_UP_ARROW) and not key (KEY_LEFT_ARROW) and not key (KEY_RIGHT_ARROW) then % UP
            y += 1
        elsif key (KEY_DOWN_ARROW) and not key (KEY_LEFT_ARROW) and not key (KEY_RIGHT_ARROW) then % DOWN
            y -= 1
        elsif key (KEY_LEFT_ARROW) and not key (KEY_UP_ARROW) and not key (KEY_DOWN_ARROW) then % LEFT
            x -= 1
        elsif key (KEY_RIGHT_ARROW) and not key (KEY_UP_ARROW) and not key (KEY_DOWN_ARROW) then % RIGHT
            x += 1
        elsif key (KEY_UP_ARROW) and key (KEY_RIGHT_ARROW) then % U_RIGHT
            y += 1
            x += 1
        elsif key (KEY_UP_ARROW) and key (KEY_LEFT_ARROW) then % U_LEFT
            y += 1
            x -= 1
        elsif key (KEY_DOWN_ARROW) and key (KEY_RIGHT_ARROW) then % D_RIGHT
            y -= 1
            x += 1
        elsif key (KEY_DOWN_ARROW) and key (KEY_LEFT_ARROW) then % D_LEFT
            y -= 1
            x -= 1
        end if
        hero (x, y, size, c)
    end loop
end movHandler

% MAIN SEQUENCE
c := intValid ("What color is your avatar", 0, 255)
var i : int := 0
movHandler (size)
