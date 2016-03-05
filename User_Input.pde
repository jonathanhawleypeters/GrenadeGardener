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
    //case('g'): case('G'): player.grenadeAttack(); return;
    
  }
}

void keyReleased() {
  
    if(keyCode == UP) {
      player.up = false; 
      return;
      }
    if(keyCode == LEFT) {
      player.left = false; 
      return;
      }
    if(keyCode == RIGHT) {
      player.right = false; 
      return;
      }
    if(keyCode == DOWN) {
      player.down = false; 
      return;
      }
    switch (key) {
    case('w'): case('W'): player.up = false; return;
    case('a'): case('A'): player.left = false; return;
    case('s'): case('S'): player.down = false; return;
    case('d'): case('D'): player.right = false; return;
  }
}

void mousePressed() {
  if(mouseButton == LEFT) {
    player.grenadeAttack(); return;
  }

}