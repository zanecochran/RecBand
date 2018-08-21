
// Graphs incoming data
void graphData(){
  if (graph.size() > 100){graph.remove(0);}
  for (int i = 1; i < graph.size(); i++){
    int xOff = 200 + i;
    
    PVector p1 = graph.get(i - 1);
    PVector p2 = graph.get(i);
          
    float x1 = map(p1.x, 0, 1023, height, 0);
    float x2 = map(p2.x, 0, 1023, height, 0);

    float y1 = map(p1.y, 0, 1023, height, 0);
    float y2 = map(p2.y, 0, 1023, height, 0);

    float z1 = map(p1.z, 0, 1023, height, 0);
    float z2 = map(p2.z, 0, 1023, height, 0);
    
    stroke(255, 0, 0);
    line(xOff, x1, xOff + 1, x2);
    
    stroke(0, 255, 0);
    line(xOff, y1, xOff + 1, y2);
    
    stroke(0, 0, 255);
    line(xOff, z1, xOff + 1, z2);
  }
}