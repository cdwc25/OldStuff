//Rect Coords
int[] x = new int[100];
float[] y = new float[100];
color[] c = new color[100];

int[] lanes = new int[100];
int counter;
int space;
int dir=1;

void setup () {
  size (500, 500);
  frameRate (60);

  //Lane Y-Coords
  lanes[0] = 100;
  lanes[1] = 150;
  lanes[2] = 200;
  lanes[3] = 250;
  lanes[4] = 300;

  for (int i=0; i < x.length; i++) {
    //Assign X/Y Coords of each object
    x[i] = space; 
    y[i] = lanes[counter];
    c[i] = color (random(0, 255), random(0, 255), random(0, 255));

    //Don't collide
    space = space + 4;
    if (space > 500) space = 0;

    //Assign each object a lane, only go from 0 to 4 (amount of lanes)
    counter = counter + 1;
    if (counter > 4) counter = 0;
  }
}

void draw () {
  background (220, 100, 100);
  fill(0);
  textSize(20);
  text ("Press space to change direction", 100, 450);

  if (keyPressed) {
    if (key== ' ') {
      dir= -1;
    }
  } else 
  dir=1;

  for (int i=0; i < x.length; i++) {
    fill(c[i]);
    rect (x[i], y[i], 10, 10);

    //Don't go off screen
    if (x[i] > width) x[i] = 0;
    if (x[i] < 0) x[i] = width;

    //Different lane speeds and directions
    if (y[i] == lanes[0]) x[i] = x[i] + 1 * dir;
    if (y[i] == lanes[1]) x[i] = x[i] - 2 * dir;
    if (y[i] == lanes[2]) x[i] = x[i] + 3 * dir;
    if (y[i] == lanes[3]) x[i] = x[i] - 4 * dir;
    if (y[i] == lanes[4]) x[i] = x[i] + 5 * dir;
  }
}