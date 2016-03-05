class Grenade {
  int size;
  int x, y, tX, tY;
  boolean exploding = false;
  
  Grenade (int startingX, int startingY, int targetX, int targetY) {
    
    x = startingX;
    y = startingY;
    tX = targetX;
    tY = targetY;
  }
  
  void explode () {
  
  } 
  
  void draw() {
    
   if(!exploding) {
    stroke(0);
    line(x, y-20, x, y-25);
    noStroke();
    fill(150);
    rect(x-5,y-20,10,10);
    ellipse(x,y,25,25);
   } else if (exploding) {
     //update particles from array and draw them
   }
  }
  
  void move(int deltaX, int deltaY) {
    
    //grenades need to move at a uniform speed from their x,y to their tX, tY
    
    x+=deltaX;
    y+=deltaY;
}

}