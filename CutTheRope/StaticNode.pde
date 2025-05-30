public class StaticNode extends Node {
  private String img;
  
  public StaticNode(PVector pos) {
    super(0, pos, new PVector(0,0));
    img = "";
  }
  public StaticNode(float x, float y) {
    this(new PVector(x, y));
  }
  
  public boolean inRange(Rope r) {
    return false;
  }
  public void addTo(Rope r) {
  
  }
  
  public void attract(Node other, float nodeDist){}
  
  public void display() {
    
  }
}
