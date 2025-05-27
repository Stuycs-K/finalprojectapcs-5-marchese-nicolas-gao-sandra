PImage sprite;
PVector winPos;
int currentLevel;
ArrayList<Rope> ropes;
Candy candy;
ArrayList<PVector> stars;

void draw(){
  while(!candy.inMouth()) run();
  win();
}

void run() {
  
}

void setup(){
  sprite = loadImage("");
  currentLevel = 0; //start on main screen ?
  loadLevel(currentLevel);
}

void loadLevel(int level) {
  ropes = new ArrayList<Rope>();
  stars = new ArrayList<PVector>();
  
  if (level == 1) {
      winPos = new PVector(0,0);
      ropes.add(new Rope(10));
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
