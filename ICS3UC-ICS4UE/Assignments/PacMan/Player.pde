void player (int speed) {
  //Player
  fill (255, 248, 13);

  //Collision Detection
  c1 = get(x, y + 12);
  c2 = get(x, y - 12);
  c3 = get(x + 12, y);
  c4 = get(x - 12, y);
  if (c1 == -16744200) y = y - speed;
  if (c2 == -16744200) y = y + speed;
  if (c3 == -16744200) x = x - speed;
  if (c4 == -16744200) x = x + speed;

  //Movement
  if (key == 'w' || key == 'W') { 
    y = y - speed;
    arc(x, y, 20, 20, radians(-60), radians(240));
  }
  if (key == 'a' || key == 'A') { 
    x = x - speed;
    arc(x, y, 20, 20, radians(215), radians(505));
  }
  if (key == 's' || key == 'S') { 
    y = y + speed;
    arc(x, y, 20, 20, radians(130), radians(410));
  }
  if (key == 'd' || key == 'D') { 
    x = x + speed;
    arc(x, y, 20, 20, HALF_PI - 1, PI + HALF_PI + 1);
  }
  if (x > width) x = 0;
  if (x < 0) x = width;

  //Player Hits Ghost
  if (scaredmode == true) {
    if (dist(x, y, ix, iy) < 10) {
      ix = -10;
      iy = -9990;
      targetx = ix;
      targety = iy;
      score = score + 500;
    }
    if (dist(x, y, bx, by) < 10) {
      bx = -10;
      by = -9990;
      btargetx = ix;
      btargety = iy;
      score = score + 500;
    }
    if (dist(x, y, px, py) < 10) {
      px = -10;
      py = -9990;
      ptargetx = px;
      ptargety = py;
      score = score + 500;
    }
    if (dist(x, y, cx, cy) < 10) {
      cx = -10;
      cy = -9990;
      ctargetx = cx;
      ctargety = cy;
      score = score + 500;
    }
  }

  //Exit Conditions (Score and Ghosts)
  if (scaredmode == false) {
    if (dist(x, y, ix, iy) < 10) level = 2;
    if (dist(x, y, bx, by) < 10) level = 2;
    if (dist(x, y, px, py) < 10) level = 2;
    if (dist(x, y, cx, cy) < 10) level = 2;
  }
  if (score >= 8500) level = 4;
}