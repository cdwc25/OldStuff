//Connor Cerisano
//Started 10/20/2017
//Frogger Assignment

PImage background, frog, car, car2, truck, log, froggertitle, scenery, balloon; //Create Images
int level; //Level Switcher
int x, y; //Coords for player
int space; //Avoid Car Collisions
int arraysize = 5; //Just for ease of use
int getmousecolor; //To check if buttons are clicked
int lives = 3; //Lives System 
int timer; //Timer; Multiple Purposes

//Car Locations
int[] ux = new int[arraysize]; 
int[] uy = new int[arraysize]; 

//Left-Facing Car Locations
int[] ux2 = new int[arraysize]; 
int[] uy2 = new int[arraysize]; 

//Truck Locations
int[] ux3 = new int[arraysize]; 
int[] uy3 = new int[arraysize]; 

//Log Locations
int[] ux4 = new int[arraysize]; 
int[] uy4 = new int[arraysize]; 

//Car Lane Array
int[] carlane = new int[arraysize];

//Log Lanes Array
int[] loglane = new int[arraysize];

void setup () {
  //Setup
  size (600, 700);
  frameRate (60);
  rectMode (CENTER);
  imageMode (CENTER);

  loadImages();
  declareVariables();
  winsetup();
  assignObstacles();
}

void draw () {  
  //Level Handler (See Next Tab)
  levels();     
  if (level == 1) { //Main Game
    images();
    playerMovement();
    displayLives();
    moveEverything();
  }
}