class GameManager {
  boolean grenadeMode = false;
  int score, enemiesKilled = 0;
  Grenade liveGrenade;
  
  GameManager () {
  
  }
  
  void manageGrenades() {
    if(gm.liveGrenade != null)
      gm.liveGrenade.draw();
  }
}