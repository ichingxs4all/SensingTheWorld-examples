// Pico W example of sending MIDI note  message with the internal temperature of the board
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

bool debug = true;  //set to false if no serial debug is needed

int tempo = 500;  //The tempo of how fast the readings will be transmitted in msecs

bool ledState;  //The boolean ledState will hold the state of the build in led

int note;              //This wil hold note beeing played
int noteLength = 100;  //This wil hold the noteLength in mSecs

const int midiChannel = 1;

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

  f = analogReadTemp();  //Read the internal temperature of the Pico W
  
  note = map(f, 34., 38., 40, 60);
  
  //Print the temperature value to the Serial port
  if (debug) Serial.println(note); 

  //Change the led state to have a visible indication of the status change
  ledState = !ledState;
  digitalWrite(LED_BUILTIN, ledState);

  //Play the note
  MIDI.sendNoteOn(note, 127, midiChannel);

  //Wait according to the length of the note beeing played
  delay(noteLength);

  // Send Note Off for previous note.
  MIDI.sendNoteOff(note, 0, midiChannel);


  // read any new MIDI messages
  MIDI.read();
  delay(tempo);
}
