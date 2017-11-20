import ddf.minim.*;

Catcher catcher;
Minim minim;
AudioPlayer[] player;
AudioPlayer[] sfx;
Heart hearts;
Heart hearts1;
Heart hearts2;
Heart hearts3;
int lastTime;
PImage img1, img2, img3, img4;
PImage[] cs = new PImage[51];
PImage[] ep = new PImage[20];
float x, y = 0;
float left, right, up, down = 0;
boolean Go = false;
int goal = 0;
int c = 0;
int e = 0;
int counter1, counter3;
int counter2 = 255;
final int dt = 500;


void setup() {
  size(500, 500);
  smooth();
  frameRate(60);
  catcher = new Catcher();  
  minim = new Minim(this);
  player = new AudioPlayer[5];
  sfx = new AudioPlayer[6];
  sfx[0] = minim.loadFile("sss.wav", 2048);
  sfx[1] = minim.loadFile("foot.mp3", 2048);
  sfx[2] = minim.loadFile("find.mp3", 2048);
  sfx[3] = minim.loadFile("doll.mp3", 2048);
  sfx[4] = minim.loadFile("eep.mp3", 2048);
  sfx[5] = minim.loadFile("ring.mp3", 2048);
  player[0] = minim.loadFile("peace.mp3", 2048);
  player[1] = minim.loadFile("mellow.mp3", 2048);
  player[2] = minim.loadFile("soul.mp3", 2048);
  player[3] = minim.loadFile("evil.mp3", 2048);
  player[4] = minim.loadFile("death.mp3", 2048);
  img1 = loadImage ("soul2.png");
  img2 = loadImage ("soul1.png");
  img3 = loadImage ("soul3.png");
  img4 = loadImage ("soul4.png");
  for (int i = 1; i < 52; i++) {
    cs[i-1] = loadImage(i+ ".jpg");
  }
  for (int i = 1; i < 10; i++) {
    ep[i-1] = loadImage(nf(i, 2)+ ".jpg");
  }
  for (int i = 10; i < 21; i++) {
    ep[i-1] = loadImage(nf(i, 3)+ ".jpg");
  }
  hearts = new Heart(1);
  hearts1 = new Heart(2);
  hearts2 = new Heart(3);
  hearts3 = new Heart(4);
  background(0);
  catcher.display();
  lastTime = millis();
}

