#include "Adafruit_VL53L0X.h"

#include "Filter.h"

ExponentialFilter<long> FilterRange(90, 0);


const int channel = 1;
const int controllerA0 = 16;

#define LOWCC1 16
#define HIGHCC1 LOWCC1 + 32

int n0;
int previousA0 = -1;

Adafruit_VL53L0X lox = Adafruit_VL53L0X();

boolean debug = false;

int minValue = 20;
int maxValue = 350;


uint16_t pentatonicTable[54] = { 0,1,3,6,8,10,13,15,18,20,22,25,27,30,32,34,37,39,42,44,46,49,51,54,56,58,61,63,66,68,70,73,75,78,80,82,85,87,90,92,94,97,99,102,104,106,109,111,114,116,118,121,123,126 };

uint16_t mapPentatonic(uint16_t input) {
  uint8_t value = (input) / (maxValue/53);
  return (pentatonicTable[value]);
}

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  if (debug) Serial.begin(115200);

  // wait until serial port opens for native USB devices
  if (debug) {
    while (! Serial) {
      delay(1);
    }
  }


  //if (debug) Serial.println("Adafruit VL53L0X test");
  if (!lox.begin()) {
    //if (debug) Serial.println(F("Failed to boot VL53L0X"));
    while (1) {
      digitalWrite(LED_BUILTIN, HIGH);
      delay(500);
      digitalWrite(LED_BUILTIN, LOW);
      delay(500);
    }
    // power
    //if (debug) Serial.println(F("VL53L0X API Simple Ranging example\n\n"));
  }
}
void loop() {
  digitalWrite(LED_BUILTIN, HIGH);
  VL53L0X_RangingMeasurementData_t measure;

  //Serial.print("Reading a measurement... ");
  lox.rangingTest(&measure, false); // pass in 'true' to get debug data printout!

  if (measure.RangeStatus != 4) {  // phase failures have incorrect data
    //if (debug) Serial.print("Distance (mm): ");
    //int n0 = measure.RangeMilliMeter;
    FilterRange.Filter(measure.RangeMilliMeter);

    n0 = FilterRange.Current();

    if (debug) Serial.println(n0);

    if (n0 != previousA0) {

      //14bit
      //usbMIDI.sendControlChange(HIGHCC1, FilterRange.Current() & 0x7F, 1);
      //usbMIDI.sendControlChange(LOWCC1, (FilterRange.Current() >> 7) & 0x7F, 1);
      if (n0 > minValue){
      usbMIDI.sendControlChange(controllerA0, map(n0, minValue, maxValue, 0, 127), channel);
      usbMIDI.sendNoteOn(mapPentatonic(n0), 100, channel);
      delay(10);
      usbMIDI.sendNoteOff(mapPentatonic(n0), 100, channel);
      }
      previousA0 = n0;
    }

  } else {
    //if (debug) Serial.println(" out of range ");
  }
  while (usbMIDI.read()); // read and discard any incoming MIDI messages
  digitalWrite(LED_BUILTIN, LOW);
  delay(5);
}
