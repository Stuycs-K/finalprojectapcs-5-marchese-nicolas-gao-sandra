PImage sprite;
PImage bg;
int winPosX, winPosY, scale;
int currentLevel;
ArrayList<Rope> ropes;
Candy candy;
// ArrayList<PVector> stars; additional feature
boolean onScreen, devMode;
boolean inAnyRope, bubble;
boolean inRope1, inRope2; // for levels w/ multiple

final PVector gravity = new PVector(0, 10);
final float k = 10;
final float len = 20;
final float dampen = .989;

void draw(){
  inAnyRope = inRope1 || inRope2;
  textSize(20); 
  if (currentLevel > 0){
    background(bg);
    if(!candy.inMouth() && onScreen){
      onScreen = candy.isOnScreen();
      run();
    }
    if (Math.abs(candy.getx()-winPosX) <= 50 && Math.abs(candy.gety()-winPosY) <= 50) {
      win();
    } else if (!onScreen) {
      lose();
    }
  }
  if (currentLevel == 0){
    background(bg);
    PImage logo = loadImage("Sprites/menulogo.png");
    image(logo, 0, 0, 540, 300);
    textSize(50); fill(0);
    text("Click to start!", 150, 400);
  }
  if (currentLevel == 1){
    text("Swipe ->", 150, 200);
    text("This is Om Nom!", 100, 700);
    text("He's really hungry.", 100, 720);
    text("Cut the rope to give him the candy!", 100, 740);
  }
  if (currentLevel == 2){
    text("Use momentum!", 200, 230);
  }
  if (currentLevel == 3){
    text("Cut both ropes in one swipe!", 200, 700);
  }
  if (currentLevel == 4){
    text("Be amazed at the magic portals!", 200, 500);
    PImage p1 = loadImage("Sprites/portal1.png");
    PImage p2 = loadImage("Sprites/portal2.png");
    image(p1, 120, 770, 100, 100);
    image(p2, 300, 100, 100, 100);
    if (candy.position.y > 750){candy.position = new PVector(340, 100);}
  }
  
  if (currentLevel == 5){
    text("And float up in a bubble!", 150, 300);
    if (candy.position.y > 750){bubble = true;}
  }
  
}

void run() {
  image(sprite, winPosX - 250 / scale / 2, winPosY - 258 / scale / 2, 250 / scale, 258 / scale); // calculates upper left corner + scales image down
  for (Rope r : ropes) {
    r.stretch();
    r.display();
  }
  if (!inAnyRope && !bubble) candy.move(new PVector(0,30));
  if (bubble) {candy.move(new PVector(0, -10));}
  candy.display();
}

void setup(){
  size(540,960); // 9:16 phone aspect ratio
  bg = loadImage("Sprites/bg00.png"); bg.resize(540, 960);
  background(bg);
  sprite = loadImage("Sprites/omnom.png");
  currentLevel = 0; scale = 3; onScreen = false; devMode = false;
  inRope1 = false; inRope2 = false;
}

void loadLevel(int level) {
  
  ropes = new ArrayList<Rope>();
  // stars = new ArrayList<PVector>();
  
  if (level == 1) {
      bg = loadImage("Sprites/bg01.png"); bg.resize(540, 960);
      winPosX = width / 2; winPosY = 800;
      candy = new Candy(width / 2, 200);
      ropes.add(new Rope(new StaticNode(width / 2, 100), candy, 1));
      // stars.add(new PVector(10, 0));
      onScreen = true;
      inRope1 = true; inRope2 = false;
  }
  
  if (level == 2) {
      bg = loadImage("Sprites/bg02.png"); bg.resize(540, 960);
      winPosX = width / 2; winPosY = 800;
      candy = new Candy(width / 2, 200);
      ropes.add(new Rope(new StaticNode(width / 4, 150), candy, 1));
      ropes.add(new Rope(new StaticNode(3*width / 4, 150), candy, 2));
      onScreen = true;
      inRope1 = true; inRope2 = true;
  }
  
  if (level == 3) {
      bg = loadImage("Sprites/bg03.png"); bg.resize(540, 960);
      winPosX = 2 * width / 5; winPosY = 750;
      candy = new Candy(width / 2, 300);
      ropes.add(new Rope(new StaticNode(width / 2, 100), candy, 1));
      ropes.add(new Rope(new StaticNode(5 * width / 7, 200), candy, 2));
      onScreen = true;
      inRope1 = true; inRope2 = true;
  }
  
  if (level == 4) {
      bg = loadImage("Sprites/bg04.png"); bg.resize(540, 960);
      winPosX = 2 * width / 3; winPosY = 700;
      candy = new Candy(width / 3, 200);
      ropes.add(new Rope(new StaticNode(width / 3, 100), candy, 1));
      onScreen = true;
      inRope1 = true; inRope2 = false;
  }
  
  if (level == 5) {
      bg = loadImage("Sprites/bg05.png"); bg.resize(540, 960);
      winPosX = width / 2; winPosY = 100;
      candy = new Candy(width / 2, 600);
      ropes.add(new Rope(new StaticNode(width / 2, 500), candy, 1));
      onScreen = true;
      inRope1 = true; inRope2 = false;
  }
  
  if (level > 5) {
      background(0); textSize(50);
      fill(255);
      text("More levels soon!", 20, 100);
  }
  
}

void win() {
  try{text("Win", 100, 500); Thread.sleep(100);} catch(Exception e){}
  currentLevel++;
  loadLevel(currentLevel);
}

void lose() {
  loadLevel(currentLevel);
}

void mouseClicked() {
  if (currentLevel == 0){currentLevel++; loadLevel(currentLevel);}
}

void keyPressed() { // shortcut
  if (key == 'd'){devMode = true;}
  else if (!Character.isDigit(key)){devMode = false;}
  if (key == '1' && devMode){currentLevel = 1; loadLevel(currentLevel);}
  if (key == '2' && devMode){currentLevel = 2; loadLevel(currentLevel);}
  if (key == '3' && devMode){currentLevel = 3; loadLevel(currentLevel);}
  if (key == '4' && devMode){currentLevel = 4; loadLevel(currentLevel);}
  if (key == '5' && devMode){currentLevel = 5; loadLevel(currentLevel);}
}

void mouseDragged() {
  for (Rope r : ropes) {
    r.isCut(pmouseX, pmouseY, mouseX, mouseY);
  }
}
