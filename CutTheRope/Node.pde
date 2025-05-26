public abstract class Node {
  private int mass;
  private PVector position;
  private PVector acceleration;
  
  public Node (int m, PVector pos, PVector acc) {
    mass = m;
    position = pos;
    acceleration = acc;
  }
  
  public int getmass() {
    return mass;
  }
  public PVector getpos() {
    return position;
  }
  public PVector getacc() {
    return acceleration;
  }
  
  public PVector calculateVector(Node n1, Node n2) {
    return null;
  }
  public void apply(PVector v) {
    position.add(v);
  }
}
