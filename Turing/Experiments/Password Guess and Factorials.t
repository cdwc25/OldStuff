% Connor Cerisano
% 2016-11-01
% Task: Make a hacking game and create a program that gives a factorial.

%Variables
var counter : int := 5
var number,counter2,password : int

%Ask user for the secret password
loop
    put "Try to guess the secret password."
    get password
    if password = 12345 then
	cls
	put "You got the secret password!"
	exit
    else
	cls
	counter -= 1
	put "Invalid password. ", counter, " tries remaining until lockout."
    end if
    exit when counter = 0
end loop

delay (1000)
cls


%Ask user
put "What is the number?"
get number
cls
counter2 := number - 1

%Calculate factorial
loop
number := number * counter2
counter2 -= 1
if counter2 = 1 then exit
end if
end loop

%Display Output
put "The answer to your factorial is ", number
