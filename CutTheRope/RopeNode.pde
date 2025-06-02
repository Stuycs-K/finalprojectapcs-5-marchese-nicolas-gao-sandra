public class RopeNode extends Node {
  public RopeNode (PVector pos, PVector vel) {
    super(25, pos, vel);
  }
  
  public RopeNode (float x, float y) {
    this(new PVector(x, y), new PVector(0,0));
  }
  
  public void display() {
    circle(getx(), gety(), 2);
    return;
  }
}
