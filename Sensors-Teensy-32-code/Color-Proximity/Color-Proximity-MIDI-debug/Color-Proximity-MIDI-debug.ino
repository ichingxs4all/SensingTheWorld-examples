/*
  APDS9960 - All sensor data from APDS9960

  This example reads all data from the on-board APDS9960 sensor of the
  Nano 33 BLE Sense:
   - color RGB (red, green, blue)
   - proximity
   - gesture
  and prints updates to the Serial Monitor every 100 ms.

  The circuit:
  - Arduino Nano 33 BLE Sense

  This example code is in the public domain.
*/

#include "Filter.h"
#define EXPFILTER 30


ExponentialFilter<long> FilterR(EXPFILTER, 0);
ExponentialFilter<long> FilterG(EXPFILTER, 0);
ExponentialFilter<long> FilterB(EXPFILTER, 0);
ExponentialFilter<long> FilterPR(EXPFILTER, 0);

int ccr = 16;
int ccg = 17;
int ccb = 18;
int ccpr = 19;

int noteUp = 50;
int noteDown = 52;
int noteLeft = 54;
int noteRight = 56;

 
// the MIDI channel number to send messages
const int channel = 1;

#include <Arduino_APDS9960.h>

boolean debug = true;

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  if(debug)Serial.begin(115200);
  //while (!Serial); // Wait for serial monitor to open

  if (!APDS.begin()) {
    if (debug) Serial.println("Error initializing APDS9960 sensor.");
    while (true){
      digitalWrite(LED_BUILTIN, HIGH);
      delay(500);
      digitalWrite(LED_BUILTIN, LOW);
      delay(500);
    } // Stop forever
    }
  }


int proximity = 0;
int r = 0, g = 0, b = 0;
unsigned long lastUpdate = 0;

void loop() {
 digitalWrite(LED_BUILTIN, HIGH);
  // Check if a proximity reading is available.
  if (APDS.proximityAvailable()) {
    //proximity=APDS.readProximity();
    FilterPR.Filter(APDS.readProximity());
    
    usbMIDI.sendControlChange(ccpr,FilterPR.Current()/2,channel);
    delay(10);
  }

  // check if a gesture reading is available
  if (APDS.gestureAvailable()) {
    int gesture = APDS.readGesture();
    switch (gesture) {
      case GESTURE_UP:
        if(debug)Serial.println("Detected UP gesture");
        usbMIDI.sendControlChange(noteUp,127,channel);
        usbMIDI.sendNoteOn(noteUp, 100, channel);
        delay(10);
        usbMIDI.sendNoteOff(noteUp, 100, channel);
        usbMIDI.sendControlChange(noteUp,0,channel);
        delay(10);
        break;

      case GESTURE_DOWN:
        if(debug)Serial.println("Detected DOWN gesture");
        usbMIDI.sendControlChange(noteDown,127,channel);
        usbMIDI.sendNoteOn(noteDown, 100, channel);
        delay(10);
        usbMIDI.sendNoteOff(noteDown, 100, channel);
        usbMIDI.sendControlChange(noteDown,0,channel);
        delay(10);
        break;

      case GESTURE_LEFT:
        if(debug)Serial.println("Detected LEFT gesture");
        usbMIDI.sendControlChange(noteLeft,127,channel);
        usbMIDI.sendNoteOn(noteLeft, 100, channel);
        delay(10);
        usbMIDI.sendNoteOff(noteLeft, 100, channel);
        usbMIDI.sendControlChange(noteLeft,0,channel);
        delay(10);
        break;

      case GESTURE_RIGHT:
        if(debug)Serial.println("Detected RIGHT gesture");
        usbMIDI.sendControlChange(noteRight,127,channel);
        usbMIDI.sendNoteOn(noteRight, 100, channel);
        delay(10);
        usbMIDI.sendNoteOff(noteRight, 100, channel);
        usbMIDI.sendControlChange(noteRight,0,channel);
        delay(10);
        break;

      default:
        // ignore
        break;
    }
  }

  // check if a color reading is available
  if (APDS.colorAvailable()) {
    APDS.readColor(r, g, b);
    FilterR.Filter(r);
    FilterG.Filter(g);
    FilterB.Filter(b);
    usbMIDI.sendControlChange(ccr,FilterR.Current()/4,channel);
    usbMIDI.sendControlChange(ccg,FilterG.Current()/4,channel);
    usbMIDI.sendControlChange(ccb,FilterB.Current()/4,channel);
   delay(10);
  }


  // Print updates every 100ms
  if (millis() - lastUpdate > 100) {
    lastUpdate = millis();
    if(debug){
   //Serial.print("PR=");
   Serial.print(FilterPR.Current());
   //Serial.print(" rgb=");
   Serial.print(",");
   Serial.print(FilterR.Current());
   Serial.print(",");
   Serial.print(FilterG.Current());
   Serial.print(",");
   Serial.print(FilterB.Current());
    Serial.println();
    }
  }
  digitalWrite(LED_BUILTIN, LOW);
  // i think if you remove these last two lines everything breaks and things are sad and people cry
  while (usbMIDI.read()); // read and discard any incoming MIDI messages
  delay(10);
}
