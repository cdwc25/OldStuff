% Connor Cerisano
% 2017-01-25
% Task: Write a hi-lo guessing game

%Variables
var guess : array 1 .. 100  of int %Amount of numbers guessed
var answer : int := Rand.Int (1, 100) %Random number to guess
var display : int := 1 %Displays all the guessed numbers.
var counter : int := 1 %Anti-Crash Mechanic. Makes sure the array doesnt get out of range.

%Custom Window
View.Set ("position:400,150,nobuttonbar")

%Main Loop (Just in case user somehow doesnt get it right after 100 tries.)
loop
    for i : 1 .. 100
	put "Try to guess the random number."
	get guess (i)
	counter := counter + 1 %Increase Number Of Guesses

	if guess (i) = answer then %If the user has guessed, display the results
	    cls
	    Text.Color (green)
	    put "You guessed the number correctly!"
	    put "Here are your guesses:"
	    loop %Displays guesses until no more are available
		if display = counter then %If all results are displayed, pause the program
		    delay (9000000)
		end if
		put guess (display) %Draw results
		display := display + 1
	    end loop
	end if

	if guess (i) > answer then %If the guess is too higher then answer
	    cls
	    Text.Color (red)
	    put "Try again. Number is too high!"
	    Text.Color (black)
	elsif guess (i) < answer then %If the guess is too lower then answer
	    cls
	    Text.Color (red)
	    put "Try again. Number is too low!"
	    Text.Color (black)
	end if
    end for
end loop

