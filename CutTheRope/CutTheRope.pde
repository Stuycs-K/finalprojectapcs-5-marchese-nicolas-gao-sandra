PImage sprite;
PVector winPos;
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
  
}

void setup(){
  size(1000,1000);
  sprite = loadImage("");
  currentLevel = 0; //start on main screen ?
  loadLevel(currentLevel);
}

void loadLevel(int level) {
  ropes = new ArrayList<Rope>();
  stars = new ArrayList<PVector>();
  
  if (level == 1) {
      winPos = new PVector(0,0);
      ropes.add(new Rope(18, 18, 18, 18));
      stars.add(new PVector(10, 0));
  }
  
  image(sprite, winPos.x, winPos.y);
}

void win() {
  
}
void lose() {
  
}

void mouseClicked() {
  
}
void mouseDragged() {
  isCut(pmouseX, pmouseY, mouseX, mouseY);
}
