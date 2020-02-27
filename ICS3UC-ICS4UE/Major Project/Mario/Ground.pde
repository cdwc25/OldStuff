class Ground { 
  //Variables
  float x;
  float y;

  //Constructor
  Ground(float xpos, float ypos) { 
    x = xpos;
    y = ypos;
  }

  //Functions
  void display() {
    image(ground, x, y, 50, 50);
  }
  void move() { 
    //Respawn if off-screen
    if (x >= width + 50) x = -50;
    if (x <= -50) x = width + 50;
    //Move ground according to Difficulty
    x = x - di;
  }
  void title () {
    //Respawn if off-screen
    if (x >= width + 50) x = -50;
    if (x <= -50) x = width + 50;
    x = x - 1.2;
  }
}