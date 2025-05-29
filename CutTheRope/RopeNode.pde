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
  
  public void attract(Node other, float nodeDist){
    PVector force = PVector.sub(other.position, position);
    float d = force.mag() - nodeDist;
    force.setMag(d * 50); // spring constant scaling factor
    acceleration.add(force.div(mass));
  }
  
}
