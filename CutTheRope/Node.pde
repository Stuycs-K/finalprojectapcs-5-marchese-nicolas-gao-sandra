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
    PVector force = PVector.sub(other.getpos(), getpos());
    float d = force.mag() - len;
    force.setMag(d * k); // spring constant scaling factor
    
    return force;
  }
  
  public void move(PVector f) {
    acceleration.add(f.div(getmass()));
    acceleration.add(new PVector(0, g));
    
    velocity.add(acceleration);
    position.add(velocity);
    acceleration = new PVector(0, 0);
  }
  
  public float dist(Node other) {
    return getpos().dist(other.getpos());
  }
  
}
