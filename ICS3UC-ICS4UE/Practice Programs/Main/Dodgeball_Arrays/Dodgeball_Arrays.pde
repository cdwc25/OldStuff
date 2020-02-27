float[] x = new float[100];
float[] y = new float[100];
float[] speed = new float[100];
color[] c = new color[100];

int ux, uy;
int score;
int level;

void setup () {
  size (900, 600);
  frameRate (60);
  noStroke();
  smooth();

  ux = 850;
  uy = height / 2;

  for (int i=0; i < x.length; i++) {
    y[i] = random (0, height);
    x[i] = random (0, width - 200);
    speed[i] = random (0.9, 2.5);
    c[i] = color (random(0, 255), random(0, 255), random(0, 255));
  }
}

void draw () {

  //WIN SCREEN
  if (level == 1) {
    background (255);
    textSize (50);
    fill (0, 255, 0);
    text ("You Win!", width / 2 - 110, height / 2);
  }

  //LOSE SCREEN
  if (level == 3) {
    background (255);
    textSize (50);
    fill (255, 0, 0);
    text ("You Lose!", width / 2 - 120, height / 2);
  }

  //MAIN GAME
  if (level == 0) {
    background (255);

    //Player
    if (keyPressed) {
      if (key=='w') uy = uy - 2;
      if (key=='s') uy = uy + 2;
      if (key=='a') ux = ux - 2;
      if (key=='d') ux = ux + 2;
    }
    fill (0);
    ellipse (ux, uy, 15, 15);

    //Score
    text ("Obstacles Dodged:", 10, 10);
    text (score, 120, 10);
    if (score > 300) level = 1;

    //Draw Obstacles
    for (int i=0; i < x.length; i++) {
      x[i]=x[i]+speed[i];
      fill (c[i]);
      ellipse(x[i], y[i], 10, 10);

      if (x[i] >= width) {
        x[i] = 0;
        speed[i] = random (0.9, 2.5);
        fill (c[i]);
        score = score + 1;
      }

      //Collision Detection
      //if (dist (ux, uy, x[i], y[i]) < 11) level = 3;
    }
  }
}