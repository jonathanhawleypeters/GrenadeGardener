class Gardener {
  
   int x, y;
   int r = 40;
   int moveSpeed = 10;
   int health = 100;
   int grenades = 10;
   int swordDamage = 4;
   int swordRadius = 150;
   
   //may not be necessary
   boolean alive;
   
   //used to keep track of which direction the player is facing, may be replaced by another system
   float facing, targetFacing = 0; //direction player is facing and moving toward in radians
   
   //the increment that turn lerping increases every frame
   float lerpInc = 0.1;
   
   float turnLerp = 0;
   
   //new variables for tracking direction. Controlled by WASD (and ARROW keys?) under User_Input
   boolean up, down, left, right = false;
   
   Gardener(int startingX, int startingY) {
     x = startingX;
     y = startingY;
     alive = true;
   }
   
   void draw() {
     
     if(health > 0){
     noStroke();
     pushMatrix();
     translate(x,y);
     rotate(turnRadians());
     fill(200);
     rect(-40,-20,80,40);
     fill(100);
     ellipse(0,0,35,35);
     ellipse(0,-20,5,5);
     popMatrix();
     } else {
     gm.gameOver = true;
     }
   }
   
   //changes X and Y by moveSpeed amount using WASD input
   void move() {
     if(up)
       y-=moveSpeed;
     if(down)
       y+=moveSpeed;
     if(right)
       x+=moveSpeed;
     if(left)
       x-=moveSpeed;
     if(x > width/3) {
       x = width/3;
       gm.scrollRight();
     }
     if(y > height-40)
       y=height-40;
     if(x < 40)
       x = 40;
     if(y < 40)
       y = 40;
   }
   
   //NOT EVEN TESTABLE UNTIL I MOVE CHARACTER!
   float turnRadians() {
     
     if(facing > PI && targetFacing == 0)  
         targetFacing = TWO_PI;
         
     if(facing == 0 && targetFacing == 3 * PI)
         facing = 360;
              
     turnLerp += lerpInc;
     if(turnLerp > 1) {
       turnLerp = 0;
     }
     facing = lerp(facing, targetFacing, turnLerp);
     return facing;
     
   }
   
   void swordAttack () {
     
     //add animation with counter here
     
     for(int i = 0; i < gm.enemies.length; i++) {
       int enX = gm.enemies[i].x;
       int enY = gm.enemies[i].y;
       
       fill(100,100,100,100);
       
       ellipse(x,y,200,200);
       
       if(enX > x - swordRadius && enX < x + swordRadius) {
       if(attackCollide(enX,enY,swordRadius)) {
         gm.enemies[i].health -= swordDamage;
       
         }
       }
     }
     
     
   }
   
   void grenadeAttack() {
      if(gm.numGrenades == gm.liveGrenades.length){
          gm.numGrenades = 0;
      }
      gm.liveGrenades[gm.numGrenades] = new Grenade(x,y,mouseX,mouseY);
      gm.numGrenades ++;
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
   
   
}