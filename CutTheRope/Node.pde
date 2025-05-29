public abstract class Node {
  private int mass;
  private PVector position, velocity, acceleration;
  
  public Node (int m, PVector pos, PVector vel) {
    mass = m;
    position = pos;
    velocity = vel;
    acceleration = new PVector(0,0);
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
  
  public void move() {
    velocity.add(acceleration);
    
  }  
  
  public float dist(Node other) {
    return getpos().dist(other.getpos());
  }
}
