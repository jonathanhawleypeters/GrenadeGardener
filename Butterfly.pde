class Butterfly extends Enemy{
 float flapVel = TWO_PI/120;
 float flapLoc = 0;
 
 float d1= 100;
 float d2= 80;
 float d3 = 20;
 float d4 = 30;
 float d5 = 10;
  int targetX, targetY, framesElapsed;
  int health;
  
   void move() {
     
     if(framesElapsed >=120){
       targetX = player.x + int(random(-25,25));
       targetY = player.y + int(random(-25,25));
       framesElapsed = 0;
     }
     
     framesElapsed++;
   }
  
  
  Butterfly (int tempX,int tempY) {
     x = tempX;
     y = tempY;
     framesElapsed = 120;
  }
  


void draw () {
  
  if(x > -200 && x < width + 200) {
  
  noStroke();
  fill(82,165,140);
  quad(x, y, x + d3,y + d1, x + d2 + d4, y + d1 + d3, x + d2, y + d4);
  quad(x, y, x - d3,y + d1, x - d2 - d4, y + d1 + d3, x - d2, y + d4);
  quad(x, y, x + d3,y - d1, x + d2 +d4, y - d1 - d3, x + d2, y - d4);
  quad(x, y, x - d3,y - d1, x - d2 -d4, y - d1 - d3, x - d2, y - d4);
  fill(204,204,255);
  ellipse(x,y,20,110);
  stroke(0);
  line(x ,y -50,x + 10,y -80);
  line(x ,y -50,x - 10,y -80);
  fill(178,102,255);
  noStroke();
  
  //float d1= 100;
 //loat d2= 80;
 //loat d3 = 20;
 //loat d4 = 30;
 //loat d5 = 10;
  
  
  quad(x, y, x + d3 +10,y + d1-10, x + d2 + d4 -10, y + d1 + d3-10, x + d2 -10, y + d4 );
  quad(x, y, x - d3 -10,y + d1 -10, x - d2 - d4 +10, y + d1 + d3-10, x - d2 +10, y + d4);
  quad(x, y, x + d3 +10,y - d1 +10, x + d2 +d4 -10, y - d1 - d3+10, x + d2, y - d4 -10);
  quad(x, y, x - d3 -10,y - d1 +10, x - d2 -d4 + 10, y - d1 - d3+10, x - d2, y - d4 - 10);
  
  float deltaFlap = sin(flapLoc);
  d2 = 55 + 35 * deltaFlap;
  d3 = 20 - 15 * deltaFlap;
  flapLoc += flapVel;
  if(flapLoc > TWO_PI){
    flapLoc =0;
  }
  }
   
}

}