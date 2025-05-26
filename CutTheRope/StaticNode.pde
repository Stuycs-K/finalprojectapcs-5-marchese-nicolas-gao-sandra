public class StaticNode extends Node {
  public StaticNode(PVector pos) {
    super(0, pos, new PVector(0,0));
  }
  
  public boolean inRange(Rope r) {
    return false;
  }
  public void addTo(Rope r) {
  
  }
  public void display() {
    
  }
}
