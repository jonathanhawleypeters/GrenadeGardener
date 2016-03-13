class Flower extends Enemy {
  int cir; //size of mid of flower AKA DIAMETER
  int cir2; //outer petal of flower diameter


  int space;

  //color
  color outer = color(200, 10, 40);
  color inner = color(249, 229, 9);
  
  Flower (int flowerX, int flowerY, int tempD) {
    x = flowerX;
    y = flowerY;
    cir = tempD;
    cir2 = tempD*3;
    space = tempD*3;
  }

  void draw () {
    
    if(x > -200 && x < width + 200) {
    noStroke();
    //outer
    fill(outer);
    ellipse(x, y, cir2, cir2);
    //inner
    fill(inner);
    ellipse(x, y, cir, cir);

    //right
    //outer
    fill(outer);
    ellipse(x+space, y, cir2, cir2);
    //inner
    fill(inner);
    ellipse(x+space, y, cir, cir);

    //top
    //outer
    fill(outer);
    ellipse(x+(space)/2, y-(space-10), cir2, cir2);
    //inner
    fill(inner);
    ellipse(x+(space)/2, y-(space-10), cir, cir);
    }
    if (health < 0) {
       gm.environmentalDestruction += 64;
       player.health+=10;
       if(player.health > 100) {
         player.health =100;
       }
       //announce heal
       gm.heal = 30;
       gm.cleanUpDead();
       
    }
  }
}