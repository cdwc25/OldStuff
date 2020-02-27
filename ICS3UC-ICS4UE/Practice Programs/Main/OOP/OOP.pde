int arraysize = 1000;

Car[] myCar = new Car[arraysize];

void setup() {
  size(480, 270);
  frameRate(60);
  noStroke();

  for (int i=0; i < arraysize; i++) {
    myCar[i] = new Car();
  }
}

void draw() {
  background(255);

  for (int i=0; i < arraysize; i++) {
    myCar[i].move();
    myCar[i].display();
  }
}