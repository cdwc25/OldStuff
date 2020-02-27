% 15 and 16 and 17
var luckyNumber : int
luckyNumber := 7

put "The value of luckyNumber is "..
put luckyNumber
put " "
delay (1000)

put "luckyNumber squared is "..
put luckyNumber ** 2
put " "
delay (1000)

put "luckyNumber cubed is "..
put luckyNumber ** 3
put " "
delay (1000)

put "The square root of luckyNumber is "..
put sqrt (luckyNumber)
put " "
delay (1000)

put "luckyNumber times 2 is "..
put luckyNumber * 2
put " "
delay (1000)

put "luckyNumber + 2 = "..
put luckyNumber + 2
put " "
delay (3000)
cls  

% 18
var birthYear : int
var currentYear : int
put "What year were you born? "..
get birthYear
put "What year is it now? "..
get currentYear
put "Then you should be "..
put currentYear - birthYear

delay (3000)
cls 

% 19a and 20 (const)
var pi : real :=3.1416
put "The value of PI is "..
put pi
const a : real :=3.56
const b : real :=5.67
put "The sum of 3.56 and 5.67 is "..
put a + b
put "The difference of 3.56 and 5.67 is "..
put a - b
put a * b
put a ** b

delay (3000)
cls

%19b
var radius:real
put "What is the radius of the circle? "..
get radius
put "If the radius of the circle is "..
put radius ..
put " then the circumference of the circle should be "..
put 3.1416 * radius * 2 

delay (3000)
cls 

%19c
var timeTravelled : real
var distanceTravelled : real
put "What is the time travelled? "
get timeTravelled
cls
put "What is the distance travelled? "
get distanceTravelled
cls
put "Then your average speed should be "..
put timeTravelled ..
put "/" ..
put distanceTravelled ..
put " km/h"

delay (3000)
cls

%19d and 19e
var a2 : real
var b2 : real
put "What is the first number? "
get a2
cls
put "What is the second number? "
get b2
cls
put "Then "..
put a2 ..
put " divided by "..
put b2 ..
put " is "..
put a2 div b2

delay (3000)
cls

%19f
var weight : real
put "What is your weight? "..
get weight
cls
put "Your weight in pounds is "..
put weight * 2.2

delay (3000)
cls

% 21 and 22
var Fname : string 
var Lname : string
put "What is your first name? ".. 
get Fname
put "What is your last name? "..
get Lname
put "Your name is "..
put Fname ..
put Lname

delay (3000)
cls

% 22b (Review of int,real,and string)
var favoritecolor:string
var favoritenumber:int
var favoritedecimal:real

put "What is your favorite color? "
get favoritecolor
cls
put "What is your favorite number? "
get favoritenumber
cls
put "What is your favorite decimal? "
get favoritedecimal
cls
put "Your favorite color is "..
put favoritecolor 
put "Your favorite number is "..
put favoritenumber
put "Your favorite decimal is "..
put favoritedecimal






