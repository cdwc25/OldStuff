var startnumber, endnumber : int

put "What is the starting number?"
get startnumber
cls
put "What is the ending number?"
get endnumber
cls

loop
    put startnumber
    startnumber := startnumber + 1
    exit when startnumber = endnumber
    if startnumber > endnumber then
	cls
	put "Error. Starting Number is bigger then ending number. Closing..."
	exit
    end if
    delay (10)
    cls
end loop
