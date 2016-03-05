//Hi! -Jonathan
//created 2.29.16

Gardener player;

void setup() {
  fullScreen();
  noStroke();
  player = new Gardener(width/2,height/2);
  cursor(CROSS);
}

void draw() {
   background(255);
   player.move();
   player.draw();
}