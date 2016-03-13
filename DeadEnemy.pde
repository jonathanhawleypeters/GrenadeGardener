class DeadEnemy extends Enemy {

  
  int d; //diameter

  //array of dead location offsets
  int[] offsetX = new int [20]; //x coordinate storage
  int[] offsetY = new int [20]; //y coordinate storage
  int[] offsetD = new int [20]; //diameter

  //color
  color deadColor;

  //constructor
   DeadEnemy (int x2, int y2, int d2, color c) {
    x = x2;
    y = y2;
    d = d2;
    deadColor = c;
    health = 1000000;

    //inputting values into array //generating offsets
    for (int i = 0; i < offsetX.length; i++) {
      offsetX[i] = (int)random(5-i*5, 5+i*5);
      offsetY[i] = (int)random(5-i*5, 5+i*5);
      offsetD[i] = (int)random(5, 35);
    }
  }

  void draw () {
    for (int i = 0; i < offsetX.length; i++) {
      fill(deadColor);
      noStroke();
      ellipse(x + offsetX[i], y + offsetY[i], d + offsetD[i], d + offsetD[i]);
    }
  }
}