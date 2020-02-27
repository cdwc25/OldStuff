int x, y;
int speed;

void setup () {
  size (500, 500);
  noStroke();
  frameRate (60);
  speed = 1;
  x = 1;
  y = height / 2;
}

void draw () {
  //Clear Screen
  background (255);

  //Movement
  if (keyPressed == true) {
    speed = speed - 2;
  } else speed = speed + 1;
  x = x + speed;

  //Draw
  fill (0);
  ellipse (x, y, 20, 20);

  //Off-Screen Handler
  if (x >= 500) x = 0;
  if (x <= -5) x = 500;
}