int x, y, size;
int cellx, celly;

void setup () {
  size (600, 600);
  x = width / 2;
  y = height / 2;

  cellx = round(random(0, width));
  celly = round(random(0, height));

  size = 20;

  noStroke();
}

void draw () {
  background(255);

  fill(0, 255, 0);
  ellipse(cellx, celly, 20, 20);

  if (dist(x, y, cellx, celly) < 20) { 
    size = size + 10;
    cellx = round(random(0, width));
    celly = round(random(0, height));
  }

  fill(0);
  ellipse(x, y, size, size);

  if (key == 'w') y = y - 4;
  if (key == 's') y = y + 4;
  if (key == 'a') x = x - 4;
  if (key == 'd') x = x + 4;

  fill(random(0, 255), random(0, 255), random(0, 255));
}