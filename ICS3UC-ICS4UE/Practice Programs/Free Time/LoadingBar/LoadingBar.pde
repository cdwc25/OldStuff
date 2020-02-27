float l = 0;

void setup () {
  size (510,110);
  frameRate (60);
  smooth ();
  background (255);
}

void draw () {
 l = l + 2;
 
 if (l <= 490) 
 rect (10,10,l,20);
 else {
 rect (10,10,490,20);
 textSize (15);
 fill (0);
 text ("Done Loading!",30,90);
 }

}