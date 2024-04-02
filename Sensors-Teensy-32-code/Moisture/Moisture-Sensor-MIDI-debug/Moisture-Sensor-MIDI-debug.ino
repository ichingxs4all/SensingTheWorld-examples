
#include "Filter.h"

// Create a new exponential filter with a weight of 10 and initial value of 0. 
ExponentialFilter<long> ADCFilter(10, 0);

// the MIDI channel number to send messages
const int channel = 1;

// the MIDI continuous controller for each analog input
const int controllerA0 = 16; 

int n0;
int previousA0 = -1;

int minVal = 375;
int maxVal = 755;

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
      usbMIDI.sendControlChange(controllerA0, constrain (map (n0, maxVal , minVal, 0, 127),0,127), channel);
      previousA0 = n0;
    }

while (usbMIDI.read()) {
    // ignore incoming messages
  }
  delay(10);
}
