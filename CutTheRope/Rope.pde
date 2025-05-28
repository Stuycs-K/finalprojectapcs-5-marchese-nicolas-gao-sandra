public class Rope {
  private ArrayList<Node> nodes;
  private boolean show;

  public static final double k = 0.9;
  public static final double len = 10;
  public static final double dampen = .02;
  
  public boolean isCut(int pmouseX, int pmouseY, int mouseX, int mouseY) {
    for (int i = 0; i < nodes.size() - 1; i++) {
      Node n1 = nodes.get(i);
      Node n2 = nodes.get(i + 1);
      if (min(pmouseX, mouseX) < min(n1.getx(), n2.getx()) && max(pmouseX, mouseX) > max(n1.getx(), n2.getx()) && min(pmouseY, mouseY) > min(n1.gety(), n2.gety()) && max(pmouseY, mouseY) < max(n1.gety(), n2.gety())) return true;
    }
    return false;
  }
  public void removeNode() {
    
  }
  public void stretch() {
    
  }
  public void display() {
    
  }
  
  public Rope(float x1, float y1, float x2, float y2) {
    this(new StaticNode(x1, y1), new StaticNode(x2, y2));
  }
  public Rope(Node n1, Node n2) {
    int points = (int) (n1.dist(n2) / len);
    int xStep = (int) (n2.getx() - n1.getx()) / points;
    int yStep = (int) (n2.gety() - n1.gety()) / points;
    nodes = new ArrayList<Node>();
    nodes.add(n1);
    for (int i = 0; i < points; i++) {
      nodes.add(new RopeNode(0, n1.getx() + (i + 1) * xStep, n1.gety() + (i + 1) * yStep));
    }
  }
}
