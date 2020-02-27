int x, y;
float ox, oy;
int cc1, cc2, cc3, cc4; 

void setup () {
  //Setup
  size (500, 500);
  frameRate (60);
  background (255);
  ellipseMode (CENTER);
  smooth ();

  //Starting Coordinates
  x = 20;
  y = 250;
  ox = 250;
  oy = 490;
}

void draw () {

  //Movement
  if (cc1 >= -1 && cc2 >= -1 && cc3 >=-1 && cc4 >=-1) {
    if (keyPressed) {
      if (key == 'w') y = y - 3;
    } else y = y + 0;

    if (keyPressed) {
      if (key == 's') y = y + 3;
    } else y = y + 0;

    if (keyPressed) {
      if (key == 'a') x = x - 3;
    } else x = x + 0;

    if (keyPressed) {
      if (key == 'd') x = x + 3;
    } else x = x + 0;
  } else {
    x = 20;
    y = 250;
  }

  //Collision
  cc1 = get (x, y + 21);
  cc2 = get (x, y - 21);
  cc3 = get (x - 21, y);
  cc4 = get (x + 21, y);

  //Player
  background (255);
  fill (255);
  ellipse (x, y, 30, 30);
  fill (0);

  //Obstacles
  ellipse (ox, oy, 30, 30);
  ellipse (ox - 200, oy, 30, 30);
  ellipse (ox + 200, oy, 30, 30);
  if (oy >= height) oy = 0;
  else oy = oy + 10;
}