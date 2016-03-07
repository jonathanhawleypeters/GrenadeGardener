class Tree extends Enemy {
  
  color treeColor;
  
  Tree (int tempX, int tempY, color tempCol) {
    x = tempX;
    y = tempY;
    treeColor = tempCol;
  }
  
  void draw () {
    noStroke();
    fill(treeColor);
    rect(x-20,y-50,40,100);
  }

}