class GameManager {
  boolean grenadeMode = false;
  int score, enemiesKilled = 0;
  Grenade[] liveGrenades;
  int numGrenades = 0;
  
  //Level generator Stuff
  int level = 0;
  Enemy[] enemies;
  
  GameManager () {
    liveGrenades = new Grenade[20];
    enemies = new Enemy[50];
  }
  
  void manageGrenades() {
    
    for (int i = 0; i < liveGrenades.length; i++) {
      //need to remove exploded grenades
      
    if(gm.liveGrenades[i] != null) {
      
      //move() has to happen first, because draw sometimes sets the object to null
      //calling move() after that crashes the program
      gm.liveGrenades[i].move();
      gm.liveGrenades[i].draw(i);
    }
    
    }

  }
  
  void manageEnemies() {
    for(int i = 0; i < enemies.length; i++) {
      enemies[i].draw();
    }
  }
  
  void generateLevel () {
    
    float xLoc = 0;
    randomSeed(level);
    for(int i = 0; i < enemies.length; i++) {
      xLoc += random(50,500);
      enemies[i] = new Tree(int(xLoc), int(random(height)), color(0,255,0));
    }
  }
}