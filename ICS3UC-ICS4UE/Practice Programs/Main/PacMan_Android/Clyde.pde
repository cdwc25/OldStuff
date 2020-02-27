void clyde (int speed) {
  if (scaredmode == false) image (clyde, cx, cy, 30, 30);
  if (scaredmode == true) image (scared, cx, cy, 30, 30);

  //Collision Detection
  ci1 = get(cx, cy + 18); //Top Border
  ci2 = get(cx, cy - 18); //Bottom Border
  ci3 = get(cx + 18, cy); //Right Border
  ci4 = get(cx - 18, cy); //Left Border

  if (ci1 == -16744200) { 
    cy = cy - speed;
  }
  if (ci2 == -16744200) { 
    cy = cy + speed;
  }
  if (ci3 == -16744200) { 
    cx = cx - speed;
  }
  if (ci4 == -16744200) {
    cx = cx + speed;
  }
  if (cx > width) cx = 0;
  if (cx < 0) cx = width;

  //Movement
  if (ctargetx > cx) cx = cx + speed;
  if (ctargetx < cx) cx = cx - speed;
  if (ctargety > cy) cy = cy + speed;
  if (ctargety < cy) cy = cy - speed;
}

void updateClydeTarget () {
  //Target Helper
  ct1 = get(cx, cy + 18);
  ct2 = get(cx, cy - 18); 
  ct3 = get(cx + 18, cy); 
  ct4 = get(cx - 18, cy); 

  cd1 = round(dist(cx, cy + 22, round(random(0, width)), round(random(0, height))));
  cd2 = round(dist(cx, cy - 22, round(random(0, width)), round(random(0, height))));
  cd3 = round(dist(cx + 22, cy, round(random(0, width)), round(random(0, height))));
  cd4 = round(dist(cx - 22, cy, round(random(0, width)), round(random(0, height))));

  //Regular Movement
  if (scaredmode == false) {
    //Single Cases
    if (ct1 != -16744200 && cd1 < cd2 && cd1 < cd3 && cd1 < cd4) ctargety = cy + 30;
    if (ct2 != -16744200 && cd2 < cd1 && cd2 < cd3 && cd2 < cd4) ctargety = cy - 30;
    if (ct3 != -16744200 && cd3 < cd2 && cd3 < cd1 && cd3 < cd4) ctargetx = cx + 30;
    if (ct4 != -16744200 && cd4 < cd2 && cd4 < cd3 && cd4 < cd1) ctargetx = cx - 30;

    //Double Cases
    if (ct3 != -16744200 && ct4 != -16744200 && cd3 < cd4) ctargetx = cx + 130; //X
    if (ct3 != -16744200 && ct4 != -16744200 && cd4 < cd3) ctargetx = cx - 130; //X
    if (ct1 != -16744200 && ct2 != -16744200 && cd1 < cd2) ctargety = cy + 130; //Y
    if (ct1 != -16744200 && ct2 != -16744200 && cd2 < cd1) ctargety = cy - 130; //Y

    //Corners
    if (ct1 != -16744200 && ct3 != -16744200) ctargetx = cx + 100; // 1 and 3
    if (ct2 != -16744200 && ct3 != -16744200) ctargetx = cx + 100; // 2 and 3 
    if (ct1 != -16744200 && ct4 != -16744200) ctargetx = cx - 50;  // 1 and 4 
    if (ct2 != -16744200 && ct4 != -16744200) ctargetx = cx - 50;  // 2 and 4
  }

  //Scared Movement
  if (scaredmode == true) {
    //Single Cases
    if (ct1 != -16744200 && cd1 < cd2 && cd1 < cd3 && cd1 < cd4) ctargety = cy - 30;
    if (ct2 != -16744200 && cd2 < cd1 && cd2 < cd3 && cd2 < cd4) ctargety = cy + 30;
    if (ct3 != -16744200 && cd3 < cd2 && cd3 < cd1 && cd3 < cd4) ctargetx = cx - 30;
    if (ct4 != -16744200 && cd4 < cd2 && cd4 < cd3 && cd4 < cd1) ctargetx = cx + 30;

    //Double Cases
    if (ct3 != -16744200 && ct4 != -16744200 && cd3 < cd4) ctargetx = cx - 130; //X
    if (ct3 != -16744200 && ct4 != -16744200 && cd4 < cd3) ctargetx = cx + 130; //X
    if (ct1 != -16744200 && ct2 != -16744200 && cd1 < cd2) ctargety = cy - 130; //Y
    if (ct1 != -16744200 && ct2 != -16744200 && cd2 < cd1) ctargety = cy + 130; //Y

    //Corners
    if (ct1 != -16744200 && ct3 != -16744200) ctargetx = cx - 100; // 1 and 3
    if (ct2 != -16744200 && ct3 != -16744200) ctargetx = cx - 100; // 2 and 3 
    if (ct1 != -16744200 && ct4 != -16744200) ctargetx = cx + 50;  // 1 and 4 
    if (ct2 != -16744200 && ct4 != -16744200) ctargetx = cx + 50;  // 2 and 4
  }
}