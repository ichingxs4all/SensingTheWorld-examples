/*********************************************************
This is a library for the MPR121 12-channel Capacitive touch sensor

Designed specifically to work with the MPR121 Breakout in the Adafruit shop 
  ----> https://www.adafruit.com/products/

These sensors use I2C communicate, at least 2 pins are required 
to interface

Adafruit invests time and resources providing this open source code, 
please support Adafruit and open-source hardware by purchasing 
products from Adafruit!

Written by Limor Fried/Ladyada for Adafruit Industries.  
BSD license, all text above must be included in any redistribution
**********************************************************/

#include <Wire.h>
#include "Adafruit_MPR121.h"

#ifndef _BV
#define _BV(bit) (1 << (bit)) 
#endif

// You can have up to 4 on one i2c bus but one is enough for testing!
Adafruit_MPR121 cap = Adafruit_MPR121();

// Keeps track of the last pins touched
// so we know when buttons are 'released'
uint16_t lasttouched = 0;
uint16_t currtouched = 0;

uint16_t pentatonicTable[54] = { 0,1,3,6,8,10,13,15,18,20,22,25,27,30,32,34,37,39,42,44,46,49,51,54,56,58,61,63,66,68,70,73,75,78,80,82,85,87,90,92,94,97,99,102,104,106,109,111,114,116,118,121,123,126 };

uint16_t mapPentatonic(uint16_t input) {
  uint8_t value = input;
  //uint8_t value = (input-200) / (maxVal/53);
  return (pentatonicTable[value]);
}

// the MIDI channel number to send messages
const int channel = 1;
const int velocity = 100;

const int transPose = 20;

bool debug = false;

void setup() {
  if(debug)Serial.begin(115200);
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, HIGH);
  //while (!Serial) { // needed to keep leonardo/micro from starting too fast!
  //  delay(10);
  //}
  
  if(debug)Serial.println("Adafruit MPR121 Capacitive Touch sensor test"); 
  
  // Default address is 0x5A, if tied to 3.3V its 0x5B
  // If tied to SDA its 0x5C and if SCL then 0x5D
  if (!cap.begin(0x5A)) {
    if(debug)Serial.println("MPR121 not found, check wiring?");
    while (true){
      digitalWrite(LED_BUILTIN, HIGH);
      delay(500);
      digitalWrite(LED_BUILTIN, LOW);
      delay(500);
    } // Stop forever
  }
  if(debug)Serial.println("MPR121 found!");
}

void loop() {
  // Get the currently touched pads
  currtouched = cap.touched();
  
  for (uint8_t i=0; i<12; i++) {
    // it if *is* touched and *wasnt* touched before, alert!
    if ((currtouched & _BV(i)) && !(lasttouched & _BV(i)) ) {
      if(debug)Serial.print(i); Serial.println(" touched");
      digitalWrite(LED_BUILTIN, HIGH);
      usbMIDI.sendNoteOn(pentatonicTable[transPose+i], velocity, channel); // 60 = C4
    }
    // if it *was* touched and now *isnt*, alert!
    if (!(currtouched & _BV(i)) && (lasttouched & _BV(i)) ) {
      if(debug)Serial.print(i); Serial.println(" released");
      digitalWrite(LED_BUILTIN, LOW);
      usbMIDI.sendNoteOff(pentatonicTable[transPose+i], 0, channel); // 60 = C4
    }
  }

  // reset our state
  lasttouched = currtouched;

   while (usbMIDI.read()); // read and discard any incoming MIDI messages
  
  delay(10);
}