void draw() {
  if (c == 0) {
    player[0].play();
  }
  if (c == 12) {
    player[0].close();
    player[1].play();
  }
  if (c == 21) {
    sfx[2].play();
  }
  if (c == 25) {
    player[1].close();
    player[2].play();
  }
  if (c == 29) {
    player[2].close();
  }
  if (c == 31) {
    sfx[5].setVolume(0.5);
    sfx[5].play();
  }
  if (c == 43) {
    sfx[4].play();
  }
  if (c == 46) {
    sfx[5].close();
    sfx[3].play();
  }
  if (c == 47) {
    player[3].play();
  }
  if (e == 4) {
    player[4].play();
  }
  if (e == 16) {
    player[4].close();
    player[3].play();
    e += 1;
  }

  if (c == 0) {
    image(cs[c], 0, 0);
    textSize (28);
    text ("Click to Continue", 135, 483);
    counter1 = ++counter1 % 100;
    if (counter1 < 50) {
      fill(255, 255, 255, counter1 * 5);
    }
    if (counter1 > 50) {
      fill(255, 255, 255, 500 - counter1*5);
    }
    if (mousePressed == true) {
      c += 1;
      counter1 = 0;
      mousePressed = false;
    }
  }
  if (c < 11 && c > 0) {
    image(cs[c], 0, 0);
    if (mousePressed == true) {
      c += 1;
      mousePressed = false;
    }
  }
  if (c == 11) {
    background(0);
    tint(255, counter2);
    image(cs[10], 0, 0);
    counter2 -= 3;
    if (counter2 < 0) {
      c = 12;
    }
  }
  if (c == 12) {
    if (mousePressed == true) {
      c += 1;
      mousePressed = false;
    }
    tint(255, counter2);
    if (counter2 < 255) {
      counter2 += 1;
    }
    image(cs[11], 0, 0);
    textSize (28);
    text ("Click to Continue", 135, 483);
    counter1 = ++counter1 % 100;
    if (counter1 < 50) {
      fill(255, 255, 255, counter1 * 5);
    }
    if (counter1 > 50) {
      fill(255, 255, 255, 500 - counter1*5);
    }
  }
  if (c == 13) {
    background(0);
    tint(255, counter2);
    image(cs[11], 0, 0);
    counter2 -= 3;
    if (counter2 < 0) {
      c = 14;
    }
  }
  if (c == 14) {
    if (mousePressed == true) {
      c += 1;
      mousePressed = false;
    }
    tint(255, counter2);
    if (counter2 < 255) {
      counter2 += 1;
    }
    image(cs[c-2], 0, 0);
  }
  if (c > 14 && c < 24 ) {
    tint(255, 255);
    image(cs[c-1], 0, 0);
    if (mousePressed == true) {
      c += 1;
      mousePressed = false;
    }
  }
  if (c == 24) {
    background(0);
    tint(255, counter2);
    image(cs[22], 0, 0);
    counter2 -= 3;
    if (counter2 < 0) {
      c = 25;
    }
  }
  if (c > 24 && c < 27) {
    if (mousePressed == true) {
      c += 1;
      mousePressed = false;
    }
    tint(255, counter2);
    if (counter2 < 255) {
      counter2 += 1;
    }
    image(cs[c-2], 0, 0);
  }
  if (c > 26 && c < 30) {
    if (millis() - lastTime >= dt)
    {
      counter3 = ++counter3 % 4;
      lastTime = millis();
    }
    image(cs[counter3+25], 0, 0);
    textSize (30);
    text ("Press Enter To Start", 110, 483);
    counter1 = ++counter1 % 100;
    if (counter1 < 50) {
      fill(255, 255, 255, counter1 * 5);
    }
    if (counter1 > 50) {
      fill(255, 255, 255, 500 - counter1*5);
    }
  }


  if (keyCode == ENTER)
  {
    tint(255, 255);
    Go = true;
    frameRate(60);
  }
  if (Go == true && goal < 5) {
    textSize(30);
    fill(255, 255, 255, 255);
    background(0);
    text(goal, 30, 30);
    catcher.display();
    hearts.display();
    hearts.move(); 
    if (catcher.intersect2(hearts)) {
      hearts.caught();
      hearts = new Heart(1);
      if (goal != 0) {
        goal -= 1;
      }
    }
    hearts1.display();
    hearts1.move(); 
    if (catcher.intersect2(hearts1)) {
      hearts1.caught();
      hearts1 = new Heart(2);
      goal += 1;
    }
    hearts2.display();
    hearts2.move(); 
    if (catcher.intersect2(hearts2)) {
      hearts2.caught();
      hearts2 = new Heart(3);
      if (goal != 0) {
        goal -= 1;
      }
    }
    hearts3.display();
    hearts3.move(); 
    if (catcher.intersect2(hearts3)) {
      hearts3.caught();
      hearts3 = new Heart(4);
      if (goal != 0) {
        goal -= 1;
      }
    }
  }
  if (goal == 5 && c < 29) {
    sfx[1].close();
    c = 29;
  }
  if (c > 28 && c < 31) {
    tint(255, 255);
    image(cs[c], 0, 0);
    if (mousePressed == true) {
      c += 1;
      mousePressed = false;
    }
  }
  if (c > 30 && counter < 12) {
    if (millis() - lastTime >= dt)
    {
      counter = ++counter;
      lastTime = millis();
    }
    image(cs[31+counter], 0, 0);
  }
  if (counter == 9) {
    c = 43;
  }
  if (c > 40 && c < 48) {
    tint(255, 255);
    image(cs[c], 0, 0);
    if (mousePressed == true) {
      c += 1;
      lastTime = millis();
      mousePressed = false;
    }
  }
  if (c > 47 && c < 51) {
    image(cs[c], 0, 0);
    if (millis() - lastTime >= 3500)
    {
      c += 1;
      lastTime = millis();
    }
  }
  if (c > 50 && e < 16) {
    player[3].pause();
    image(ep[e], 0, 0);
    if (mousePressed == true) {
      e += 1;
      mousePressed = false;
    }
  }
  if (e > 15) {
    if (millis() - lastTime >= 100)
    {
      counter3 = ++counter3 % 4;
      lastTime = millis();
    }
    image(ep[counter3 + 16], 0, 0);
    counter1 = ++counter1 % 100;
    if (counter1 < 50) {
      fill(255, 255, 255, counter1 * 5);
    }
    if (counter1 > 50) {
      fill(255, 255, 255, 500 - counter1*5);
    }
  }
}
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 0;
    }
    if (keyCode == RIGHT)
    {
      right = 0;
    }
    if (keyCode == UP)
    {
      up = 0;
    }
    if (keyCode == DOWN)
    {
      down = 0;
    }
  }
}

void keyPressed()
{
  if (!sfx[1].isPlaying() && Go == true) {
    sfx[1].play();
  }
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 1;
    }
    if (keyCode == RIGHT)
    {
      right = 1;
    }
    if (keyCode == UP)
    {
      up = 1;
    }
    if (keyCode == DOWN)
    {
      down = 1;
    }
  }
}

