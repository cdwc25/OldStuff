class Sky { 
  //Variables
  float x;
  float y;
  float s; //Length

  //Constructor
  Sky(float xpos, float ypos, float stretch) { 
    x = xpos;
    y = ypos;
    s = stretch;
  }

  //Functions
  void display() {
    fill(0, 131, 20);
    rect(x, y, brickwidth, brickwidth + s);
  }

  void move() { 
    x = x - 4;
    if (x < - brickwidth) { //Reset location if off-screen
      x = width + brickwidth;
      y = 0;
    }
  }
}