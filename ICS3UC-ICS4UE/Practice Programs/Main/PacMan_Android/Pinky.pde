void pinky (int speed) {
  if (scaredmode == false) image (pinky, px, py, 30, 30);
  if (scaredmode == true) image (scared, px, py, 30, 30);

  //Collision Detection
  p1 = get(px, py + 18); //Top Border
  p2 = get(px, py - 18); //Bottom Border
  p3 = get(px + 18, py); //Right Border
  p4 = get(px - 18, py); //Left Border

  if (p1 == -16744200) { 
    py = py - speed;
  }
  if (p2 == -16744200) { 
    py = py + speed;
  }
  if (p3 == -16744200) { 
    px = px - speed;
  }
  if (p4 == -16744200) {
    px = px + speed;
  }
  if (px > width) px = 0;
  if (px < 0) px = width;

  //Movement
  if (ptargetx > px) px = px + speed;
  if (ptargetx < px) px = px - speed;
  if (ptargety > py) py = py + speed;
  if (ptargety < py) py = py - speed;
}

void updatePinkyTarget () {
  //Target Helper
  pt1 = get(px, py + 18);
  pt2 = get(px, py - 18); 
  pt3 = get(px + 18, py); 
  pt4 = get(px - 18, py); 

  pd1 = round(dist(px, py + 22, cx, cy));
  pd2 = round(dist(px, py - 22, cx, cy));
  pd3 = round(dist(px + 22, py, cx, cy));
  pd4 = round(dist(px - 22, py, cx, cy));

  //Regular Movement
  if (scaredmode == false) {
    //Single Cases
    if (pt1 != -16744200 && pd1 < pd2 && pd1 < pd3 && pd1 < pd4) ptargety = py + 30;
    if (pt2 != -16744200 && pd2 < pd1 && pd2 < pd3 && pd2 < pd4) ptargety = py - 30;
    if (pt3 != -16744200 && pd3 < pd2 && pd3 < pd1 && pd3 < pd4) ptargetx = px + 30;
    if (pt4 != -16744200 && pd4 < pd2 && pd4 < pd3 && pd4 < pd1) ptargetx = px - 30;

    //Double Cases
    if (pt3 != -16744200 && pt4 != -16744200 && pd3 < pd4) ptargetx = px + 130; //X
    if (pt3 != -16744200 && pt4 != -16744200 && pd4 < pd3) ptargetx = px - 130; //X
    if (pt1 != -16744200 && pt2 != -16744200 && pd1 < pd2) ptargety = py + 130; //Y
    if (pt1 != -16744200 && pt2 != -16744200 && pd2 < pd1) ptargety = py - 130; //Y

    //Corners
    if (pt1 != -16744200 && pt3 != -16744200) ptargetx = px + 100; // 1 and 3
    if (pt2 != -16744200 && pt3 != -16744200) ptargetx = px + 100; // 2 and 3 
    if (pt1 != -16744200 && pt4 != -16744200) ptargetx = px - 50;  // 1 and 4 
    if (pt2 != -16744200 && pt4 != -16744200) ptargetx = px - 50;  // 2 and 4
  }

  if (scaredmode == true) {
    //Single Cases
    if (pt1 != -16744200 && pd1 < pd2 && pd1 < pd3 && pd1 < pd4) ptargety = py - 30;
    if (pt2 != -16744200 && pd2 < pd1 && pd2 < pd3 && pd2 < pd4) ptargety = py + 30;
    if (pt3 != -16744200 && pd3 < pd2 && pd3 < pd1 && pd3 < pd4) ptargetx = px - 30;
    if (pt4 != -16744200 && pd4 < pd2 && pd4 < pd3 && pd4 < pd1) ptargetx = px + 30;

    //Double Cases
    if (pt3 != -16744200 && pt4 != -16744200 && pd3 < pd4) ptargetx = px - 130; //X
    if (pt3 != -16744200 && pt4 != -16744200 && pd4 < pd3) ptargetx = px + 130; //X
    if (pt1 != -16744200 && pt2 != -16744200 && pd1 < pd2) ptargety = py - 130; //Y
    if (pt1 != -16744200 && pt2 != -16744200 && pd2 < pd1) ptargety = py + 130; //Y

    //Corners
    if (pt1 != -16744200 && pt3 != -16744200) ptargetx = px - 100; // 1 and 3
    if (pt2 != -16744200 && pt3 != -16744200) ptargetx = px - 100; // 2 and 3 
    if (pt1 != -16744200 && pt4 != -16744200) ptargetx = px + 50;  // 1 and 4 
    if (pt2 != -16744200 && pt4 != -16744200) ptargetx = px + 50;  // 2 and 4
  }
}