float[] x = new float[20];
float[] y = new float[20];
float[] speed = new float[20];
PImage balloon;

void setup () {
  size (900, 600);
  frameRate (60);
  noStroke();
  smooth();
  balloon = loadImage("balloon.png");

  for (int i=0; i < x.length; i++) {
    y[i] = random (0, height);
    x[i] = random (0, width);
    speed[i] = random (0.2, 1.5);
  }
}

void draw () {
  background (255);

  //Draw Obstacles
  for (int i=0; i < x.length; i++) {
    y[i]=y[i]-speed[i];
    fill (0);
    image(balloon, x[i], y[i], 30, 50);

    if (y[i] <= 0) {
      y[i] = height;
      speed[i] = random (0.2, 1.5);
    }
  }

  textSize (30);
  fill (255, 100, 100);
  text ("Happy Birthday!", width / 2 - 90, height / 2);
}