%Experiment 4
%Description: Testing out a timer

var timerunning : int

loop
clock (timerunning)
put timerunning

if timerunning >= 6000 and timerunning <7000 then
put "congrats you wasted 6 seconds of your life"
delay (1000)
elsif timerunning >= 7000 and timerunning <8000 then
put "congrats you wasted 7 seconds of your life"
delay (1000)
elsif timerunning >= 8000 and timerunning <9000 then
put "congrats you wasted 8 seconds of your life"
delay (1000)
elsif timerunning >= 9000 and timerunning <10000 then
put "congrats you wasted 9 seconds of your life"
delay (1000)
elsif timerunning >=10000 and timerunning <11000 then
put "congrats you wasted 10 seconds of your life"
delay (1000)

end if

View.Update
cls
end loop
