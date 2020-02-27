class Bar { 
  //Variables
  float x;
  float y;
  float s; //Length
  int sc; //Score

  //Constructor
  Bar(float xpos, float ypos, float stretch, int score) { 
    x = xpos;
    y = ypos;
    s = stretch;
    sc = score;
  }

  //Functions
  void display() {
    fill(0, 131, 20);
    rect(x, y, 40, s);

    //Score
    fill(255, 255, 255);
    textSize(30);
    text("Score:", 20, 40);
    text(sc, 120, 40);
  }

  void move() { 
    x = x - 4;

    //Score
    if (x == hx) sc = sc + 1; 

    //Reset and Randomize Location
    if (x < - 40) {
      x = width + 40;
      y = random(190, height - 340);
    }
  }
}