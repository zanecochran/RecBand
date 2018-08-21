// Write a custom evaluation algorithm

String evalGuess = "";

float[][] evalStats = new float[5][6];  // 5 Windows, 6 stats (0 - xMean, 1- xStDev, 2 - yMean, 3- yStDev, 4 - zMean, 5 - zStDev)

// Create a Custom Evaluation
void evaluate(){
  evaluateData();  // Process unknown data
  evalGuess = "Unknown";  // Initialize evalGuess to Unknown
  
  /* CUSTOM EVALUATION PROGRAM HERE *************************/
  
  
  
  /* END CUSTOM EVALUATION **********************************/
  
  
  /*
  
  // SAMPLE EVALUATION
  if(evalStats[0][0] <= 395){
    evalGuess = "Texting"; 
  }
  else{
    evalGuess = "Nothing"; 
  }
  
  */
}

void evaluateData(){
  
  // Process Data Windows
  for (int i = 0; i < windows; i++){
    ArrayList<Float> x = new ArrayList<Float>();
    ArrayList<Float> y = new ArrayList<Float>();
    ArrayList<Float> z = new ArrayList<Float>();
    
    int windowSamples = totalSamples/windows;

    for (int j = 0; j < windowSamples; j++){
      int index = i * j;
      PVector p = accel.get(index);
      x.add(p.x);
      y.add(p.y);
      z.add(p.z);
    }
    
    float xAvg = arrayMean(x, false); float xSD = stdev(x);
    float yAvg = arrayMean(y, false); float ySD = stdev(y);
    float zAvg = arrayMean(z, false); float zSD = stdev(z);
    
    evalStats[i][0] = xAvg; evalStats[i][1] = xSD; 
    evalStats[i][2] = yAvg; evalStats[i][3] = ySD; 
    evalStats[i][4] = zAvg; evalStats[i][5] = zSD; 
    
  }  
  
  accel = new ArrayList<PVector>();  // Clear out array
}