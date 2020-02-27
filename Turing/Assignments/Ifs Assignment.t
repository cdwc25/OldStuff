%Connor Cerisano
%2016-10-19
%IFs Assignment

% Note: My 4 objects will be an mailbox, flag, tree, and clouds. I will also be using procedures for my shapes, instead of large if statements.

% Declare Variables
var answer : string
var postx1, posty1, postx2, posty2, radius : int %Mailbox Variables for the post, the mailbox, and the size of the mailbox.
var polex1, poley1, polex2, poley2, flagy1, flagy2, flagx2, flagcolor : int %Flag variables for the pole, and flag.
var barkx1, barky1, barky2, treeradius : int %Tree Variables for the bark, and the leaves of the tree.
var cloudx, cloudy, cloudradius : int %Variables to make a cloud. Some are not declared, but I can make the shape just out of these variables.

%Text Color
Text.Color (9)

procedure mailbox
    cls
    % Ask User for first object (Mailbox)
    put "What should the starting point for the mailbox post be?"
    get postx1
    cls
    loop %Answer Validator
	if postx1 > 600 or postx1 < 0 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try again."
	    Text.Color (9) %Reset Color %Reset Color to Blue
	    get postx1
	    cls
	else
	    exit
	end if
    end loop

    put "What should the starting height for the mailbox post be?"
    get posty1
    cls
    loop %Answer Validator
	if posty1 > 400 or posty1 < 0 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try again."
	    Text.Color (9) %Reset Color
	    get posty1
	    cls
	else
	    exit
	end if
    end loop

    put "What should the ending point for the mailbox post be?"
    get postx2
    cls
    loop %Answer Validator
	if postx2 < postx1 or postx2 > 600 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try again."
	    Text.Color (9) %Reset Color
	    get postx2
	    cls
	else
	    exit
	end if
    end loop

    put "What should the ending height for the mailbox post be?"
    get posty2
    loop %Answer Validator
	cls
	if posty2 < posty1 or posty2 > 400 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try again."
	    Text.Color (9) %Reset Color
	    get posty2
	    cls
	else
	    exit
	end if
    end loop

    put "What should the radius of the box be?"
    get radius
    loop %Answer Validator
	cls
	if radius > 50 or radius < 0 then
	    cls
	    Text.Color (12) %Incorrect
	    put "That radius is too big/small. Please try again."
	    Text.Color (9) %Reset Color
	    get radius
	    cls
	else
	    exit
	end if
    end loop

    cls
    delay (1000)
    put "Now drawing your shape."
    delay (2000)
    cls

    drawfillbox (postx1, posty1, postx2, posty2, 137)     %Draw the Post
    drawfillarc (postx1, posty2, radius, radius, 0, 180, 27)     %Draw the Box on top of the post
end mailbox

procedure flag
    cls
    %Ask User For Second Object (Flag)
    put "What should the starting point for the flag pole be?"
    get polex1
    loop %Answer Validator
	cls
	if polex1 < 0 or polex1 > 600 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try again."
	    Text.Color (9) %Reset Color
	    get polex1
	    cls
	else
	    exit
	end if
    end loop

    put "What should the starting height for the flag pole be?"
    get poley1
    loop %Answer Validator
	cls
	if poley1 < 0 or poley1 > 400 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try again."
	    Text.Color (9) %Reset Color
	    get poley1
	    cls
	else
	    exit
	end if
    end loop

    put "What should the ending point for the flag pole be?"
    get polex2
    loop %Answer Validator
	cls
	if polex2 < polex2 or polex2 > 600 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try again."
	    Text.Color (9) %Reset Color
	    get polex2
	    cls
	else
	    exit
	end if
    end loop

    put "What should the ending height for the flag pole be?"
    get poley2
    loop %Answer Validator
	cls
	if poley2 < poley1 or poley2 > 400 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try again."
	    Text.Color (9) %Reset Color
	    get poley2
	    cls
	else
	    exit
	end if
    end loop

    put "How wide should the flag be?"
    get flagx2
    loop %Answer Validator
	cls
	if flagx2 > 600 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try again."
	    Text.Color (9) %Reset Color
	    get flagx2
	    cls
	else
	    exit
	end if
    end loop

    put "How far down (from the top) should the flag be?"
    get flagy2
    loop %Answer Validator
	cls
	if flagy2 > poley2 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try again."
	    Text.Color (9) %Reset Color
	    get flagy2
	    cls
	else
	    exit
	end if
    end loop

    put "What should the color of the flag be?"
    get flagcolor
    loop %Answer Validator
	if flagcolor < 0 or flagcolor > 255 then
	    cls
	    Text.Color (12) %Incorrect
	    put "That is an invalid color. Please try again."
	    Text.Color (9) %Reset Color
	    get flagcolor
	    cls
	else
	    exit
	end if
    end loop

    delay (500)
    cls
    put "Now drawing your flag."
    delay (1500)
    cls

    drawfillbox (polex1, poley1, polex2, poley2, 29)     %Draw the Pole
    drawfillbox (polex2, poley2, polex2 + flagx2, poley2 - flagy2, flagcolor)     %Draw the Flag
