class Grenade {
  int size;
  float x, y, tX, tY, xSpeed, ySpeed, dist;
  int constSpeed = 5;
  boolean exploding = false;
  
  Grenade (float startingX, float startingY, float targetX, float targetY) {
    
    x = startingX;
    y = startingY;
    tX = targetX;
    tY = targetY;
    dist = dist(x,y,tX,tY);
    if (dist == 0) {
      //Oops!
    exploding = true;
    }
    
    float rise = tY - y;
    float run = tX - x;
    
    xSpeed = run/dist*constSpeed;
    ySpeed = rise/dist*constSpeed;
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
  
  void move() {
    if(dist<=0) {
      exploding = true;
      xSpeed = 0;
      ySpeed = 0;
    }
    x+=xSpeed;
    y+=ySpeed;
    dist -= constSpeed;
}

}