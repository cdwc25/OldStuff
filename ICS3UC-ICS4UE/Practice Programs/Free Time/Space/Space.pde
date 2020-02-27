float[] x = new float[500];
float[] y = new float[500];
float[] speed = new float[500];
color[] c = new color[500];

void setup () {
  size (800, 800);
  frameRate (144);
  noStroke();
  smooth();

  for (int i=0; i < x.length; i++) {
    y[i] = random (0, height);
    x[i] = random (0, width);
    speed[i] = random (0.1, 0.2);
    c[i] = color (255);
  }
}

void draw () {
  background (0);
  for (int i=0; i < x.length; i++) {

    x[i]=x[i]+speed[i];
    fill (c[i]);
    ellipse(x[i], y[i], 1, 1);

    if (x[i] >= width) {
      x[i] = 0;
      speed[i] = random (0.1, 0.15);
      fill (0);
    }
  }
}