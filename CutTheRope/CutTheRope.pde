// PImage sprite;
int winPosX, winPosY;
int currentLevel;
ArrayList<Rope> ropes;
Candy candy;
ArrayList<PVector> stars;
boolean onScreen = true;

void draw(){
  while(!candy.inMouth() && onScreen) {
    onScreen = candy.isOnScreen();
    run();
  }
  if (!onScreen) {
    lose();
  } else {
    win();
  }
}

void run() {
  return;
}

void setup(){
  size(1000,1000);
  // sprite = loadImage("");
  currentLevel = 0; //start on main screen ?
  loadLevel(currentLevel);
}

void loadLevel(int level) {
  ropes = new ArrayList<Rope>();
  stars = new ArrayList<PVector>();
  
  if (level == 1) {
      winPosX = 0; winPosY = 0;
      ropes.add(new Rope(300, 100, 310, 400));
      stars.add(new PVector(10, 0));
  }
  
  // image(sprite, winPosX, winPosY);
}

void win() {
  return;
}
void lose() {
  
}

void mouseClicked() {
  return;
}
void mouseDragged() {
  // isCut(pmouseX, pmouseY, mouseX, mouseY);
}
