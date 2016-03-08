class GameManager {
 
  boolean displayHit = false;
  int score, enemiesKilled = 0;
  Grenade[] liveGrenades;
  int numGrenades = 0;
  
  //Level generator Stuff
  int level = 1;
  int levelLength;
  Enemy[] enemies;
  Grass[] grassTufts;
  
  //UI 
  //announceLevel sets alpha on a color and should not exceed 255
  int announceLevel = 255;
  
  GameManager () {
    liveGrenades = new Grenade[20];
    enemies = new Enemy[50];
    grassTufts = new Grass[20];
  }
  
  void displayHit() {
    if(displayHit) {
      fill(255,0,0,random(50,200));
      rect(0,0,width,height);
      translate(random(-20,20),random(-10,10));
    }
    displayHit = false;
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
  
  void drawGrass() {
    for(int i = 0; i < grassTufts.length; i ++) {
      grassTufts[i].draw();
    }
  }
  
  void scrollRight() {
    int mvSpd = player.moveSpeed;
    
    for(int i = 0; i < enemies.length; i++) {
      enemies[i].x -= mvSpd;
      
    }
    for(int j = 0; j < liveGrenades.length; j++) {
      if(liveGrenades[j] != null) {
         liveGrenades[j].x -= player.moveSpeed;
      }
    }
    for(int k = 0; k < grassTufts.length; k ++) {
      grassTufts[k].x-=mvSpd;
      if(grassTufts[k].x < -200) {
        grassTufts[k].x += width+200;
      }
    }
    
    levelLength -= mvSpd;
    if(levelLength < 0) {
      level++;
      randomSeed(level);
      generateLevel();
      resetLevel();
    }
  }
  
  void generateLevel () {
    
    float xLoc = 0;
    randomSeed(level);
    for(int i = 0; i < enemies.length; i++) {
      xLoc += random(0,400);
      float generate = random(9);
      if(generate < 8) {
      enemies[i] = new Tree(int(xLoc), int(random(height)), color(0,255,0), 50);
      } else {
      enemies[i] = new Butterfly(int(xLoc), int(random(height)), 100);
      }
      
      if(i == enemies.length-1) {
        levelLength = int(xLoc);
      }
      
    }
  }
  
  void generateGrass() {
    for(int i = 0; i < grassTufts.length; i ++) {
       grassTufts[i] = new Grass(int(random(width)), int(random(height)));
    }
  }
  
  void resetLevel() {
    player.x = width/2;
    player.y = height/2;
    announceLevel = 180;
  }
  
  //User Interface - writes valuable info on screen
  void ui() {
    
    if(announceLevel > 0) {
    noStroke();
    fill(255,255,255,announceLevel);
    rect(0,0,width,height);
    fill(0);
    rect(width/2 - 40, height/2 - 20, 80, 40);
    fill(255);
    text("Level " + level, width/2 - 20, height/2);
    announceLevel--;
    }
  
  }
}