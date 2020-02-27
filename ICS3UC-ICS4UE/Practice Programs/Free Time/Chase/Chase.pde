int x, y;
int px, py;
int level = 1;
int getmousecolor;
int score;
int speed = 5;
int timer;
int speedtimer;


void setup () {
  background(255);
  fullScreen();
  rectMode(CENTER);
  imageMode(CENTER);
  noStroke();
  smooth();
}

void draw () {
  if (level == 1) {
    getmousecolor = get (mouseX, mouseY); //Mouse Color Checker

    fill(255, 0, 0);
    textSize(80);
    text("Avoid The Red Ball!", width / 2- 350, height / 2 - 400); 

    //Button
    fill (0, 255, 0);
    rect (width / 2, height / 2, 700, 700);

    //If button is clicked, Start Main Game
    if (mousePressed && mouseY >= 250 && getmousecolor ==-16711936) {
      level = 2;
      px = width / 2;
      py = 300;
      x = width / 2;
      y = height / 2;
      score = 0;
    }

    //Flashing Text Effect
    timer++;
    if (timer > 70) timer = timer - 70;
    if (timer < 50) {
      fill (0);
      textSize(100);
      text ("Start Game", width / 2 - 250, height / 2 + 30);
    }
  }

  if (level == 2) {
    background(255);

    textSize(200);
    text ("Level:", 50, 200);
    text (score, 640, 200);

    //-------ENEMY-------
    fill(255, 0, 0);
    ellipse(x, y, 200, 200);

    //Enemy Movement
    if (py < y) y = y - speed;
    if (px < x) x = x - speed;
    if (py > y) y = y + speed;
    if (px > x) x = x + speed;

    speedtimer++;
    if (speedtimer > 100) {
      speed = speed + 2;
      speedtimer = 0;
      score = score + 1;
    }

    //-------PLAYER-------
    fill(0, 255, 0);
    rect(px, py, 200, 200);

    if (dist(px, py, x, y) < 100) {
      level = 1;
      background(255);
      speed = 5;
    }

    //Player Movement
    if (mouseX < px) px = px - 30;
    if (mouseX > px) px = px + 30;
    if (mouseY < py) py = py - 30;
    if (mouseY > py) py = py + 30;
  }
}