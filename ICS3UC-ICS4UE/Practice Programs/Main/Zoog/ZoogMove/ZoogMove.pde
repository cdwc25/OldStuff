float x = width / 2 + 100;
float y = height / 2 + 100;

float d = dist(x, y, mouseX, mouseY);
color c = color(d);

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

  drawZoog(c);
  jiggleZoog(0.3);
}

void drawZoog (color ZC) {
  ZC = color(random(0, 255), random(0, 255), random(0, 255));
  //Zoog's Body
  stroke (0);
  fill (ZC);
  rect (x, y, 20, 100);

  //Zoog's Head
  fill (ZC);
  ellipse (x, y-30, 60, 60);

  //Zoog's Eyes
  fill (ZC);
  ellipse (x-20, y-30, 16, 32);
  ellipse (x+20, y-30, 16, 32);

  //Zoog's Legs
  stroke (0);
  line (x-10, y+45, x-15, y + 70);
  line (x+10, y+45, x+15, y + 70);

  //Zoog's Title
  fill (ZC);
  textSize (34);
  text ("Zoog", x - 40, y - 75);
}

void jiggleZoog(float speed) {
  x = x + random(-1, 1)*speed;
  y = y + random(-1, 1)*speed;

  //Constrain (Don't run off screen)
  constrain(x, 0, width - 200);
  constrain(y, 0, height - 200);
}