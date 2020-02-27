void setup () {
  size (500, 500);
  noStroke();
  frameRate (60);
}

void draw () {
  for (int s=50; s > 0; s=s-3) {
    float r1, r2;

    r1 = random(0, 500);
    r2 = random(0, 500);

    fill(random(0, 255), random(0, 255), random(0, 255));

    //ellipse (r1, r2, s, s);
    textSize (20);
    text (s, r1, r2);
    delay(2);
  }
}