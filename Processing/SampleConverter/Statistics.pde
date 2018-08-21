// Calculate Standard Deviation

void processData(){
  
  String outputData = "";
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
    
    if (i == 0){outputData = xAvg + "," + xSD + "," + yAvg + "," + ySD + "," + zAvg + "," + zSD;}
    else{outputData += "," + xAvg + "," + xSD + "," + yAvg + "," + ySD + "," + zAvg + "," + zSD;}
    
  }  
  outputData += "," + gestures[curGesture];
  
  println(outputData);
  
  output.println(outputData);
  
  accel = new ArrayList<PVector>();  // Clear out array
}

float stdev(ArrayList<Float> t){
  float mn = arrayMean(t, false);  // Mean of Given Array
  
  // Mean Square
  ArrayList<Float> mnsqr = new ArrayList<Float>();
  for (int i = 0; i < t.size(); i++){
    float ms = pow((t.get(i) - mn), 2);
    mnsqr.add(ms);
  }
  
  float msd = arrayMean(mnsqr, true);
  return sqrt(msd);
  
}

float arrayMean(ArrayList<Float> t, boolean sub){
  float meanSum = 0.0;
  for (int i = 0; i < t.size(); i++){
    meanSum += t.get(i);
  }
  
  float mean;
  if (sub){mean = meanSum/(t.size() - 1);}
  else{mean = meanSum/t.size();}
  
  return mean;
}