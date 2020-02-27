% Name: Connor Cerisano
% If Statements
% 2016-10-12

% Variables
var grade1,grade2,grade3,avg : real

% Ask user for 3 grades
put "What is your first grade? (0-100) "..
get grade1

put "What is your second grade? (0-100) "..
get grade2

put "What is your third grade? (0-100) "..
get grade3

% Calculate Numerical Average
avg := (grade1 + grade2 + grade3) / 3
put "Your numerical average is "..
put avg ..
put "%"

% Calculate Grade Average
if avg <=80 and avg >=100  then put "Your grade is an A."
end if

if avg >=70 and avg <=79.9 then put "Your grade is a B."
end if

if avg >=60 and avg <=69.9 then put "Your grade is a C."
end if

if avg >=50 and avg <=59.9 then put "Your grade is a D." 
end if

if avg <=50 then put "Your grade is F..."
end if

% Move On To Practice Program 2
delay (3000)
cls

% Variables
var answer:string

% First Question
put "Whats 1 plus 1?"
put "A = 4, B = 7, C = 2"
delay (2000)
get answer 
    if answer = "C" then
    cls 
    put "Correct!"
    delay (1000)
    cls
    else cls put "Incorrect.."
    delay (2000)
    cls
    end if
put "Time for the next question!"
delay (1000)
cls

% Second Question
put "Whats 2 plus 2?"
put "A = 5, B = 4, C =40" 
delay (2000)
get answer 
    if answer = "B" then
    cls 
    put "Correct!"
    delay (1000)
    cls
    else cls put "Incorrect.."
    delay (2000)
    cls
    end if
put "Time for the next question!"
delay (1000)
cls

% Third Question
put "Whats 8 plus 5?"
put "A = 13, B = 50, C = 15"
delay (2000)
get answer 
    if answer = "A" then
    cls 
    put "Correct!"
    delay (1000)
    cls
    else cls put "Incorrect.."
    delay (2000)
    cls
    end if
put "Time for the next question!"
delay (1000)
cls

% Fourth Question
put "Whats 10 plus 20?"
put "A=30, B=34, C=21" 
delay (2000)
get answer 
    if answer = "A" then
    cls 
    put "Correct!"
    delay (1000)
    cls
    else cls put "Incorrect.."
    delay (2000)
    cls
    end if
put "Time for the next question!"
delay (1000)
cls

% Fifth Question
put "Whats 300 plus 900?"
put "A=6200,B=1200,C=1100"
delay (2000)
get answer 
    if answer = "B" then
    cls 
    put "Correct!"
    delay (1000)
    cls
    else cls put "Incorrect.."
    delay (2000)
    cls
    end if
put "You have completed the quiz!"
delay (1000)
cls
put "Congratulations! The program will now close."
delay (2000)
cls
