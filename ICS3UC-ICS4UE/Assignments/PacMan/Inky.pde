void inky (int speed) {
  if (scaredmode == false) image (inky, ix, iy, 30, 30);
  if (scaredmode == true) image (scared, ix, iy, 30, 30);

  //Collision Detection
  i1 = get(ix, iy + 18); //Top Border
  i2 = get(ix, iy - 18); //Bottom Border
  i3 = get(ix + 18, iy); //Right Border
  i4 = get(ix - 18, iy); //Left Border

  if (i1 == -16744200) { 
    iy = iy - speed;
  }
  if (i2 == -16744200) { 
    iy = iy + speed;
  }
  if (i3 == -16744200) { 
    ix = ix - speed;
  }
  if (i4 == -16744200) {
    ix = ix + speed;
  }
  if (ix > width) ix = 0;
  if (ix < 0) ix = width;

  //Movement
  if (targetx > ix) ix = ix + speed;
  if (targetx < ix) ix = ix - speed;
  if (targety > iy) iy = iy + speed;
  if (targety < iy) iy = iy - speed;
}

void updateInkyTarget () {
  //Target Helper
  t1 = get(ix, iy + 18);
  t2 = get(ix, iy - 18); 
  t3 = get(ix + 18, iy); 
  t4 = get(ix - 18, iy); 

  d1 = round(dist(ix, iy + 22, bx, by));
  d2 = round(dist(ix, iy - 22, bx, by));
  d3 = round(dist(ix + 22, iy, bx, by));
  d4 = round(dist(ix - 22, iy, bx, by));

  //Regular Movement
  if (scaredmode == false) {
    //Single Cases
    if (t1 != -16744200 && d1 < d2 && d1 < d3 && d1 < d4) targety = iy + 30;
    if (t2 != -16744200 && d2 < d1 && d2 < d3 && d2 < d4) targety = iy - 30;
    if (t3 != -16744200 && d3 < d2 && d3 < d1 && d3 < d4) targetx = ix + 30;
    if (t4 != -16744200 && d4 < d2 && d4 < d3 && d4 < d1) targetx = ix - 30;

    //Double Cases
    if (t3 != -16744200 && t4 != -16744200 && d3 < d4) targetx = ix + 130; //X
    if (t3 != -16744200 && t4 != -16744200 && d4 < d3) targetx = ix - 130; //X
    if (t1 != -16744200 && t2 != -16744200 && d1 < d2) targety = iy + 130; //Y
    if (t1 != -16744200 && t2 != -16744200 && d2 < d1) targety = iy - 130; //Y

    //Corners
    if (t1 != -16744200 && t3 != -16744200) targetx = ix + 100; // 1 and 3
    if (t2 != -16744200 && t3 != -16744200) targetx = ix + 100; // 2 and 3 
    if (t1 != -16744200 && t4 != -16744200) targetx = ix - 50;  // 1 and 4 
    if (t2 != -16744200 && t4 != -16744200) targetx = ix - 50;  // 2 and 4
  }

  //Scared Movement
  if (scaredmode == true) {
    //Single Cases
    if (t1 != -16744200 && d1 < d2 && d1 < d3 && d1 < d4) targety = iy - 30;
    if (t2 != -16744200 && d2 < d1 && d2 < d3 && d2 < d4) targety = iy + 30;
    if (t3 != -16744200 && d3 < d2 && d3 < d1 && d3 < d4) targetx = ix - 30;
    if (t4 != -16744200 && d4 < d2 && d4 < d3 && d4 < d1) targetx = ix + 30;

    //Double Cases
    if (t3 != -16744200 && t4 != -16744200 && d3 < d4) targetx = ix - 130; //X
    if (t3 != -16744200 && t4 != -16744200 && d4 < d3) targetx = ix + 130; //X
    if (t1 != -16744200 && t2 != -16744200 && d1 < d2) targety = iy - 130; //Y
    if (t1 != -16744200 && t2 != -16744200 && d2 < d1) targety = iy + 130; //Y

    //Corners
    if (t1 != -16744200 && t3 != -16744200) targetx = ix - 100; // 1 and 3
    if (t2 != -16744200 && t3 != -16744200) targetx = ix - 100; // 2 and 3 
    if (t1 != -16744200 && t4 != -16744200) targetx = ix + 50;  // 1 and 4 
    if (t2 != -16744200 && t4 != -16744200) targetx = ix + 50;  // 2 and 4
  }
}