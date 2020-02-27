//Connor Cerisano
//Mini-Assignment
//Started on 12/13/2017

int arraysize = 40; //Universal Array Size

int c1, c2, c3, c4; //Collision for Helicopter
PImage hc; //Helicopter Picture
float hx, hy; //Helicopter Coordinates
float gravity = -1.5, gravtimer; //Gravity Variables

int counter, brickwidth; //Space out the ground
int hills, hills2, hillcounter; //Hill Effect
boolean r1, r2; //Reverse the Hills (So that they don't go too high or too low)

//Classes
Sky S[] = new Sky[arraysize];
Ground G[] = new Ground[arraysize];
Bar B[] = new Bar[1];

void setup () {
  size(680, 670);
  frameRate(60);
  noStroke();
  imageMode(CENTER);

  hc = loadImage("helicopter.png");
  hx = width / 2;
  hy = height / 2;
  brickwidth = 28;

  //Call Classes
  for (int i=0; i < arraysize; i++) {
    S[i] = new Sky(counter, 0, hills);
    G[i] = new Ground(counter, height, hills2);

    //Hill System
    counter = counter + brickwidth;
    hillcounter++;
    if (hills > 170) r1 = true;
    if (hills2 > 210) r2 = true;
    if (r1 == false) hills = hills + 10;
    if (r1 == true) hills = hills - 10;
    if (r2 == false) hills2 = hills2 + 10;
    if (r2 == true) hills2 = hills2 - 10;
    if (hillcounter > 1000) {
      r1 = false;
      r2 = true;
      hillcounter= 0;
    }
  }

  //Call Obstacle (This is seperate because we only need one!)
  for (int i=0; i < 1; i++) {
    B[i] = new Bar(width + 40, height / 2, 120, 0);
  }
}

void draw () {
  background(112, 223, 255);

  //Ground and Sky Handler
  for (int i=0; i < arraysize; i++) {
    S[i].display();
    S[i].move();
    G[i].display();
    G[i].move();
  }

  //Obstacle Handler (This is seperate because we only need one!)
  for (int i=0; i < 1; i++) {
    B[i].display();
    B[i].move();
  }

  //Player
  image(hc, hx, hy, 100, 40);
  if (c1 == -16743660 || c2 == -16743660 || c3 == -16743660 || c4 == -16743660) exit(); //Lose Condition
  if (keyPressed) {
    if (key == 'W' || key == 'w') {
      gravity = -3.3;
      gravtimer = 0;
    }
    if (key == 'A' || key == 'a') hx = hx - 2;
    if (key == 'D' || key == 'd') hx = hx + 2;
  }

  //Gravity
  gravtimer++;
  hy = hy + gravity;
  if (gravtimer > 1) {
    gravity = gravity + 0.12;
  }

  //Collision Detection
  c1 = get(round(hx + 35), round(hy));
  c2 = get(round(hx - 35), round(hy));
  c3 = get(round(hx), round(hy + 35));
  c4 = get(round(hx), round(hy - 35));

  //Don't go off screen
  if (hx > width) hx = hx - 2;
  if (hx < 0) hx = hx + 2;
}