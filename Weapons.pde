class Grenade {
  int size;
  int x, y, tX, tY;
  
  Grenade (int startingX, int startingY, int targetX, int targetY) {
    
    x = startingX;
    y = startingY;
    tX = targetX;
    tY = targetY;
  }
  
  void explode () {
  
  } 
  
  void draw() {
    stroke(0);
    line(x, y-20, x, y-25);
    noStroke();
    fill(150);
    rect(x-5,y-20,10,10);
    ellipse(x,y,25,25);
  }
  
  void move() {
    
}

}