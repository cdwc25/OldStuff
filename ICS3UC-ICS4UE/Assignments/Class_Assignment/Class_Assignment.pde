int arraysize = 100; //Universal Array Size
int counter; //Counter for Zoog
int md; //Mouse Delay
color[] c1 = new color[arraysize];
color[] c2 = new color[arraysize];
color[] c3 = new color[arraysize];

//Classes
Zoog Z[] = new Zoog[arraysize];

void setup () {
  size (500, 500);
  frameRate(60);
  smooth();
  //noStroke();
  ellipseMode (CENTER);
  rectMode (CENTER);

  for (int i=0; i < arraysize; i++) {
    randomize(); //Randomize Zoog Colors

    //Create Zoogs
    Z[i] = new Zoog(100, -1000, c1[i], c2[i], c3[i], 1);
  }
}

void draw () {
  background (23, 112, 232);
  md++; //If mouse is not pressed, increase

  //Debug
  text(md, 20, 20);
  text(counter, 20, 40);

  for (int i=0; i < arraysize; i++) { //Display and Move Zoogs
    Z[i].display();
    Z[i].move();

    if (mousePressed) {
      if (mouseButton == LEFT & md > 10) { //Reset mousedelay, change affected zoog
        counter = counter + 1;
        Z[counter].locate();
        md = 0;
      }
    }
  }
}

void randomize() {
  for (int i=0; i < arraysize; i++) {
    //Randomize Color
    c1[i] = color(random(0, 255), random(0, 255), random(0, 255));
    c2[i] = color(random(0, 255), random(0, 255), random(0, 255));
    c3[i] = color(random(0, 255), random(0, 255), random(0, 255));
  }
}