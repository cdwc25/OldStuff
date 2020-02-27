int x, y; //Player
int c1, c2, c3, c4; //Collision
float ex, ey, ex2, ey2; //Enemies
PImage photo; //Maze

void setup () {
  //Setup
  photo = loadImage ("maze.png");
  size (482, 482);
  frameRate (60);
  smooth ();
  background (255);
  ellipseMode (CENTER);

  //Starting Locations
  y = 470;
  x = 250;
  ex = 0;
  ey = random (0, height);
  ex2 = random (0, width);
}

void draw () {
  //Collision Borders
  c1 = get (x, y - 5); //up
  c2 = get (x, y + 5); //down
  c3 = get (x - 5, y); //left
  c4 = get (x + 5, y); //right

  //Avoid box having a trail
  background (255);
  image(photo, 0, 0);

  //Controls
  if (keyPressed) {
    if (keyCode==RIGHT && c4 !=-16777216) x=x+2;
    if (keyCode==LEFT && c3 !=-16777216) x=x-2;
    if (keyCode==DOWN && c2 !=-16777216) y=y+2;
    if (keyCode==UP && c1 !=-16777216) y=y-2;
  }

  //Player
  fill (0, 0, 255);
  ellipse(x, y, 7, 7);

  //Enemies
  fill (0, 255, 0);
  ellipse (ex, ey, 10, 10);
  if (ex > width) {
    ex = 0;
    ey = random (0, height);
  } else ex = ex + 1;

  fill (255, 0, 0);
  ellipse (ex2, ey2, 10, 10);
  if (ey2 > height) {
    ex2 = random (0, width);
    ey2 = 10;
  } else ey2 = ey2 + 1;

  //Collision (For Enemies)
  if (dist(x, y, ex, ey) < 7) exit ();
  if (dist(x, y, ex2, ey2) < 7) exit ();

  //WINNER!!!
  if (y < 0) exit();
}