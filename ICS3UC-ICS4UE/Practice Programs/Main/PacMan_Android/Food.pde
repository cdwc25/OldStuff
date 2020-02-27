void drawFoodSetup() {
  for (int i=0; i < arraysize; i++) {
    //Draw Food
    counterX = counterX + 50;

    if (counterX > width) {
      counterX = 50;
      counterY = counterY + 49;
    }

    fX[i] = counterX;
    fY[i] = counterY;
  }
}

void drawFood (color foodColor) {
  for (int i=0; i < arraysize; i++) {
    fill(foodColor);
    ellipse(fX[i], fY[i], 4, 4);

    //Food Color Collision (Don't draw out of map)
    fC1[i] = get(fX[i] + 6, fY[i]);
    fC2[i] = get(fX[i] - 6, fY[i]);
    fC3[i] = get(fX[i], fY[i] + 6);
    fC4[i] = get(fX[i], fY[i] - 6);

    if (fC1[i] == -16744200 && fC2[i] == -16744200 && fC3[i] == -16744200 && fC4[i] == -16744200) fX[i] = -10; //Don't draw regular pellets out of map

    //Score and Food Eating
    textSize(20);
    text("Score:", 20, 20);
    text(score, 104, 20);
    text("Lives:", width / 2 + 100, 20);
    text(lives, width / 2 + 173, 20);
    if (dist(x, y, fX[i], fY[i]) < 15) {
      fX[i] = -10;
      score = score + 123;
    }

    //-------POWER PELLETS AND SCARED MODE FOR GHOSTS-------//
    if (i == RPL1) ellipse(fX[RPL1], fY[RPL1], 12, 12);
    if (i == RPL2) ellipse(fX[RPL2], fY[RPL2], 12, 12);
    if (i == RPL3) ellipse(fX[RPL3], fY[RPL3], 12, 12);
    if (i == RPL4) ellipse(fX[RPL4], fY[RPL4], 12, 12);

    //Collision for Power Pellets
    if (dist(x, y, fX[RPL1], fY[RPL1]) < 15) scaredmode = true;
    if (dist(x, y, fX[RPL2], fY[RPL2]) < 15) scaredmode = true;
    if (dist(x, y, fX[RPL3], fY[RPL3]) < 15) scaredmode = true;
    if (dist(x, y, fX[RPL4], fY[RPL4]) < 15) scaredmode = true;

    //Scaredmode Logic
    if (scaredmode == true) scaredmodetimer++;
    if (scaredmodetimer > 25000) { 
      scaredmode = false;
      scaredmodetimer = 0;
    }

    //Reset Ghosts after being killed
    if (iy <=0) killedInky++;
    if (by <=0) killedBlinky++;
    if (py <=0) killedPinky++;
    if (cy <=0) killedClyde++;

    if (killedInky > 20000) {
      ix = width / 2;
      iy = height / 2 - 50;
      targetx = ix;
      targety = iy;
      killedInky = 0;
    }

    if (killedBlinky > 20000) {
      bx = width / 2;
      by = height / 2 - 50;
      btargetx = ix;
      btargety = iy;
      killedBlinky = 0;
    }

    if (killedPinky > 20000) {
      px = width / 2;
      py = height / 2 - 50;
      ptargetx = px;
      ptargety = py;
      killedPinky=0;
    }

    if (killedClyde > 20000) {
      cx = width / 2;
      cy = height / 2 - 50;
      ctargetx = cx;
      ctargety = cy;
      killedClyde = 0;
    }
  }
}