int x, y;
int c1, c2, c3;

void setup () {
  size (300, 300);
  x = width / 2;
  y = height / 2;

  noStroke();
}

void draw () {
  c1 = get (x - 20, y);
  c2 = get (x + 20, y);
  c3 = get (x, y - 20);

  fill(0);
  ellipse(x, y, 20, 20);

  if (key == 'w') y = y - 2;
  if (key == 's') y = y + 2;
  if (key == 'a') x = x - 2;
  if (key == 'd') x = x + 2;

  fill(random(0, 255), random(0, 255), random(0, 255));
  text (c3, 20, 20);

  if (c1 != -3355444 && c2 != -3355444 && c3 != -3355444) exit();
}