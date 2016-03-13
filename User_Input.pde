void keyPressed() {

    if(keyCode == UP) {
        player.up = true; 
        player.targetFacing = 0; 
        return;
    }
    if(keyCode == LEFT) {
      player.left = true; 
      player.targetFacing = 3*HALF_PI; 
      return;
    }
    if(keyCode == RIGHT) {
      player.right = true; 
      player.targetFacing = HALF_PI; 
      return;
    }
    if(keyCode == DOWN) {
      player.down = true; 
      player.targetFacing = PI; 
      return;
    }
   
   switch (key) {
    case('w'): case('W'): player.up = true; player.targetFacing = 0; return;
    case('a'): case('A'): player.left = true; player.targetFacing = 3*HALF_PI; return;
    case('s'): case('S'): player.down = true; player.targetFacing = PI; return;
    case('d'): case('D'): player.right = true; player.targetFacing = HALF_PI; return;
    
    case('e'): case('E'): player.swordAttack(); return;
    case('Q'): exit(); return;
    case('p'): case('P'): gm.paused=!gm.paused; if(gm.paused) {noLoop(); fill(0); rect(width/7*2,height/5,width/7,height/5*3); rect(width/7*4,height/5,width/7,height/5*3); } else if (!gm.paused) {loop();} return;
    case('y'): case('Y'): if(gm.gameOver) {setupGame(); gm.menu = false; loop(); } return;
    case('n'): case('N'): if(gm.gameOver) {exit();} return;
    case('m'): case('M'): gm.menu = !gm.menu; if(!gm.menu) {loop();} return;
    case('r'): case('R'): gm.level = 1; setupGame(); gm.menu = false; return;

  }
}

void keyReleased() {
  
    if(keyCode == UP) {
      player.up = false; 
      checkFacing();
      return;
      }
    if(keyCode == LEFT) {
      player.left = false; 
      checkFacing();
      return;
      }
    if(keyCode == RIGHT) {
      player.right = false; 
      checkFacing();
      return;
      }
    if(keyCode == DOWN) {
      player.down = false; 
      checkFacing();
      return;
      }
    switch (key) {
    case('w'): case('W'): player.up = false; checkFacing(); return;
    case('a'): case('A'): player.left = false; checkFacing(); return;
    case('s'): case('S'): player.down = false; checkFacing(); return;
    case('d'): case('D'): player.right = false; checkFacing(); return;
  }
}

void mousePressed() {
  if(mouseButton == LEFT) {
    player.grenadeAttack(); return;
  }

}

void checkFacing() {
  if(player.up) {
    player.targetFacing = 0; 
    return;
  }
  if(player.left) {
    player.targetFacing = 3*HALF_PI; 
    return;
  }
   if(player.down) {
     player.targetFacing = PI; return;
   }
   if(player.right) {
     player.targetFacing = HALF_PI; return;
   }
    

}