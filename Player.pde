class Gardener {
  
   int x, y;
   int moveSpeed = 5;
   int health = 10;
   int grenades = 10;
   
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
     pushMatrix();
     translate(x,y);
     rotate(turnRadians());
     fill(200);
     rect(-40,-20,80,40);
     fill(100);
     ellipse(0,0,35,35);
     ellipse(0,-20,5,5);
     popMatrix();
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
     if(x > width-40)
       x = width-40;
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
   
   }
   
   void grenadeAttack() {
   
   }
   
   
}