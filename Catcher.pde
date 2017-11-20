
PImage[] images1 = new PImage[3]; 
PImage[] images2 = new PImage[3]; 
PImage[] images3 = new PImage[3]; 
PImage[] images4 = new PImage[3]; 
int counter; 
final int DISPLAY_TIME = 300; 
int lastTime1; 
PImage last;
float speed = 3.5;
float temps = speed;

class Catcher {
  float r = 10;   
  float x = 475;
  float y = 475; 


  Catcher() {
    for (int i = 0; i < 3; i++)
    {
      images1[i] = loadImage("up" + nf(i+1, 1) + ".png"); 
      images2[i] = loadImage("left" + nf(i+1, 1) + ".png"); 
      images3[i] = loadImage("down" + nf(i+1, 1) + ".png"); 
      images4[i] = loadImage("right" + nf(i+1, 1) + ".png");
      last = loadImage("down1.png");
    }
    lastTime1 = millis();
  }

  void display() {
    if (x > 490) {
      right = 0;
      speed = 0;
      x -= 1;
    } 
    if (y > 490) {
      down = 0;
      speed = 0;
      y -= 1;
    } 
    if (x < 25) {
      left = 0;
      speed = 0;
      x += 1;
    } 
    if (y < 40) {
      up = 0;
      speed = 0;
      y += 1;
    } 
    x += (right - left) * speed;
    y += (down - up) * speed;

    if (left > right && up == 0 && down == 0) {
      speed = temps;
      if (millis() - lastTime1 >= DISPLAY_TIME)
      {
        counter = ++counter % 2;
        lastTime1 = millis();
      }
      image(images2[counter + 1], x - 33, y - 40);
      last = images2[0];
    }
    if (right > left && up == 0 && down == 0) {
      speed = temps;
      if (millis() - lastTime1 >= DISPLAY_TIME)
      {
        counter = ++counter % 2;
        lastTime1 = millis();
      }
      image(images4[counter + 1], x - 33, y - 40);
      last = images4[0];
    }
    if (down < up || (up == 1 && down == 1)) {
      speed = temps;
      if (millis() - lastTime1 >= DISPLAY_TIME)
      {
        counter = ++counter % 2;
        lastTime1 = millis();
      }
      image(images1[counter + 1], x - 33, y - 40);
      last = images1[0];
    }
    if (down > up || (left == 1 && right == 1)) {
      speed = temps;
      if (millis() - lastTime1 >= DISPLAY_TIME)
      {
        counter = ++counter % 2;
        lastTime1 = millis();
      }
      image(images3[counter + 1], x - 33, y - 40);
      last = images3[0];
    }
    if (up == 0 && left == 0 && right == 0 && down == 0) {
      image(last, x - 33, y - 40);
      if (sfx[1].isPlaying()) {
        sfx[1].rewind();
        sfx[1].pause();
      }
    }
  }

  boolean intersect2(Heart h) {
    float distance = dist(x - 10, y - 10, h.xpos + 50, h.ypos + 50); 
    if (distance < 15) { 
      return true;
    } else {
      return false;
    }
  }
}

