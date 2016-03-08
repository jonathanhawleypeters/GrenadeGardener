class Tree extends Enemy {
  
 color treeColor;
 float[] leafX;
 float[] leafY;
 int offset = 0;
 
 Tree (int tempX, int tempY, color tempCol, int radius) {
   x = tempX;
   y = tempY;
   r = radius;
   treeColor = tempCol;
   
   leafX = new float[16];
   leafY = new float[16];
   
   float radians = PI/3.8 + random(0,.6);
   
   for (int i = 0; i < leafX.length; i++) {
     float ratio = i+1/(leafX.length - 1);
     leafX[i] = sin(radians*ratio)*i*3;
     leafY[i] = cos(radians*ratio)*i*3;
   }
 }
  
 void draw () {
   
   fill(treeColor);
   for(int i = 0; i < leafX.length; i++) {
    
    if(x > -50 && x < width + 50) {
    stroke(102,51,0);
    strokeWeight(5);
    line(x,y,x+leafX[15-i],y+leafY[15-i]);
    noStroke();
    fill(treeColor, 90);
    ellipse(x+leafX[15-i], y+leafY[15-i], 40, 40);
    
    checkCollision();
    }
   }
 }
 
}

//}

//class Tree extends Enemy {
//  int x, y, treeD;
//  color treeColor;

//  // A Polar coordinate, radius now starts at 0 to spiral outwards
//  float r = 0;
//  float theta = 0;

//  //array of locations offsets
//  float [] offsetX = new float [70]; // x locations
//  float [] offsetY = new float [70]; // y locations

//  //amount of leaves?
//  float[] leaves = new float[70]; //amount of storage

//  //constructor
//  Tree (int tempX, int tempY, color tempCol) {
    
//    x = tempX;
//    y = tempY;
//    treeColor = tempCol;

//    for (int i = 0; i < offsetX.length; i++) {  //length of array
//      offsetX[i] = random (0, 5); //store the theta into array
//      offsetY[i] = random (0, 5); //store the theta into array
//      leaves[i] = random(0.1, 1);
      
//    }
//  }


//  void draw () {

//    for (int i = 0; i < offsetX.length; i++) {  //length of array

//      // Polar to Cartesian conversion
//      float x = r * cos(theta);
//      float y = r * sin(theta);

//      // Draw an ellipse at x,y
//      noStroke();
//      //for (int c = 255; c > 0; c-=15) {
//        fill(treeColor);
//        // Adjust for center of window
//        ellipse(x+offsetX[i]+width/2, y+offsetY[i]+height/2, treeD, treeD);
//      //}

//      for (int j = 0; j < leaves.length; j++) {
//        // Increment the angle
//        theta = offsetX[i] + leaves[i]; //increases the speed

//        // Increment the radius
//        r = offsetX[i] + leaves[i];

//        //as the theta moves, the radius increases, thus spiraling
//      }
//    }
//  }
//}