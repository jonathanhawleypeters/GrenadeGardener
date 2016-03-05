//Hi! -Jonathan
//created 2.29.16

Gardener player;
GameManager gm;

void setup() {
  fullScreen();
  noStroke();
  player = new Gardener(width/2,height/2);
  gm = new GameManager();
  cursor(CROSS);
}

void draw() {
   background(255);
   player.move();
   player.draw();
   gm.manageGrenades();
}


float slope(int x1, int y1, int x2, int y2) {
  float rise = y2 - y1;
  float run = x2 - x1;
  if(run == 0) {
    return 0;
  }
  return rise/run;
}