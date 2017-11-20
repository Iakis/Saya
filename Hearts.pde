class Heart {

  int rad = 20;
  float xpos;
  float ypos;
  int xdirection = -1;
  int ydirection = 1;
  int n;
  PImage[] imgn = new PImage[4];
  float xspeed = 5;
  float yspeed = 4;

  Heart (int b) {
    xpos = random(0, 400);
    ypos = random(0, 400);
    n = b;
    for (int i = 0; i < 4; i++)
    {
      imgn[i] = loadImage("soul" + nf(i+1, 1) + ".png");
    }
  }

  void move ()
  {
    xpos = xpos + (xspeed * xdirection);
    ypos = ypos + (yspeed * ydirection);

    if (xpos + 50 > width - rad || xpos + 50 < 0) {
      xdirection *= -1;
      if (xpos > 300) {
        xpos -= 2;
      } else {
        xpos += 2;
      }
      xspeed = random (4, 6);
      yspeed = random (4, 6);
    }

    if (ypos + 50 > width - rad || ypos + 50 < 0) {
      ydirection *= -1;
      if (ypos > 300) {
        ypos -= 2;
      } else {
        ypos += 2;
      }
      xspeed = random (2, 4);
      yspeed = random (2, 4);
    }
  }

  void display()
  {
    image (imgn[n-1], xpos, ypos);
  }


  void caught() {
    sfx[0].play();
    sfx[0].rewind();
    xspeed = 0;
    yspeed = 0; 
    ypos = - 1000;
  }
}

