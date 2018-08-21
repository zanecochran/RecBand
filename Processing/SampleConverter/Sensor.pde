import processing.serial.*;

Serial myPort;  // Create object from Serial class
char val;      // Data received from the serial port

int lf = 10;    // Linefeed in ASCII
String myString = null;

ArrayList<PVector> accel; 
ArrayList<PVector> gyro;
ArrayList<PVector> graph;

void initSensor() {
  printArray(Serial.list());
  String portName = Serial.list()[portNum];
  myPort = new Serial(this, portName, 9600);

  // Clear first sensor reading
  myPort.clear();
  myString = myPort.readStringUntil(lf);
  myString = null;
  
  accel = new ArrayList<PVector>();
  gyro = new ArrayList<PVector>();
  graph = new ArrayList<PVector>();
}

void getSensor() {
  String raw = "";
  if ( myPort.available() > 0) {  // If data is available,
    myString = myPort.readStringUntil(lf);
    if (myString != null) {
      myString = trim(myString);
      
      String[] vals = split(myString, ',');
      
      if (vals.length > 2){
        int ax = Integer.parseInt(vals[0]);
        int ay = Integer.parseInt(vals[1]);
        int az = Integer.parseInt(vals[2]);
        PVector a = new PVector(ax, ay, az);
        
        if(streamData){println(a); graph.add(a);}
        if (isRecord){accel.add(a);}      // Save values if recording
      }
    }
  }
  
  if (isRecord && accel.size() >= 100){
    if(isEvaluate){evaluate();}
    else{processData();}    // Process Data Array
    isRecord = false; 
  }
  else{
      text("Samples Remaining: " + (100 - accel.size()), 100, 130);
  }
}