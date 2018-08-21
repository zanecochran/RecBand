boolean isRecord = false;  // Record incoming sensor values
boolean isEvaluate = false;  // Record incoming sensor values
boolean streamData = false;// Stream incoming sensor data
int curGesture = 0;        // Current Gesture Recording

void keyPressed() {
  switch(key){
    case 'q': output.flush(); output.close(); exit(); break;
    case ' ': streamData = !streamData; break;
    case 'p': saveFrame("screenshot-######.png"); break;
    case 'r': isRecord = true; break;
    case 'e': isEvaluate = !isEvaluate; break;
    case CODED:
      if (keyCode == UP){curGesture = (curGesture + 1) % gestures.length;}
      break;
  }

}