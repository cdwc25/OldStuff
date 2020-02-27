void obstacles() {
  //Time Alive
  textFont(gui, 15);
  fill(255);
  text("Time Alive:", 30, 36);
  text(score / 10, 190, 36);
  if (alive == true) score = score + 0.15;

  //Bullet Bills
  if (di >= 5) {
    for (int i=0; i < 3; i++) {
      image(bullet, sx2[i], sy2[i], 40, 35); //Display
      sx2[i] = sx2[i] - di - 2; //Move
      if (dist(sx2[i], sy2[i], mx, my) < 30 & alive == true) { //Collision
        alive = false;
        gravity = -11;
      }
      if (sx2[i] < -500) { //Don't go off-screen
        sx2[i] = width + random(100, 200);
        sy2[i] = random(100, 400);
      }
    }
  }

  //Spinies
  if (di >= 3) {
    image(spiny_u, sx3, sy3, 40, 40); //Sky
    sx3 = sx3 - di - 1; //Move
    if (sx3 < -500) { //Don't go off-screen
      sx3 = width + random(100, 200);
      sy3 = 100;
    }
    image(spiny, sx4, sy4, 40, 40); //Ground
    sx4 = sx4 - di - 1; //Move
    if (sx4 < -500) { //Don't go off-screen
      sx4 = width + random(500, 50);
      sy4 = 464;
    }
  }

  //Spikes
  for (int i=0; i < 3; i++) {
    image(spike, sx[i], sy[i], 50, 50); //Display
    if (dist(sx[i], sy[i], mx, my) < 30 & alive == true) { //Collision
      alive = false;
      gravity = -11;
    }
    sx[i] = sx[i] - di; //Move
    if (sx[i] < -100) { //Don't go off-screen
      sx[i] = width + 100;
      sy[i] = round(random(150, 400));
    }
  }

  //Exit Condition Logic
  if (dist(mx, my, sx3, sy3) < 20 & alive == true) {
    alive = false;
    gravity = -11;
  }
  if (dist(mx, my, sx4, sy4) < 20 & alive == true) {
    alive = false;
    gravity = -11;
  }
  if (alive == false) {
    image(md, mx, my, 47, 50);
    gravity = gravity + 0.7;
    keys[0] = false;
    keys[1] = false;
    keys[2] = false;
  }
  if (my > height) {
    level = 3; 
    d = 0;
  }
}