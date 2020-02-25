% Connor Cerisano
% 2016-11-16
% Arrays

% Beginner Practice
var grade : array 1 .. 4 of real
var average, total : real := 0
for i : 1 .. 4
    put "Enter your mark: "
    get grade (i)
    put ""
    total := total + grade (i)
end for
average := total / 4
put "Your average is ", average, "%"
delay (2000)
cls

% "Try A Few On Your Own"
var names : array 1 .. 5 of string

for i : 1 .. 5
    put "Insert Name Here: "
    get names (i)
end for

cls

for backwards : 1 .. 1
    put "The last name is.. ", names (5)
    put ""
    put "The fourth name is.. ", names (4)
    put ""
    put "The third name is.. ", names (3)
    put ""
    put "The second name is.. ", names (2)
    put ""
    put "The first name is.. ", names (1)
end for

delay (2000)
cls

var name, number : array 1 .. 10 of string

for getnames : 1 .. 10
    put "What are the names? "
    get name (getnames)
    put ""
end for
cls
delay (1000)
for getnumbers : 1 .. 10
    put "What are the numbers? "
    get number (getnumbers)
    put ""
end for

cls
delay (1000)

put "Name", "        Number"
put name (1), "           ", number (1)
put name (2), "           ", number (2)
put name (3), "           ", number (3)
put name (4), "           ", number (4)
put name (5), "           ", number (5)
put name (6), "           ", number (6)
put name (7), "           ", number (7)
put name (8), "           ", number (8)
put name (9), "           ", number (9)
put name (10), "           ", number (10)
