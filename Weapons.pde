class Grenade {
  int size;
  float x, y, tX, tY, xSpeed, ySpeed, dist;
  int constSpeed = 20;
  int boomCount = 0; //counts frames after grenade explosion
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
  
  void draw(int arrayLoc) {
   
    int location = arrayLoc;
    
   if(!exploding) {
    stroke(0);
    strokeWeight(1);
    line(x, y-20, x, y-25);
    noStroke();
    fill(150);
    rect(x-5,y-20,10,10);
    ellipse(x,y,25,25);
   } else if (exploding) {
      boomCount ++;
      if(boomCount == 15) {
        explode();
      }
      noStroke();
      fill(255,200,75);
      ellipse(x,y,boomCount*30,boomCount*30);

   }
   if (boomCount > 15) {
       gm.liveGrenades[location] = null;
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

  boolean attackCollide (int enemyX, int enemyY, int attackRadius) {
    float distance = dist(x,y,enemyX,enemyY);
    int radius = attackRadius;
    if(distance < radius) {
      return true;
    } else {
      return false;
    }
  }
  
   void explode () {
   
   //add animation with counter here
   
   for(int i = 0; i < gm.enemies.length; i++) {
     int enX = gm.enemies[i].x;
     int enY = gm.enemies[i].y;

     
     if(enX > x - 225 && enX < x + 225) {
     if(attackCollide(enX,enY,225)) {
       gm.enemies[i].health -= 5;
     
       }
     }
   }
   
   
 }

}