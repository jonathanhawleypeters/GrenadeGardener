//Hi! -Jonathan
//created 2.29.16

Gardener player;
GameManager gm;

void setup() {
  fullScreen();
  noStroke();
  player = new Gardener(width/2,height/2);
  gm = new GameManager();
  gm.generateLevel();
  cursor(CROSS);
}

void draw() {
   background(255);
   player.move();
   player.draw();
   gm.manageGrenades();
   gm.manageEnemies();
   
}