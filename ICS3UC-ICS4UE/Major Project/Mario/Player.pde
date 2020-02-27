void mario (float gstrength) {
  //Display Mario; GREEN GRAVITY
  if (alive == true & g == false & isRunning == false & onGround == true) image(mi, mx, my, 47, 50);
  if (alive == true & g == false & onGround == false) image(mj, mx, my, 47, 50);
  if (alive == true & g == false & onGround == true & isRunning == true & keys[2]) image(mR, mx, my, 47, 50);
  if (alive == true & g == false & onGround == true & isRunning == true & keys[1]) image(mR2, mx, my, 47, 50);

  //Display Mario; RED GRAVITY
  if (alive == true & g == true & isRunning == false & onSky == true) image(mi2, mx, my, 47, 50);
  if (alive == true & g == true & onSky == false) image(mj2, mx, my, 47, 50);
  if (alive == true & g == true & onSky == true & isRunning == true & keys[2]) image(mRU, mx, my, 47, 50);
  if (alive == true & g == true & onSky == true & isRunning == true & keys[1]) image(mR2U, mx, my, 47, 50);

  //Gravity "Decider"
  if (my < height / 2) { 
    g = true;
    onGround = false;
  }
  if (my > height / 2) { 
    g = false;
    onSky = false;
  }

  //Collision Detection
  if (alive == true) {
    c1 = get((round(mx - 5)), round(my + 20));
    c2 = get((round(mx + 57)), round(my + 25));
    c3 = get((round(mx + 25)), round(my - 9));
    c4 = get((round(mx + 25)), round(my + 54));
  }

  if (alive == false) {
    c1 = get((round(mx - 999)), round(my + 999));
    c2 = get((round(mx + 999)), round(my + 999));
    c3 = get((round(mx + 999)), round(my - 999));
    c4 = get((round(mx + 999)), round(my + 999));
  }
  //Above Mario
  if (c3 != #D96151 && c3 != #7FA983 & c3 != 0) {
    gravity = 0;
    isRunning = false;
    onSky = true;
  }
  //Below Mario
  if (c4 != #D96151 && c4 != #7FA983 & c4 != 0) {
    gravity = 0;
    isRunning = false;
    onGround = true;
  }

  //Movement Logistics
  mx = mx - di; //Always move faster then screen speed
  if (keys[0] && g == true & onSky == true) {
    gravity = 11.3;
    gravtimer = 0;
    onSky = false;
  }
  if (keys[0] && g == false & onGround == true) {
    gravity = -11.3;
    gravtimer = 0;
    onGround = false;
  }
  if (keys[2]) {
    mx = mx + di + 2;
    isRunning = true;
  }
  if (keys[1]) {
    mx = mx - 3;
    isRunning = true;
  }

  //Don't go off-screen
  if (mx >= width) mx = mx - 3;
  if (mx < 0) mx = mx + di;

  //Gravity
  gravtimer++;
  my = my + gravity;
  if (gravtimer > 1 && g == true) gravity = gravity - gstrength; //Green Gravity
  if (gravtimer > 1 && g == false) gravity = gravity + gstrength; //Red Gravity
}

//Multi-directional Movement
void keyPressed() {
  if (key == 'W' || key == 'w') {
    keys[0] = true;
  }
  if (key == 'd' || key == 'D') {
    keys[2] = true;
  } 
  if (key == 'a' || key == 'A') {
    keys[1] = true;
  }
}

void keyReleased() {
  if (key == 'W' || key == 'w') {
    keys[0] = false;
  }
  if (key == 'd' || key == 'D') {
    keys[2] = false;
  } 
  if (key == 'a' || key == 'A') {
    keys[1] = false;
  }
}