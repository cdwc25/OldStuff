int x, y;
int c1, c2, c3, c4;

void setup() {
  size (600, 600);
  frameRate(60);
  noStroke();

  x=width / 2;
  y=height / 2;
}

void draw() {
  background(255);

  fill (0);
  rect(0, 500, 600, 600);
  rect(100, 400, 130, 410);

  c1 = get (x + 10, y);
  c2 = get (x - 10, y);
  c3 = get (x, y + 10);
  c4 = get (x, y - 10);
  text (c1, 20, 20);

  if (c3 == -16777216) y = y - 3;
  if (c4 == -16777216) y = y + 3;
  if (c1 == -16777216) x = x - 3;
  if (c2 == -16777216) x = x + 3;

  fill(255, 0, 0);
  ellipse(x, y, 20, 20);

  if (keyPressed) {
    if (key == 'w') y = y - 3;
    if (key == 's') y = y + 3;
    if (key == 'a') x = x - 3;
    if (key == 'd') x = x + 3;
  }
}