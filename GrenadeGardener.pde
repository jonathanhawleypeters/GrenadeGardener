//Hi! -Jonathan
//created 2.29.16

/* Things Jonathan Needs to Impliment
  Combat
    Sword animation
  UI add
    health/environmental destruction/kill count
   
*/

//Jonathan's
Gardener player;
GameManager gm;

//Anh's
int userPosX = 325;
int userPosY = 30;
PImage userInfo; 
PImage menuScreen;
PImage deadScreen;

DeadEnemy dead;


void setup() {
  frameRate(30);
  fullScreen();
  noStroke();
  cursor(CROSS);
    
  //Anh's
  pixel = loadFont("pixel.vlw");


  menuScreen = loadImage("menuScreen.png");
  deadScreen = loadImage("deadScreen.png");
  userInfo = loadImage("userInfo.png");
  userInfo.resize(0, 90);

  setupGame();
}

void draw() {
   background(50,100,50);
   
   gm.displayHit();
   gm.drawGrass();
   gm.manageEnemies(false);   
   player.move();
   player.draw();
   gm.manageEnemies(true);
   gm.manageGrenades();
   gm.ui();
   fill(0);
   text(frameRate, 100, 100);
   

}

void setupGame() {
  //Jonathan's
  player = new Gardener(width/3 + 100,height/2);
  gm = new GameManager();
  gm.generateLevel();
  gm.generateGrass();
}