//Hi! -Jonathan
//created 2.29.16

/* Things Jonathan Needs to Impliment
  Movement
    movement collision
    butterfly AI
  Combat
    Sword
    Butterfly attack
    weapon collision
    reducing health
    enemy death
    player death
*/

Gardener player;
GameManager gm;

void setup() {
  fullScreen();
  noStroke();
  player = new Gardener(width/3 + 100,height/2);
  gm = new GameManager();
  gm.generateLevel();
  gm.generateGrass();
  cursor(CROSS);
}

void draw() {
   background(181,101,29);
   
   gm.drawGrass();
   player.move();
   player.draw();
   gm.manageEnemies();

   gm.manageGrenades();
   gm.ui();
   fill(0);
   text(frameRate, 100, 100);
}