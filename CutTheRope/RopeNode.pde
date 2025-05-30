public class RopeNode extends Node {
  public RopeNode (int m, PVector pos, PVector acc) {
    super(m, pos, acc);
  }
  
  public RopeNode (int m, float x, float y) {
    this(m, new PVector(x, y), new PVector(0,0));
  }
  
  public void display() {
    return;
  }
  
}
