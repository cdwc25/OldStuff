%Experiment 3
%Description: Spazzing cubes and changing oval

var x,y : int := 1
var xbox,ybox : int := 0
loop

drawoval(300,200,x,y,Rand.Int (0,255))

x := x + Rand.Int (1,10)
y := y + Rand.Int (1,10)
x := x + Rand.Int (1,10)
y := y + Rand.Int (1,10)
x := x - Rand.Int (1,10)
y := y - Rand.Int (1,10)
x := x - Rand.Int (1,10)
y := y - Rand.Int (1,10)


delay (10)
View.Update
cls

drawbox (xbox,ybox,xbox + 50,ybox + 50,1)
xbox := Rand.Int (1,maxx)
ybox := Rand.Int (1,maxy)

end loop
