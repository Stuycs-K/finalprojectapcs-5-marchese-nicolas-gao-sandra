PImage sprite, support;
PImage bg;
int winPosX, winPosY, scale;
int currentLevel;
ArrayList<Rope> ropes;
Candy candy;
ArrayList<PVector> stars; int totalStars;
boolean onScreen, devMode, midScreen;
boolean inAnyRope, bubble;
boolean inRope1, inRope2; // for levels w/ multiple
boolean gotStar1, gotStar2, gotStar3;

final PVector gravity = new PVector(0, 1);
final float k = 10;
final float len = 25;
final float dampen = .95;

void draw(){

  inAnyRope = inRope1 || inRope2;
  textSize(20); 
  background(bg);
  
  displayLevel();
  
  if (currentLevel > 0){
    getStar();
    // background(bg);
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
  
}

void run() {
  try {
    image(support, winPosX - support.width / 2, winPosY - sprite.height / 2);
  } catch (NullPointerException e) {}
  image(sprite, winPosX - sprite.width / 2, winPosY - sprite.width / 2); // calculates upper left corner + scales image down
  for (Rope r : ropes) {
    r.stretch();
    r.display();
  }
  if (!inAnyRope && !bubble) candy.move(new PVector(0,30));
  if (bubble) {candy.move(new PVector(0, -28));}
  candy.display();
}

void setup(){
  size(540,960); // 9:16 phone aspect ratio
  bg = loadImage("Sprites/bg00.png"); bg.resize(540, 960);
  background(bg);
  stars = new ArrayList<PVector>();
  currentLevel = 0; scale = 3; onScreen = false; devMode = false; midScreen = false;
  sprite = loadImage("Sprites/omnom.png"); sprite.resize(83, 83);
  gotStar1 = false; gotStar2 = false; gotStar3 = false;
  inRope1 = false; inRope2 = false;
}

void loadLevel(int level) {
  
  ropes = new ArrayList<Rope>();
  stars = new ArrayList<PVector>();
  gotStar1 = false; gotStar2 = false; gotStar3 = false;
  
  if (midScreen){
    candy = new Candy(0,0,false); winPosX = 0; winPosY = 0; onScreen = false;
    inRope1 = false; inRope2 = false; bubble = false;
    bg = loadImage("Sprites/mid_screen_bgr.png"); bg.resize(540, 960);
    return;
  }
  
  else{
    totalStars = 0;
  }
  
  if (level > 0) support = loadImage("Sprites/char_support_0" + currentLevel + "_hd.png");
  
  if (level == 1) {
    bg = loadImage("Sprites/bg01.png"); bg.resize(540, 960);
    winPosX = width / 2; winPosY = 800;
    support.resize(140, 160);
    candy = new Candy(width / 2, 200, true);
    ropes.add(new Rope(new StaticNode(width / 2, 100), candy, 1));
    onScreen = true;
    inRope1 = true; inRope2 = false;
    bubble = false;
  }
  
  if (level == 2) {
      bg = loadImage("Sprites/bg02.png"); bg.resize(540, 960);
      winPosX = width / 2; winPosY = 800;
      support.resize(150, 113);
      candy = new Candy(width / 2, 250, true);
      ropes.add(new Rope(new StaticNode(2*width / 5, 150), candy, 1));
      ropes.add(new Rope(new StaticNode(3*width / 5, 150), candy, 2));
      onScreen = true;
      inRope1 = true; inRope2 = true;
      bubble = false;
  }
  
  if (level == 3) {
      bg = loadImage("Sprites/bg03.png"); bg.resize(540, 960);
      winPosX = 2 * width / 5; winPosY = 750;
      support.resize(150,115);
      candy = new Candy(width / 2, 300, true);
      ropes.add(new Rope(new StaticNode(width / 2, 100), candy, 1));
      ropes.add(new Rope(new StaticNode(5 * width / 7, 200), candy, 2));
      onScreen = true;
      inRope1 = true; inRope2 = true;
      bubble = false;
  }
  
  if (level == 4) {
      bg = loadImage("Sprites/bg04.png"); bg.resize(540, 960);
      winPosX = 2 * width / 3; winPosY = 700;
      support.resize(180, 110);
      candy = new Candy(width / 3, 200, true);
      ropes.add(new Rope(new StaticNode(width / 3, 100), candy, 1));
      onScreen = true;
      inRope1 = true; inRope2 = false;
      bubble = false;
  }
  
  if (level == 5) {
      bg = loadImage("Sprites/bg05.png"); bg.resize(540, 960);
      winPosX = width / 2; winPosY = 100;
      support.resize(190, 180);
      candy = new Candy(width / 2, 700, true);
      ropes.add(new Rope(new StaticNode(width / 2, 800), candy, 1));
      onScreen = true;
      inRope1 = true; inRope2 = false;
      bubble = true;
  }
  
    if (level == 6) {
      bg = loadImage("Sprites/bg06.png"); bg.resize(540, 960);
      winPosX = 2 * width / 3; winPosY = 100;
      support.resize(170, 180);
      candy = new Candy(width / 2, 400, true);
      ropes.add(new Rope(new StaticNode(width / 3, 350), candy, 1));
      ropes.add(new Rope(new StaticNode(2 * width / 3, 450), candy, 2));
      onScreen = true;
      inRope1 = true; inRope2 = true;
      bubble = true;
  }
  
    if (level == 7) {
      bg = loadImage("Sprites/bg07.png"); bg.resize(540, 960);
      winPosX = width / 2; winPosY = 800;
      support.resize(170, 180);
      candy = new Candy(width / 2, 100, true);
      ropes.add(new Rope(new StaticNode(3 * width / 8, 100), candy, 1));
      ropes.add(new Rope(new StaticNode(5 * width / 8, 100), candy, 2));
      onScreen = true;
      inRope1 = true; inRope2 = true;
      bubble = false;
  }
  
    if (level == 8) {
      bg = loadImage("Sprites/bg08.png"); bg.resize(540, 960);
      winPosX = 3 * width / 4; winPosY = 500;
      support.resize(170, 180);
      candy = new Candy(width / 2, 200, true);
      ropes.add(new Rope(new StaticNode(width / 2, 100), candy, 1));
      onScreen = true;
      inRope1 = true; inRope2 = false;
      bubble = false;
  }
  
  if (level > 8) {
      background(0); textSize(50);
      fill(255);
      text("The end.", 150, 100);
  }
  
}

void displayLevel() {
  
  if (midScreen){
    PImage result = loadImage("Sprites/3star.png");
    if (totalStars == 1){result = loadImage("Sprites/1star.png");}
    if (totalStars == 2){result = loadImage("Sprites/2star.png");}
    if (totalStars == 3){result = loadImage("Sprites/3star.png");}
    image(result, 100, 100, 350, 150);
    textSize(30); text("Nice!", 220, 300);
    textSize(40); text("Click to continue.", 100, 400);
    return;
  }
  
  if (currentLevel > 0) {
    setupStars(currentLevel);
    if (stars.size() > 0) drawStars();
  }
  
  if (currentLevel == 0){
    PImage logo = loadImage("Sprites/menulogo.png");
    image(logo, 0, 0, 540, 300);
    textSize(50); fill(0);
    text("Click to start!", 150, 400);
    textSize(20); fill(255);
    text("Nicolas Marchese, Sandra Gao", 20, 900);
    fill(0);
  } else if (currentLevel == 1) {
    text("Swipe ->", 150, 200);
    text("This is Om Nom!", 100, 700);
    text("He's really hungry.", 100, 720);
    text("Cut the rope to give him the candy!", 100, 740);
  } else if (currentLevel == 2){
    text("Cut both ropes in one swipe!", 160, 700);
  } else if (currentLevel == 3){
    text("Use momentum!", 100, 430);
  } else if (currentLevel == 4){
    text("Be amazed at the magic portals!", 135, 600);
    PImage p1 = loadImage("Sprites/portal1.png");
    PImage p2 = loadImage("Sprites/portal2.png");
    image(p1, 120, 770, 100, 100);
    image(p2, 300, 100, 100, 100);
    if (candy.position.y > 750){candy.position = new PVector(340, 100);}
  } else if (currentLevel == 5){
    text("And float up in a bubble!", 160, 500);
  }
  else if (currentLevel == 8){
    text("Cannonball!!!", 210, 470);
    PImage p1 = loadImage("Sprites/portal1.png");
    PImage p2 = loadImage("Sprites/portal3.png");
    image(p1, 230, 770, 100, 100);
    image(p2, 40, 380, 100, 100);
    if (candy.position.y > 750){candy.position = new PVector(100, 410); candy.velocity = new PVector(50,0);}
  }
}

void setupStars(int level){
  stars = new ArrayList<PVector>();
  if (level == 1){
    stars.add(new PVector(270, 370));
    stars.add(new PVector(270, 470));
    stars.add(new PVector(270, 570));
  }
  if (level == 2){
    stars.add(new PVector(270, 390));
    stars.add(new PVector(270, 490));
    stars.add(new PVector(270, 590));
  }
  if (level == 3){
    stars.add(new PVector(270, 400));
    stars.add(new PVector(250, 490));
    stars.add(new PVector(250, 580));
  }
  if (level == 4){
    stars.add(new PVector(360, 270));
    stars.add(new PVector(175, 470));
    stars.add(new PVector(360, 470));
  }
  if (level == 5){
    stars.add(new PVector(270, 200));
    stars.add(new PVector(270, 250));
    stars.add(new PVector(270, 300));
  }
  if (level == 6){
    stars.add(new PVector(350, 200));
    stars.add(new PVector(350, 250));
    stars.add(new PVector(350, 300));
  }
  if (level == 7){
    stars.add(new PVector(150, 200));
    stars.add(new PVector(260, 600));
    stars.add(new PVector(260, 700));
  }
  if (level == 8){
    stars.add(new PVector(200, 400));
    stars.add(new PVector(270, 400));
    stars.add(new PVector(270, 480));
  }
}

void drawStars() {
  PImage s = loadImage("Sprites/star.png");
  if (!gotStar1) {image(s, stars.get(0).x-20, stars.get(0).y, 40, 40);}
  if (!gotStar2) {image(s, stars.get(1).x-20, stars.get(1).y, 40, 40);}
  if (!gotStar3) {image(s, stars.get(2).x-20, stars.get(2).y, 40, 40);}
}

void getStar(){
  for (int i = 0; i <= 2; i++){
    PVector star = new PVector();
    try{star = stars.get(i);} catch(Exception e){}
    if (abs(candy.getx() - star.x) < 30 && abs(candy.gety() - star.y) < 40){
      if (i == 0){gotStar1 = true;}
      if (i == 1){gotStar2 = true;}
      if (i == 2){gotStar3 = true;}
      totalStars++;
    }
  }
}

void win() {
  midScreen = true;
  loadLevel(currentLevel);
}

void lose() {
  loadLevel(currentLevel);
}

void mouseClicked() {
  if (currentLevel == 0 || midScreen){currentLevel++;  midScreen = false; loadLevel(currentLevel);}
}

void keyPressed() { // shortcut
  if (key == DELETE) loadLevel(currentLevel);
  if (key == 'd'){devMode = true;}
  else if (!Character.isDigit(key)){devMode = false;}
  if (key == '1' && devMode){currentLevel = 1; loadLevel(currentLevel);}
  if (key == '2' && devMode){currentLevel = 2; loadLevel(currentLevel);}
  if (key == '3' && devMode){currentLevel = 3; loadLevel(currentLevel);}
  if (key == '4' && devMode){currentLevel = 4; loadLevel(currentLevel);}
  if (key == '5' && devMode){currentLevel = 5; loadLevel(currentLevel);}
  if (key == '6' && devMode){currentLevel = 6; loadLevel(currentLevel);}
  if (key == '7' && devMode){currentLevel = 7; loadLevel(currentLevel);}
  if (key == '8' && devMode){currentLevel = 8; loadLevel(currentLevel);}
}

void mouseDragged() {
  if (currentLevel > 0) {
    for (Rope r : ropes) {
      r.isCut(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
}
