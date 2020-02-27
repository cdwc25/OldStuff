//Variables
float bx, by;
int cc1, cc2, cc3, cc4;
float r, r2, r3, r4;

void setup () {
  size (500, 500);
  frameRate (60);
  ellipseMode (CENTER);

  //Starting Coords
  bx = width/2;
  by = height/2;
  r = random(width);
  r2 = random(height);
  r3 = random(width);
  r4 = random(height);
}


void draw () {
  background (255);

  //Obstacles
  fill (0);
  ellipse (r, r2, 20, 20);
  ellipse (r3, r4, 20, 20);

  //Good Guy
  fill (999);
  ellipse (mouseX, mouseY, 30, 30);

  //Bad Guy
  fill (255, 0, 0);
  ellipse (bx, by, 20, 20);
  if (mouseX > bx) bx = bx + 1;
  if (mouseX < bx) bx = bx - 1;
  if (mouseY > by) by = by + 1;
  if (mouseY < by) by = by - 1;

  //Spacial Detection
  if (dist(mouseX, mouseY, bx, by) < 25) exit ();

  //Color Collision
  cc1 = get (mouseX + 25, mouseY);
  cc2 = get (mouseX - 25, mouseY);
  cc3 = get (mouseX, mouseY + 25);
  cc4 = get (mouseX, mouseY - 25);
  if (cc1 <=-16777216 || cc2 <=-16777216 || cc3 <=-16777216 || cc4 <=-16777216) exit ();

  //Debug
  //text (cc1, 30, 30);
  //text (cc2, 60, 30);
  //text (cc3, 90, 30);
  //text (cc4, 120, 30);
}