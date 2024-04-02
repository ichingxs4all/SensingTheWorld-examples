

#include "Filter.h"

ExponentialFilter<long> Filter(20, 0);


int calib = 0;
int touchvalue = 0;

boolean debug = false;

int minVal = 1100;
int maxVal = 1800;

const int tresHold = 35;
const int divider = 3;


uint16_t pentatonicTable[54] = { 0,1,3,6,8,10,13,15,18,20,22,25,27,30,32,34,37,39,42,44,46,49,51,54,56,58,61,63,66,68,70,73,75,78,80,82,85,87,90,92,94,97,99,102,104,106,109,111,114,116,118,121,123,126 };

uint16_t mapPentatonic(uint16_t input) {
  uint8_t value = (input-200) / (maxVal/53);
  return (pentatonicTable[value]);
}

// the MIDI channel number to send messages
const int channel = 1;

// the MIDI continuous controller for each analog input
const int controllerA0 = 16;

int n0;
int previousA0 = -1;


void setup() {
  // initialize the serial communication:
  if(debug)Serial.begin(115200);
  pinMode(LED_BUILTIN, OUTPUT);
  cal();
}

void loop() {
  digitalWrite(LED_BUILTIN, HIGH);
 
  Filter.Filter(touchRead(0));
  touchvalue = Filter.Current();

if (touchvalue > calib+tresHold){
  
  // wait a bit for the analog-to-digital converter to stabilize after the last
  // reading:
   n0=touchvalue;
  if (n0>maxVal) maxVal= n0;
  
  if (n0 != previousA0) {
    if(debug) Serial.println(n0);
    usbMIDI.sendControlChange(controllerA0, constrain (map (n0, calib , maxVal, 0, 127), 0, 127), channel);
    
    usbMIDI.sendNoteOn(mapPentatonic(n0), 99, channel); // 60 = C4
    delay(10);
    usbMIDI.sendNoteOff(mapPentatonic(n0), 0, channel); // 60 = C4
    delay((maxVal-n0)/divider);
    previousA0 = n0;
  }
  
  }

  
  while (usbMIDI.read()); // read and discard any incoming MIDI messages
  digitalWrite(LED_BUILTIN, LOW);
  delay(10);

}

void cal() {
  if(debug)Serial.println("Calibrating !");
  for (int i = 0; i <= 255; i++) {

    digitalWrite(LED_BUILTIN, HIGH);
    calib = calib + touchRead(0);
    delay(10);
    digitalWrite(LED_BUILTIN, LOW);
  }

  calib = calib / 255;
  if(debug){
  Serial.print("Calibration value = ");
  Serial.println(calib);
  }
  delay(2000);
}
