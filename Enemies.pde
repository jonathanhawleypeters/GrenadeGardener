
//This class exists to be a parent to Butterflies, Trees, and Flowers
//This way, we can have an array of Enemies with Butterflies, Trees, and Flowers in it :)

class Enemy {
  //x and y location, radius
  int x, y, r; 
  int health = 10;
  
  //Enemy(int tempX,int tempY, int tempHealth) {
  //   x = tempX;
  //   y = tempY;
  //   health = tempHealth;
  //}
  void draw () {
    
  }
  
  void checkCollision () {
    float distance = dist(x,y,player.x,player.y);
    int limit = player.r + r;
    
    if(distance < limit) {
     
     float rise = player.y - y;
     float run = player.x - x;
     
     int nudgeY;
     if(rise >= 0) {
       nudgeY = 1;
     } else {
       nudgeY = -1;
     }
     
     int nudgeX;
     if(run >= 0) {
       nudgeX = 1;
     } else {
       nudgeX = -1;
     }
     
     
     player.x += (limit-distance)/limit*run+nudgeX;
     player.y += (limit-distance)/limit*rise+nudgeY;
    }
  }
}