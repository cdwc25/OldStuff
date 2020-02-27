int x, y;
int size;
int space;


void setup () {
  size(600, 600);
  background(255);
  frameRate(600000);
  size = 50;
  space = 50;
  noStroke();
  smooth();
}

void draw () {
  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(x, y, x + size, y + size);
  x = x + space;

  if (x > width) { 
    x = 0;
    y = y + size;
  }
}