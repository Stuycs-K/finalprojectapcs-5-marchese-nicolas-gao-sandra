public class Rope {
  
  private ArrayList<Node> nodes;

  public float nodeDist;
  public int ropeID;
  
  public boolean isCut(int pmouseX, int pmouseY, int mouseX, int mouseY) {
    for (int i = 0; i < nodes.size() - 1; i++) {
      Node n1 = nodes.get(i);
      Node n2 = nodes.get(i + 1);
      if (min(pmouseX, mouseX) < min(n1.getx(), n2.getx()) && max(pmouseX, mouseX) > max(n1.getx(), n2.getx())) {
        cut();
        return true;
      }
    }
    return false;
  }
  
  public void addNode(Node n) {
    nodes.add(n);
  }
  
  private void cut() {
    while (nodes.size() > 2) {
      nodes.remove(1);
    }
    if (nodes.remove(candy)){
      if (ropeID == 1) {inRope1 = false;}
      if (ropeID == 2) {inRope2 = false;}
    }
  }
  
  public void stretch() {
    if (nodes.size() > 2) {
      ArrayList<PVector> forces = new ArrayList<PVector>();
      for (int i = 0; i < nodes.size(); i++) {
        Node n = nodes.get(i);
        PVector force;
        try {
          force = n.calculateVector(nodes.get(i - 1), nodes.get(i + 1));
        } catch (IndexOutOfBoundsException e) {
          try {
            force = n.calculateVector(nodes.get(i - 1));
          } catch (IndexOutOfBoundsException f) {
            force = n.calculateVector(nodes.get(i + 1));
          }
        }
        forces.add(force);
      }
      
      for (int i = 0; i < nodes.size(); i++) {
        nodes.get(i).move(forces.get(i));
      }
    }
  }
  
  public void display() {
    for(int i = 0; i + 1 < nodes.size(); i++) {
      if (nodes.get(i) != candy) nodes.get(i).display();
      line(nodes.get(i).getx(), nodes.get(i).gety(), nodes.get(i + 1).getx(), nodes.get(i + 1).gety());
    }
    nodes.get(nodes.size() - 1).display();
  }
  
  public Rope(float x1, float y1, float x2, float y2, int ropeID) {
    this(new StaticNode(x1, y1), new StaticNode(x2, y2), ropeID);
  }
  
  public Rope(Node n1, Node n2, int ropeID) {
    this.ropeID = ropeID;
    int points = (int) (n1.dist(n2) / len);
    int xStep = (int) (n2.getx() - n1.getx()) / points;
    int yStep = (int) (n2.gety() - n1.gety()) / points;
    nodeDist = (float)Math.sqrt(xStep*xStep + yStep*yStep);
    nodes = new ArrayList<Node>();
    nodes.add(n1);
    for (int i = 0; i < points; i++) {
      nodes.add(new RopeNode(n1.getx() + (i + 1) * xStep, n1.gety() + (i + 1) * yStep));
    }
    nodes.add(n2);
  }
}
