public class Candy extends Node {
  
  PImage img;
  boolean onRope;
  
  public Candy(PVector pos, boolean status) {
    super(25, pos, new PVector(0,0));
    img = loadImage("Sprites/candy.png");
    onRope = status;
  }
  public Candy(float x, float y, boolean status) {
    this(new PVector(x,y), status);
  }
  
  public boolean inMouth() {
    return false;
  }
  
  public boolean isOnScreen() {
    return !(getx() < 0 || getx() > width || gety() < 0 || gety() > height);
  }
  
  public void addTo(Rope r) {
    r.addNode(this);
    setStatus(true);
  }
  
  public void setStatus(boolean status) {
    onRope = status;
  }
  
  public boolean getStatus() {
    return onRope;
  }
  
  public void display() {
    PImage b = loadImage("Sprites/bubbles.png");
    image(img, getx() - 250 / 12, gety() - 250 / 12, 250 / 6, 258 / 6);
    image(b, getx() - 250 / 9, gety() - 250 / 9, 55, 55);
  }
  
}
