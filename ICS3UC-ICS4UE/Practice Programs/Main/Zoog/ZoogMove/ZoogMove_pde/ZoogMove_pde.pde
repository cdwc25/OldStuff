float x = 100;
float y = 100;

void setup () {
  // Setup
  size (300, 300);
  frameRate (60);
  smooth();
  ellipseMode (CENTER);
  rectMode (CENTER);
}

void draw () {
  //Background 
  background (255);

  //Zoog's Body
  stroke (0);
  fill (0);
  rect (x, y, 20, 100);

  //Zoog's Head
  fill (255);
  ellipse (x, y-30, 60, 60);

  //Zoog's Eyes
  fill (0);
  ellipse (x-20, y-30, 16, 32);
  ellipse (x+20, y-30, 16, 32);

  //Zoog's Legs
  stroke (0);
  line (x-10, y+45, x- 15, y + 70);
  line (x+10, y+45, x+ 15, y + 70);

  //Zoog's Title
  fill (0);
  textSize (34);
  text ("Zoog", x - 40, y - 75);
}