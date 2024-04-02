/*

  Advanced BH1750 library usage example

  This example has some comments about advanced usage features.

  Connections

  - VCC to 3V3 or 5V
  - GND to GND
  - SCL to SCL (A5 on Arduino Uno, Leonardo, etc or 21 on Mega and Due, on
    esp8266 free selectable)
  - SDA to SDA (A4 on Arduino Uno, Leonardo, etc or 20 on Mega and Due, on
    esp8266 free selectable)
  - ADD to (not connected) or GND

  ADD pin is used to set sensor I2C address. If it has voltage greater or equal
  to 0.7VCC voltage (e.g. you've connected it to VCC) the sensor address will be
  0x5C. In other case (if ADD voltage less than 0.7 * VCC) the sensor address
  will be 0x23 (by default).

*/

#include <BH1750.h>
#include <Wire.h>

#include "Filter.h"

ExponentialFilter<long> FilterRange(5, 0);

#define LOWCC1 16
#define HIGHCC1 LOWCC1 + 32



/*
  BH1750 can be physically configured to use two I2C addresses:
    - 0x23 (most common) (if ADD pin had < 0.7VCC voltage)
    - 0x5C (if ADD pin had > 0.7VCC voltage)

  Library uses 0x23 address as default, but you can define any other address.
  If you had troubles with default value - try to change it to 0x5C.

*/
BH1750 lightMeter(0x5c);

// the MIDI channel number to send messages
const int channel = 1;

// the MIDI continuous controller for each analog input
const int controllerA0 = 16; // 10 = pan position


float n0;
float previousA0 = -1;

float minVal = 1.00;
float maxVal = 10000.00;


uint16_t pentatonicTable[54] = { 0,1,3,6,8,10,13,15,18,20,22,25,27,30,32,34,37,39,42,44,46,49,51,54,56,58,61,63,66,68,70,73,75,78,80,82,85,87,90,92,94,97,99,102,104,106,109,111,114,116,118,121,123,126 };

uint16_t mapPentatonic(uint16_t input) {
  uint8_t value = (input) / (maxVal/53);
  return (pentatonicTable[value]);
}

const boolean debug = false;

void setup() {

  pinMode(LED_BUILTIN, OUTPUT);

  if (debug)
  {
    Serial.begin(115200);

    while (!Serial) {
      //Wait for USB serial port to connect. Needed for native USB port only
    }
  }

  // Initialize the I2C bus (BH1750 library doesn't do this automatically)
  Wire.begin();
  
  // On esp8266 you can select SCL and SDA pins using Wire.begin(D4, D3);

  /*

    BH1750 has six different measurement modes. They are divided in two groups;
    continuous and one-time measurements. In continuous mode, sensor
    continuously measures lightness value. In one-time mode the sensor makes
    only one measurement and then goes into Power Down mode.

    Each mode, has three different precisions:

      - Low Resolution Mode - (4 lx precision, 16ms measurement time)
      - High Resolution Mode - (1 lx precision, 120ms measurement time)
      - High Resolution Mode 2 - (0.5 lx precision, 120ms measurement time)

    By default, the library uses Continuous High Resolution Mode, but you can
    set any other mode, by passing it to BH1750.begin() or BH1750.configure()
    functions.

    [!] Remember, if you use One-Time mode, your sensor will go to Power Down
    mode each time, when it completes a measurement and you've read it.

    Full mode list:

      BH1750_CONTINUOUS_LOW_RES_MODE
      BH1750_CONTINUOUS_HIGH_RES_MODE (default)
      BH1750_CONTINUOUS_HIGH_RES_MODE_2

      BH1750_ONE_TIME_LOW_RES_MODE
      BH1750_ONE_TIME_HIGH_RES_MODE
      BH1750_ONE_TIME_HIGH_RES_MODE_2

  */

  // begin returns a boolean that can be used to detect setup problems.
  if (lightMeter.begin(BH1750::CONTINUOUS_LOW_RES_MODE)) {
    if (debug)Serial.println(F("BH1750 Advanced begin"));
  } else {
    if (debug)Serial.println(F("Error initialising BH1750"));
    while (true) {
      digitalWrite(LED_BUILTIN, HIGH);
      delay(500);
      digitalWrite(LED_BUILTIN, LOW);
      delay(500);
    } // Stop forever
  }
}

void loop() {
  digitalWrite(LED_BUILTIN, HIGH);
  if (lightMeter.measurementReady()) {

    FilterRange.Filter(lightMeter.readLightLevel());
    float lux = FilterRange.Current();
   
    n0 = lux;
    
    if (n0 != previousA0) {
      usbMIDI.sendControlChange(controllerA0, constrain (map (n0, minVal , maxVal, 0, 127), 0, 127), channel);
      usbMIDI.sendNoteOn(mapPentatonic(n0), 99, channel);  // 60 = C4
      delay(10);
      usbMIDI.sendNoteOff(mapPentatonic(n0), 0, channel);  // 60 = C4
      //14bit
      //usbMIDI.sendControlChange(HIGHCC1, FilterRange.Current() & 0x7F, 1);
      //usbMIDI.sendControlChange(LOWCC1, (FilterRange.Current() >> 7) & 0x7F, 1);
      
      previousA0 = n0;
    }

    if (debug) {
      Serial.print("Light: ");
      Serial.print(lux);
      Serial.println(" lx");
    }
    delay(5);
    digitalWrite(LED_BUILTIN, LOW);
    delay(5);
  }
  // MIDI Controllers should discard incoming MIDI messages.
  // http://forum.pjrc.com/threads/24179-Teensy-3-Ableton-Analog-CC-causes-midi-crash
  while (usbMIDI.read()) {
    // ignore incoming messages
  }
}
