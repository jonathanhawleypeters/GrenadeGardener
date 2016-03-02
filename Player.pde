class Gardener {
  
   int x, y;
   int moveSpeed = 5;
   int health = 10;
   int grenades = 10;
   boolean alive;
   float facing, targetDirection = 0; //direction player is facing and moving toward in radians
   float turnInc = TWO_PI/30;
   boolean up, down, left, right = false;
   
   Gardener(int startingX, int startingY) {
     x = startingX;
     y = startingY;
     alive = true;
   }
   
   void draw() {
     pushMatrix();
     translate(x,y);
     //rotate(turnRadians());
     fill(200);
     rect(-40,-20,80,40);
     fill(100);
     ellipse(0,0,35,35);
     popMatrix();
   }
   
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
     float dif = facing-targetDirection;
     if (dif == 0)
     return facing;
     if (abs(dif) <= turnInc) {
       facing = targetDirection;
       return facing;
     } else {
       if (dif > 0) {
         facing -= turnInc;
         if (facing > TWO_PI){
           facing -= TWO_PI;
         }
         return facing;
       }
       if (dif < 0)
         facing += turnInc;
         if (facing > TWO_PI)
           facing -= TWO_PI;
          
     }
     return facing;
       
   }
   
   void swordAttack () {
   
   }
   
   void grenadeAttack() {
   
   }
   
   
}