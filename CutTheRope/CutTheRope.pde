PImage sprite;
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
  // image(sprite, winPosX - 250 / 6, winPosY - 258 / 2, 250 / 2, 258 / 3); // calculates upper left corner + scales image down
  return;
}

void setup(){
  size(1000,1000);
  background(255);
  sprite = loadImage("Sprites/omnom.png");
  currentLevel = 1; //start on main screen ?
  loadLevel(currentLevel);
  candy.display();
}

void loadLevel(int level) {
  ropes = new ArrayList<Rope>();
  stars = new ArrayList<PVector>();
  
  if (level == 1) {
      winPosX = 50; winPosY = 50;
      candy = new Candy(winPosX, winPosY);
      ropes.add(new Rope(new StaticNode(300, 100), candy));
      stars.add(new PVector(10, 0));
  }
  
  image(sprite, winPosX - 250 / 10, winPosY - 258 / 10, 250 / 3, 258 / 3); // calculates upper left corner + scales image down
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