end flag

procedure tree
    cls
    %Ask User for third Object (Tree)
    put "What should the starting point for the bark be?"
    get barkx1
    loop %Answer Validator
	cls
	if barkx1 > 600 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try again."
	    Text.Color (9) %Reset Color
	    get barkx1
	    cls
	else
	    exit
	end if
    end loop

    put "What should the starting height for the bark be?"
    get barky1
    loop %Answer Validator
	cls
	if barky1 > 400 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try again."
	    Text.Color (9) %Reset Color
	    get barky1
	    cls
	else
	    exit
	end if
    end loop

    put "What should the ending height for the bark be?"
    get barky2
    loop %Answer Validator
	cls
	if barky2 < barky1 or barky2 > 400 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try again."
	    Text.Color (9) %Reset Color
	    get barky2
	    cls
	else
	    exit
	end if
    end loop

    put "How wide should the leaves be?"
    get treeradius
    loop %Answer Validator
	cls
	if treeradius > 20 or treeradius < 0 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try something between 1 and 20."
	    Text.Color (9) %Reset Color
	    get treeradius
	    cls
	else
	    exit
	end if
    end loop

    cls
    put "Now drawing the tree..."
    delay (2500)
    cls

    drawfillbox (barkx1, barky1, barkx1 + 10, barky2, 137)
    drawfilloval (barkx1 + 5, barky2 * 2 - barky2, treeradius, treeradius + 5, 2)
end tree

procedure cloud
    cls
    %Ask user for the last object (Cloud)
    put "What should the starting point of the cloud be?"
    get cloudx
    loop %Answer Validator
	cls
	if cloudx < 0 or cloudx > 600 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try again."
	    Text.Color (9) %Reset Color
	    get cloudx
	    cls
	else
	    exit
	end if
    end loop

    put "What should the starting height of the cloud be?"
    get cloudy
    loop %Answer Validator
	cls
	if cloudy < 0 or cloudy > 400 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try again."
	    Text.Color (9) %Reset Color
	    get cloudy
	    cls
	else
	    exit
	end if
    end loop

    put "How large should the clouds be?"
    get cloudradius
    loop %Answer Validator
	cls
	if cloudradius < 0 or cloudradius > 200 then
	    cls
	    Text.Color (12) %Incorrect
	    put "This is an invalid number. Please try something between 0 or 200."
	    Text.Color (9) %Reset Color
	    get cloudradius
	    cls
	else
	    exit
	end if
    end loop

    cls
    put "Now drawing your cloud."
    delay (1500)
    cls

    drawfilloval (cloudx, cloudy, cloudradius + 7, cloudradius, 27)     % First Cloud.
    drawfilloval (cloudx + 10, cloudy + 10, cloudradius + 7, cloudradius, 28)     %Second Cloud to add more detail.
    drawfillbox (cloudx + 6, cloudy - 49, cloudx + 9, cloudy - 40, 9)     %Rain Drop, below the cloud based on its coordinates
    drawfillbox (cloudx - 5, cloudy - 99, cloudx - 2, cloudy - 90, 9)     %Second Rain Drop
    drawfillbox (cloudx + 5, cloudy - 130, cloudx + 2, cloudy - 139, 9)     %Third Rain Drop
    drawfillbox (cloudx - 9, cloudy - 39, cloudx - 6, cloudy - 30, 9)     %Fourth Rain Drop
end cloud

% Ask user what they want to make
loop
    put "What object do you want to draw? A mailbox,flag,tree,or a cloud?"
    get answer
    if answer = "mailbox" or answer = "Mailbox" then
	mailbox %Call mailbox procedure
	exit
    elsif answer = "flag" or answer = "Flag" then
	flag %Call flag procedure
	exit
    elsif answer = "tree" or answer = "Tree" then
	tree %Call tree procedure
	exit
    elsif answer = "cloud" or answer = "Cloud" then
	cloud %Call cloud procedure
	exit
    else
	cls
	Text.Color (12) %Incorrect
	put "Invalid Option."
	Text.Color (9) %Reset Color
	delay (1500)
	cls
    end if
end loop
