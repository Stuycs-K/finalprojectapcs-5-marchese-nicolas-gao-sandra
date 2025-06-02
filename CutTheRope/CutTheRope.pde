PImage sprite;
PImage bg;
int winPosX, winPosY, scale;
int currentLevel;
ArrayList<Rope> ropes;
Candy candy;
ArrayList<PVector> stars;
boolean onScreen, inRope;

final PVector gravity = new PVector(0, 2);
final float k = 15;
final float len = 25;
final float dampen = .989;

void draw(){
  background(bg);
  if(!candy.inMouth() && onScreen){
    onScreen = candy.isOnScreen();
    run();
  }
  
  if (candy.getx() == winPosX && candy.gety() == winPosY) {
    win();
  } else if (!onScreen) {
    lose();
  }
}

void run() {
  image(sprite, winPosX - 250 / scale / 2, winPosY - 258 / scale / 2, 250 / scale, 258 / scale); // calculates upper left corner + scales image down
  for (Rope r : ropes) {
    r.stretch();
    r.display();
  }
  if (!inRope) candy.move(new PVector(0,50));
  candy.display();
}

void setup(){
  size(540,960); // 9:16 phone aspect ratio
  
  currentLevel = 1; //start on main screen ?
  loadLevel(currentLevel);
  sprite = loadImage("Sprites/omnom.png");
  scale = 4;
}

void loadLevel(int level) {
  
  ropes = new ArrayList<Rope>();
  stars = new ArrayList<PVector>();
  
  if (level == 1) {
      bg = loadImage("Sprites/bg01.png"); bg.resize(540, 960);
      winPosX = width / 2; winPosY = 900;
      candy = new Candy(width / 2, 200);
      ropes.add(new Rope(new StaticNode(width / 2, 100), candy));
      stars.add(new PVector(10, 0));
      onScreen = true;
      inRope = true;
  }
  
}

void win() {
  background(255);
  return;
}

void lose() {
  background(0);
  return;
}

void mouseClicked() {
  return;
}

void mouseDragged() {
  for (Rope r : ropes) {
    r.isCut(pmouseX, pmouseY, mouseX, mouseY);
  }
}
