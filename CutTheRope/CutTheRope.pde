PImage sprite;
PImage bg;
int winPosX, winPosY, scale;
int currentLevel, frame, fps;
ArrayList<Rope> ropes;
Candy candy;
ArrayList<PVector> stars;
boolean onScreen;
Rope e;

final PVector gravity = new PVector(0, 2);
final float k = 15;
final float len = 25;
final float dampen = .989;

void draw(){
  if (frame % fps == 0) {
    background(bg);
    if(!candy.inMouth() && onScreen){
      onScreen = candy.isOnScreen();
      run();
    }
    frame = 0;
  }
  
  if (!onScreen) {
    lose();
  }
  else {
    win();
  }
  frame++;
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
  fps = 2;
  
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
      winPosX = 490; winPosY = 900;
      candy = new Candy(200, 200);
      ropes.add(new Rope(new StaticNode(300, 100), candy));
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
  for (Rope r : ropes) {
    if (r.isCut(pmouseX, pmouseY, mouseX, mouseY)) {
      r.cut();
      break;
    }
  }
}
