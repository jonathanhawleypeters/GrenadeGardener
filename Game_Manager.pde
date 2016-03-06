class GameManager {
  boolean grenadeMode = false;
  int score, enemiesKilled = 0;
  Grenade[] liveGrenades;
  int numGrenades = 0;
  
  GameManager () {
    liveGrenades = new Grenade[20];
  }
  
  void manageGrenades() {
    
    for (int i = 0; i < liveGrenades.length; i++) {
      //need to remove exploded grenades
      
    if(gm.liveGrenades[i] != null) {
      gm.liveGrenades[i].draw();      
      gm.liveGrenades[i].move();
    }
    
    }

  }
}