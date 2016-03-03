void keyPressed() {
  switch (key) {
    case('w'): case('W'): player.up = true; player.targetFacing = 0; return;
    case('a'): case('A'): player.left = true; player.targetFacing = 3*HALF_PI; return;
    case('s'): case('S'): player.down = true; player.targetFacing = PI; return;
    case('d'): case('D'): player.right = true; player.targetFacing = HALF_PI; return;
  }
}

void keyReleased() {
    switch (key) {
    case('w'): case('W'): player.up = false; return;
    case('a'): case('A'): player.left = false; return;
    case('s'): case('S'): player.down = false; return;
    case('d'): case('D'): player.right = false; return;
  }
}