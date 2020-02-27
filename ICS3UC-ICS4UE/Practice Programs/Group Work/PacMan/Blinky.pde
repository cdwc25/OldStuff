void blinky () {
  image (blinky, bx, by, 30, 30);

  //Collision Detection
  b1 = get(bx, by + 18); //Top Border
  b2 = get(bx, by - 18); //Bottom Border
  b3 = get(bx + 18, by); //Right Border
  b4 = get(bx - 18, by); //Left Border

  if (b1 == -16744200) { 
    by = by - 2;
    timer++;
  }
  if (b2 == -16744200) { 
    by = by + 2;
    timer++;
  }
  if (b3 == -16744200) { 
    bx = bx - 2;
    timer++;
  }
  if (b4 == -16744200) {
    bx = bx + 2;
    timer++;
  }
  if (bx > width) bx = 0;
  if (bx < 0) bx = width;

  //Movement
  if (btargetx > bx) bx = bx + 2;
  if (btargetx < bx) bx = bx - 2;
  if (btargety > by) by = by + 2;
  if (btargety < by) by = by - 2;
}

void updateBlinkyTarget () {
  //Target Helper
  bt1 = get(bx, by + 18);
  bt2 = get(bx, by - 18); 
  bt3 = get(bx + 18, by); 
  bt4 = get(bx - 18, by); 

  bd1 = round(dist(bx, by + 18, x, y));
  bd2 = round(dist(bx, by - 18, x, y));
  bd3 = round(dist(bx + 18, by, x, y));
  bd4 = round(dist(bx - 18, by, x, y));

  //Calculate Distances, Move Accordingly
  //Single Cases
  if (bt1 != -16744200 && bd1 < bd2 && bd1 < bd3 && bd1 < bd4) btargety = by + 25;
  if (bt2 != -16744200 && bd2 < bd1 && bd2 < bd3 && bd2 < bd4) btargety = by - 25;
  if (bt3 != -16744200 && bd3 < bd2 && bd3 < bd1 && bd3 < bd4) btargetx = bx + 100;
  if (bt4 != -16744200 && bd4 < bd2 && bd4 < bd3 && bd4 < bd1) btargetx = bx - 100;

  //Double Cases
  if (bt3 != -16744200 && bt4 != -16744200 && bd3 < bd4) btargetx = bx + 150; //X
  if (bt3 != -16744200 && bt4 != -16744200 && bd4 < bd3) btargetx = bx - 150; //X
  if (bt1 != -16744200 && bt2 != -16744200 && bd1 < bd2) btargety = by + 100; //Y
  if (bt1 != -16744200 && bt2 != -16744200 && bd2 < bd1) btargety = by - 100; //Y

  //Corners
  if (bt1 != -16744200 && bt3 != -16744200) btargetx = bx + 100; // 1 and 3
  if (bt2 != -16744200 && bt3 != -16744200) btargetx = bx + 100; // 2 and 3 
  if (bt1 != -16744200 && bt4 != -16744200) btargetx = bx - 50; // 1 and 4 
  if (bt2 != -16744200 && bt4 != -16744200) btargetx = bx - 50; // 2 and 4

  //If close, target directly
  if (dist(bx, by, x, y) < 90) { 
    btargetx = x;
    btargety = y;
  }
}