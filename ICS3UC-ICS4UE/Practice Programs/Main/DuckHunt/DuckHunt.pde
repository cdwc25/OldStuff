int arraysize = 10;
PImage reticle, duckleft, duckright;
int shot;
int level;
int getmousecolor;

Duck d[] = new Duck[arraysize];

void setup() {
  size(680, 670);
  frameRate(60);
  noStroke();
  imageMode(CENTER);
  reticle = loadImage("reticle.png");
  duckright = loadImage("duckright.png");
  duckleft = loadImage("duckleft.png");
  level = 0;

  for (int i=0; i < arraysize; i++) {
    d[i] = new Duck(random(0, width), random(0, height), random(1, 3), true, round(random(0, 1)));
  }
}

void draw() {
  if (level == 0) {
    getmousecolor = get (mouseX, mouseY); 
    background (255);

    //Text
    textSize (120);
    fill(255, 0, 0);
    text ("Start Game", width / 2 - 60, height / 2 - 65);

    //Button
    fill (0, 255, 0);
    rect (width / 2 + 10, 380, width / 2 - 40, 100);

    //Start Game
    if (mousePressed && mouseY >= 450 && getmousecolor ==-16711936) level = 1;
  }

  if (level == 1) {
    background(255);

    for (int i=0; i < arraysize; i++) {
      d[i].display();
      d[i].move();

      //Collision Detection
      if (dist(d[i].x, d[i].y, mouseX, mouseY) < 20 & mousePressed == true) {
        d[i].v=false;
        d[i].x = -1000;
        shot++;
      }

      if (shot >= arraysize) level = 0;
      image(reticle, mouseX, mouseY, 50, 50);
    }
  }
}

class Duck { 
  //Variables
  float x;
  float y;
  float s;
  boolean v;
  int d;

  //Constructor
  Duck(float xpos, float ypos, float speed, boolean view, int direction) { 
    x = xpos;
    y = ypos;
    s = speed;
    v = view;
    d = direction;
  }

  //Functions
  void display() { 
    if (v == true & d == 0) image(duckright, x, y, 50, 40);
    if (v == true & d == 1) image(duckleft, x, y, 50, 40);
  }

  void move() { 
    y = y - s;
    if (d == 0) x++;
    if (d == 1) x--;

    if (x > width) d = 1;
    if (x < 0) d = 0;
    if (y < 0) y = height;
  }
}