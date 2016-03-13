PFont pixel;

float maxHealth = 100;
float healthBar = 176;

void health () {
  textFont(pixel, 20);

  noStroke();

  //color
  if (player.health > .7 * maxHealth) {
    fill(0, 255, 0); //red
  } else if (player.health > .5 * maxHealth) {
    fill(255, 200, 0); //yellow
  } else {
    fill(255, 0, 0); //green
  }

  // health/maxHealth = 1, multiply with healthBar = width of  rect
  // ex 50/100 = 0.5 * 200 = 100 <-- new width of bar
  float hp = (player.health / maxHealth)*healthBar;
  rect(userPosX+42, userPosY+48, hp, 17);

  //stroke(0);
  noFill();  
  rect(userPosX+42, userPosY+48, healthBar, 17);
}