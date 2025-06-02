PImage sprite;
int winPosX, winPosY, scale;
int currentLevel;
ArrayList<Rope> ropes;
Candy candy;
ArrayList<PVector> stars;
boolean onScreen;
Rope e;

final PVector gravity = new PVector(0,0);
final float k = 1;
final float len = 50;
// final float dampen = .1;

void draw(){
  background(255);
  if(!candy.inMouth() && onScreen){
    onScreen = candy.isOnScreen();
    run();
  }
  if (!onScreen) {
    lose();
  }
  else {
    win();
  }
}

void run() {
  image(sprite, winPosX - 250 / scale / 2, winPosY - 258 / scale / 2, 250 / scale, 258 / scale); // calculates upper left corner + scales image down
  for (Rope r : ropes) {
    r.stretch();
    r.display();
  }
  // candy.move(new PVector(0,0));
  // candy.display();
}

void setup(){
  size(540,960); // 9:16 phone aspect ratio
  background(255);
  sprite = loadImage("Sprites/omnom.png");
  scale = 4;
  currentLevel = 1; //start on main screen ?
  loadLevel(currentLevel);
}

void loadLevel(int level) {
  
  ropes = new ArrayList<Rope>();
  stars = new ArrayList<PVector>();
  
  if (level == 1) {
      PImage bg = loadImage("Sprites/bg01.png"); bg.resize(540, 960);
      background(bg);
      winPosX = 490; winPosY = 900;
      candy = new Candy(270, 500);
      ropes.add(new Rope(300, 100, 100, 100));
      stars.add(new PVector(10, 0));
      onScreen = true;
  }
  
}

void win() {
  return;
}

void lose() {
  return;
}

void mouseClicked() {
  return;
}

void mouseDragged() {
  // isCut(pmouseX, pmouseY, mouseX, mouseY);
}
