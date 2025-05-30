public abstract class Node {
  public int mass;
  public PVector position;
  public PVector acceleration;
  
  public Node (int m, PVector pos, PVector acc) {
    mass = m;
    position = pos;
    acceleration = acc;
  }
  
  abstract void display();
  
  public int getmass() {
    return mass;
  }
  public PVector getpos() {
    return position;
  }
  public float getx() {
    return position.x;
  }
  public float gety() {
    return position.y;
  }
  public PVector getacc() {
    return acceleration;
  }
  
  public PVector calculateVector(Node n1, Node n2) {
    return null; // placeholder
  }
  
  public void apply(PVector v) {
    position.add(v);
  }  
  
  public float dist(Node other) {
    return getpos().dist(other.getpos());
  }
}
