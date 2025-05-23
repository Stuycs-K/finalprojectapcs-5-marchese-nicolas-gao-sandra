public abstract class Node {
  private int mass;
  private Vector position;
  private Vector acceleration;
  
  public Node (int m, Vector pos, Vector acc) {
    mass = m;
    position = pos;
    acceleration = acc;
  }
  
  public int getmass() {
    return mass;
  }
  public Vector getpos() {
    return position;
  }
  public Vector getacc() {
    return acceleration;
  }
  
  public Vector calculateVector(Node n1, Node n2) {
    return null;
  }
  public void apply(Vector v) {
    position.add(v);
  }
