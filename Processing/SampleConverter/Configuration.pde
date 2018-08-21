// Configure Settings

int totalSamples = 100;  // Total of samples per gesture
int windows = 5;     // Number of windows to break each gesture into (must be a factor of totalSamples)

String username = "Zane Cochran";                              // Your Name
String filename = "ZCdata.arff";                                 // File Name (must be .arff)
String title = "Accelerometer Gestures";                       // File Title
String[] gestures = {"Texting", "Nothing"};   // List of Gestures Captured
boolean useSample = false;  // Use sample data for testing

int portNum = 1;  // Port Number to Connect

/*

CONTROLS
  q - Outputs the data file and quits the program.
  SPACE - Toggles streaming data
  p - Saves a screenshot
  r - Toggles record mode
  e - Toggles evaulation mode
  UP - Cycles through gestures
*/