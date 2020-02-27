class Zoog { 
  //Variables
  float x;
  float y;
  int ec;
  int bc;
  int fc;
  float s;


  //Constructor
  Zoog(float xpos, float ypos, int eyecolor, int bodycolor, int facecolor, float speed) { 
    x = xpos;
    y = ypos;
    ec = eyecolor;
    bc = bodycolor;
    fc = facecolor;
    s = speed;
  }

  //Functions
  void display() {
    //Zoog's Body
    stroke (0);
    fill (bc);
    rect (x, y, 20, 100);

    //Zoog's Head
    fill (fc);
    ellipse (x, y-30, 60, 60);

    //Zoog's Eyes
    fill (ec);
    ellipse (x-20, y-30, 16, 32);
    ellipse (x+20, y-30, 16, 32);

    //Zoog's Legs
    stroke (0);
    line (x-10, y+45, x-15, y + 70);
    line (x+10, y+45, x+15, y + 70);
  }

  void move() { 
    //Respawn if off-screen
    if (x > width + 50) x = -50;
    if (x < -50) x = width + 50;

    //Move 
    x = x + s;
  }

  void locate() {
    //Move Zoog to mouse location
    x = mouseX;
    y = mouseY;
  }
}