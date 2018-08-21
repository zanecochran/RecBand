// Acceleromter Band
// Zane Cochran

#include <SoftwareSerial.h>
SoftwareSerial mySerial(0, 1); // Pin 3 RX -> BT TX, Pin 4 TX -> BT RX

int aX = 1;   // X Axis on Pin 0
int aY = 2;   // Y Axis on Pin 1
int aZ = 3;   // Z Axis on Pin 2

void setup() {
  mySerial.begin(9600);
}

void loop() {
  int rawX = analogRead(aX);
  int rawY = analogRead(aY);
  int rawZ = analogRead(aZ);

  mySerial.print(rawX); mySerial.print(","); 
  mySerial.print(rawY); mySerial.print(","); 
  mySerial.print(rawZ); mySerial.println();

  delay(10);
}
