public class StaticNode extends Node {
  private PImage img;
  
  public StaticNode(PVector pos) {
    super(10, pos, new PVector(0,0));
    img = loadImage("Sprites/staticnode_1.png");
  }
  public StaticNode(float x, float y) {
    this(new PVector(x, y));
  }
  
  public boolean inRange(Rope r) {
    return false;
  }
  public void addTo(Rope r) {
    r.addNode(this);
  }
  
  public PVector calculateVector(Node other) {
    return null;
  }
  
  public void display() {
    image(img, getx() - img.width / 3, gety() - img.height / 3, img.width / 1.5, img.height / 1.5);
  }
}
