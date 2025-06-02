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
  public PVector getvel() {
    return velocity;
  }
  
  public float getx() {
    return position.x;
  }
  
  public float gety() {
    return position.y;
  }
  
  public PVector calculateVector(Node other){
    PVector force = PVector.sub(getpos(), other.getpos());
    float d = len - force.mag();
    force.setMag(d * k); // spring constant scaling factor
    
    return force;
  }
  public PVector calculateVector(Node n1, Node n2){
    PVector f1 = calculateVector(n1);
    PVector f2 = calculateVector(n2);
    
    return PVector.add(f1, f2).add(gravity);
  }
  
  public void move(PVector f) {
    acceleration.add(f.div(getmass()));
    // acceleration.mult(dampen);
    
    velocity.add(acceleration);
    position.add(velocity);
    acceleration = new PVector(0, 0);
  }
  
  public float dist(Node other) {
    return getpos().dist(other.getpos());
  }
  
}
