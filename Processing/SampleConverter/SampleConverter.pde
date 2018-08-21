// ML Sample Converter
// Zane Cochran
// Version 1.0


/****************************************************************
  Only change values on the Configuration Tab and Evaluate Tab!
****************************************************************/

void setup(){
  size(320, 200);
  dataHeader();  // Write Data File Header
  initSensor();  // Initialize Sensor
}


void draw(){
  background(0);
  
  textAlign(CENTER, CENTER);
  text("CONTROLS", 100, 10);
  text("Start Recording: r", 100, 25);
  text("Change Gesture: Up Arrow", 100, 40);
  text("Close Program: q", 100, 55);
  text("Evaluate Gesture: e", 100, 70);
  
  text("Current Gesture: " + gestures[curGesture], 100, 100);
  text("Recording: " + isRecord, 100, 115);
  
  
  text("Evaluate: " + isEvaluate, 100, 160);
  if (isEvaluate){text("Gesture: " + evalGuess, 100, 175);}
  
  getSensor();
  graphData();
}