class Car { 
  //Variables
  color c;
  float xpos;
  float ypos;
  float xspeed;

  //Constructor
  Car() { 
    c = color(random(0, 255), random(0, 255), random(0, 255));
    xpos = random(0, width);
    ypos = random(0, height);
    xspeed = random(-3, 3);
  }

  //Functions
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos, ypos, 20, 10);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) xpos = 0;
    if (xpos < 0) xpos = width;
  }
}