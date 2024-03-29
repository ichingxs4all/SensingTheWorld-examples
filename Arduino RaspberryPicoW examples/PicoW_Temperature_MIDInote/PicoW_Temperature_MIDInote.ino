// Pico W example of sending MIDI note messages with the internal temperature of the board
// ichingxs4all

#include <Arduino.h>
#include <Adafruit_TinyUSB.h>
#include <MIDI.h>

// USB MIDI object
Adafruit_USBD_MIDI usb_midi;

// Create a new instance of the Arduino MIDI Library,
// and attach usb_midi as the transport.
MIDI_CREATE_INSTANCE(Adafruit_USBD_MIDI, usb_midi, MIDI);

float f;  // the float f will hold the temperature value

bool debug = false;  //set to false if no serial debug is needed

int tempo = 100;  //The tempo of how fast the readings will be transmitted in msecs

bool ledState;  //The boolean ledState will hold the state of the build in led

int note; //This wil hold note beeing played

const int noteLength = 100;  //This wil hold the noteLength in mSecs
const int midiChannel = 1; //The midi channel we send on
const int velocity = 100; //The velocity of the note beeing send 

void setup() {
#if defined(ARDUINO_ARCH_MBED) && defined(ARDUINO_ARCH_RP2040)
  // Manual begin() is required on core without built-in support for TinyUSB such as mbed rp2040
  TinyUSB_Device_Init(0);
#endif

  MIDI.begin(MIDI_CHANNEL_OMNI);

  if (debug) Serial.begin(115200);

  // wait until device mounted
  while (!TinyUSBDevice.mounted()) delay(1);


  // initialize digital pin LED_BUILTIN as an output and turn on the led to indicate that we are alive
  pinMode(LED_BUILTIN, OUTPUT);
  ledState = HIGH;
  digitalWrite(LED_BUILTIN, ledState);
}

void loop() {

  //Read the internal temperature of the Pico W
  f = analogReadTemp(); 

  //Print the temperature value to the Serial port
  if (debug) Serial.println(note); 
  
  //Convert the float values to integers and keep them between 1 and 127 
  note = constrain ( int(f) ,1 , 127);
  


  //Play the note
  MIDI.sendNoteOn(note, velocity, midiChannel);
 
  //Wait according to the length of the note beeing played
  delay(noteLength);

  // Send Note Off for previous note.
  MIDI.sendNoteOff(note, 0, midiChannel);


  //Change the led state to have a visible indication of the status change
  ledState = !ledState;
  digitalWrite(LED_BUILTIN, ledState);

  // read any new MIDI messages
  MIDI.read();
  delay(tempo);
}
