void keyPressed() {
  switch (key) {
    case('w'): case('W'): player.up = true; player.targetDirection = 0; return;
    case('a'): case('A'): player.left = true; player.targetDirection = 3*HALF_PI; return;
    case('s'): case('S'): player.down = true; player.targetDirection = PI; return;
    case('d'): case('D'): player.right = true; player.targetDirection = HALF_PI; return;
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