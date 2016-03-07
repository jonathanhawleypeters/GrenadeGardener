//Grass by Anh

class Grass {
  //placement
  int x;
  int y;

  //array of grass location offsets
  int [] offsetX = new int [20]; //x coordinate storage
  int [] offsetY = new int [20]; //y coordinate storage


  //spacing
  int ysp2;  //5
  int ysp1; //20
  int xsp1; //15 //slants the grass
  int xsp2; //30

  int g = color (152, 255, 128); //grass color
  int blade = 2; //grass width

  //constructor
  Grass (int x2, int y2) {
    int gysp2 = 2;
    // x, y coordinate
    x = x2;
    y = y2;

    //inputting values into array //generating offsets
    for (int i=0; i < offsetX.length; i++) {
      offsetX[i] = (int)random (100, 200); // the width of the patch
      offsetY[i] = (int)random (100, 200); // the height of the patch
    }

    //spacing for grass \ | /
    ysp2 = gysp2;  //5
    ysp1 = gysp2*4; //20
    xsp1 = gysp2*3; //15 //slants the grass
    xsp2 = gysp2*6; //30
  }

  void draw () {
    strokeWeight(blade);
    stroke(g);

    for (int i=0; i < offsetX.length; i++) {
      //blades of grass \ | /
      line(x+offsetX[i] - xsp2, y+offsetY[i] - ysp1, (x+offsetX[i] + xsp1) - xsp2, y+offsetY[i] + ysp2); //left
      line(x+offsetX[i], y+offsetY[i]  - ysp1, x+offsetX[i], y+offsetY[i]  + ysp2); //middle
      line(x+offsetX[i] + xsp2, y+offsetY[i]  - ysp1, (x+offsetX[i] - xsp1) + xsp2, y+offsetY[i]  + ysp2); //right
      // adding offsets to create new grass
    }
  }
}