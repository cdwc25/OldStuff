void player () {
  //Player
  fill (255, 248, 13);
  ellipse (x, y, 20, 20);

  //Collision Detection
  c1 = get(x, y + 12);
  c2 = get(x, y - 12);
  c3 = get(x + 12, y);
  c4 = get(x - 12, y);
  if (c1 == -16744200) y = y - 2;
  if (c2 == -16744200) y = y + 2;
  if (c3 == -16744200) x = x - 2;
  if (c4 == -16744200) x = x + 2;

  //Movement
  if (key == 'w' || key == 'W') y = y - 2;
  if (key == 'a' || key == 'A') x = x - 2;
  if (key == 's' || key == 'S') y = y + 2;
  if (key == 'd' || key == 'D') x = x + 2;
  if (x > width) x = 0;
  if (x < 0) x = width;

  //Exit Condition
  if (dist(x, y, ix, iy) < 10) exit();
  if (dist(x, y, bx, by) < 10) exit();
}