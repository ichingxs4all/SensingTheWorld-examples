
int const numTouchPins = 9; // number of pins to use as touchpins, sending note values
int touch[numTouchPins];
int touchon[numTouchPins];
int touchpin[] = { 0, 1, 15, 16, 17,18, 19, 22, 23 }; // which digital pins to use as touch pins
int touchpitch[] = { 61,63,66,68,70,73,75,78,80 }; // which midi notes to send from the touch pins

int touchThreshold = 1500;
int touchMax = 5000;

// the MIDI channel number to send messages
const int channel = 1;

void setup() {
 
}

void loop() {
  //  touchpads
  for (int i = 0; i < numTouchPins; i++) {
    touch[i] = touchRead(touchpin[i]);  
    if (touch[i] > touchThreshold && touchon[i] == 0) {
    usbMIDI.sendNoteOn(touchpitch[i], 100, channel);    
    touchon[i] = 1;
    }
    if (touch[i] < touchThreshold && touchon[i] == 1) {
      usbMIDI.sendNoteOff(touchpitch[i], 100, channel);   
      touchon[i] = 0;
    }
  }

  // i think if you remove these last two lines everything breaks and things are sad and people cry
  while (usbMIDI.read()); // read and discard any incoming MIDI messages
  delay(25);
}
