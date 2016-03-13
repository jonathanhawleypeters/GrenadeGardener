class GameManager {
 
  boolean displayHit, paused, gameOver = false;
  boolean menu = true;
  
  int environmentalDestruction, enemiesKilled = 0;
  Grenade[] liveGrenades;
  int numGrenades = 0;
  
  //Level generator Stuff
  int level = 1;
  int levelLength;
  Enemy[] enemies;
  Grass[] grassTufts;
  
  //UI 
  //announceLevel sets alpha on a color and should not exceed 255
  int announceLevel = 90;
  int heal = 0;
  
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
  
  void manageEnemies(boolean above) {
    for(int i = 0; i < enemies.length; i++) {
      if(above == enemies[i].abovePlayer) {
      enemies[i].draw();
      }
      
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
      xLoc += random(50,400);
      float generate = random(9);
      
      if(generate < 3) {
      enemies[i] = new Flower(int(xLoc), int(random(height)), 15);
      
      } else 
      
      if(generate >= 3 && generate < 6) {
        
      //regular tree
      enemies[i] = new Tree(int(xLoc), int(random(height)), color(0,255,0), 50, false);
      } else if (generate >= 6 && generate < 8) {
        
      //Poison Tree
      enemies[i] = new Tree(int(xLoc), int(random(height)), color(0,255,0), 50, true);
      } else if (xLoc > 1.5 * width) {
      enemies[i] = new Butterfly(int(xLoc), int(random(height)), 100);
      } else {
        enemies[i] = new Flower(int(xLoc), int(random(height)), 15);
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
    announceLevel = 90;
  }
  
  //User Interface - writes valuable info on screen
  void ui() {
    
    //Anh
    image(userInfo, userPosX, userPosY);
    noStroke();
    health();
    
    fill(0,255,0);
    textFont(pixel, 24);
    text(enemiesKilled,width*2/3,95);

    
    if(announceLevel > 0) {
    noStroke();
    fill(0,0,0,2*announceLevel);
    rect(0,0,width,height);
    fill(0);
    rect(width/2 - 40, height/2 - 20, 80, 40);
    fill(255);
    text("Level " + level, width/2 - 20, height/2);
    announceLevel--;
    }
    
    if(heal>0) {
      heal--;
      fill(0,255,0);
      textFont(pixel, 32);
      text("+10",player.x,player.y+heal);
    }
    
    if(gameOver) {
     noLoop();
     image(deadScreen,(width-deadScreen.width)/2,(height-deadScreen.height)/2);
    }
    
    if(menu){
      noLoop();
     image(menuScreen,(width-menuScreen.width)/2,(height-menuScreen.height)/2);
    }
    
    
  
  }
  
  void cleanUpDead() {
    
    enemiesKilled++;
    for(int i = 0; i < enemies.length; i++) {
      if(enemies[i].x > -200 && enemies[i].x < width + 200) {
          if(enemies[i].health <=0) {
            enemies[i] = new DeadEnemy(enemies[i].x,enemies[i].y,10,color(132, 67, 9, 75));
          }
      }
      
    }
  }
}