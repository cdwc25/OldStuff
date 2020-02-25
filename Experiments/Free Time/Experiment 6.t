%Experiment 6
% 2016-12-07
% Messing with gui
import GUI

View.Set ("nobuttonbar")
var slider : int
var Value : int := 10

procedure SliderMoved (value : int)
    Text.Locate (9, 7)
    put "Slider"
    Text.Locate (10, 9)
    put value : 3
    Value := value
end SliderMoved

loop
    slider := GUI.CreateVerticalSlider (20, 10, 180, 50, 150, 50, SliderMoved)
    drawfillbox (Rand.Int (0, maxx), Rand.Int (0, maxy), Rand.Int (0, maxx), Rand.Int (0, maxy), Rand.Int (0, 255))
    delay (Value)
end loop


loop
    exit when GUI.ProcessEvent
end loop
