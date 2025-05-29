public class Candy extends Node {
  PImage img;
  
  public Candy(PVector pos) {
    super(0, pos, new PVector(0,0));
    img = loadImage("Sprites/candy.png");
  }
  public Candy(float x, float y) {
    this(new PVector(x,y));
  }
  
  public boolean inMouth() {
    return false;
  }
  
  public boolean isOnScreen() {
    return !(getx() < 0 || getx() > width || gety() < 0 || gety() > height);
  }
  
  public void attract(Node other, float ropeDist){}// placeholder
  
  public void addTo(Rope r) {
    r.addNode(this);
  }
  public void bounce() {
    
  }
  public void display() {
    image(img, getx(), gety(), 250 / 6, 258 / 6);
  }
}
