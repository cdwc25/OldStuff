float[] x = new float[200];
float[] y = new float[200];
float[] speed = new float[200];
color[] c = new color[200];

void setup () {
  size (500, 500);
  frameRate (60);
  noStroke();
  smooth();

  for (int i=0; i < x.length; i++) {
    y[i] = random (0, 500);
    x[i] = random (0, 400);
    speed[i] = random (2, 6);
    c[i] = color (random(0, 255), random(0, 255), random(0, 255));
  }
}

void draw () {
  background (255);
  for (int i=0; i < x.length; i++) {

    x[i]=x[i]+speed[i];
    fill (c[i]);
    ellipse(x[i], y[i], 10, 10);

    if (x[i] >= 500) {
      x[i] = 0;
      speed[i] = random (2, 6);
      fill (c[i]);
    }
  }
}