public class Rope {
  private ArrayList<Node> nodes;

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
    for(int i = 0; i - 1 < nodes.size(); i++) {
      nodes.get(i).display();
      line(nodes.get(i).getx(), nodes.get(i).gety(), nodes.get(i + 1).getx(), nodes.get(i + 1).gety());
    }
  }
  
  public Rope(int x1, int y1, int x2, int y2) {
    nodes = new ArrayList<Node>();
    nodes.add(new StaticNode(new PVector(x1, y1)));
    for (int i = 1; i < ceil((float) (dist(x1, y1, x2, y2) / len)); i++) {
      nodes.add(new RopeNode(1, new PVector(x1 + min(5, x1 - x2) * i, x1 + min(5, y1 - y2) * i), new PVector(0,0)));
    }
  }
}
