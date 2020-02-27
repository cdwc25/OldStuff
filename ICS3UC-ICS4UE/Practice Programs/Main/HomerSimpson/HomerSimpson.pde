int arraysize = 100;
PImage homer, donutimage;
int eaten;

Donut d[] = new Donut[arraysize];

void setup() {
  size(480, 270);
  frameRate(60);
  noStroke();
  imageMode(CENTER);
  homer = loadImage("homer.png");
  donutimage = loadImage("donutimage.png");

  for (int i=0; i < arraysize; i++) {
    d[i] = new Donut(random(0, width), random(0, height), color(random(0, 255), random(0, 255), random(0, 255)), random(15, 20), true);
  }
}

void draw() {
  background(255);

  image(homer, mouseX, mouseY, 50, 50);

  for (int i=0; i < arraysize; i++) {
    d[i].display();

    if (dist(d[i].x, d[i].y, mouseX, mouseY) < 30) {
      d[i].v=false;
      d[i].x = -1000;
      eaten++;
    }

    if (eaten > arraysize) exit();
  }
}