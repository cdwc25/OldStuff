class Donut { 
  //Variables
  color c;
  float x;
  float y;
  float s;
  boolean v;

  //Constructor
  Donut(float xpos, float ypos, color colour, float size, boolean view) { 
    c = colour;
    x = xpos;
    y = ypos;
    s = size;
    v = view;
  }

  //Functions
  void display() { 
    if (v) {
      fill(c);
      image(donutimage, x, y, s, s);
    }
  }
}