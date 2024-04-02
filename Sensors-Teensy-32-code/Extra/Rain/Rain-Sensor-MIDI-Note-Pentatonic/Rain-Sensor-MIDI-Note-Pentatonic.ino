
#include "Filter.h"

// Create a new exponential filter with a weight of 10 and initial value of 0. 
ExponentialFilter<long> ADCFilter(5, 0);

uint16_t pentatonicTable[54] = { 0,1,3,6,8,10,13,15,18,20,22,25,27,30,32,34,37,39,42,44,46,49,51,54,56,58,61,63,66,68,70,73,75,78,80,82,85,87,90,92,94,97,99,102,104,106,109,111,114,116,118,121,123,126 };

uint16_t mapPentatonic(uint16_t input) {
  uint8_t value = (input) / (1024/53);
  return (pentatonicTable[value]);
}

// the MIDI channel number to send messages
const int channel = 1;

// the MIDI continuous controller for each analog input
const int controllerA0 = 16; 

int n0;
int previousA0 = -1;

int minVal = 245;
int maxVal = 1023;

boolean debug = true;

void setup() 
{
  if(debug) Serial.begin(115200);
  
}

void loop() 
{
  int RawValue = analogRead(0);
  
  ADCFilter.Filter(RawValue);

  n0 = ADCFilter.Current();

  if(debug) Serial.println(n0);

  if (n0 != previousA0) {
    
      usbMIDI.sendNoteOn(mapPentatonic(n0), 99, channel);  // 60 = C4
      usbMIDI.sendControlChange(controllerA0, constrain (map (n0, maxVal , minVal, 0, 127),0,127), channel);
      delay(5);
      usbMIDI.sendNoteOff(mapPentatonic(n0), 0, channel);  // 60 = C4
      previousA0 = n0;
    }

while (usbMIDI.read()) {
    // ignore incoming messages
  }
  delay(5);
}
