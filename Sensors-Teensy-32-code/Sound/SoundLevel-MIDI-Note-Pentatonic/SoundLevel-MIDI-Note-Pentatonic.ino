

const int sampleWindow = 50;                              // Sample window width in mS (50 mS = 20Hz)
unsigned int sample;

#define SENSOR_PIN A0


// the MIDI channel number to send messages
const int channel = 1;

// the MIDI continuous controller for each analog input
const int controllerA0 = 16;

int n0;
int previousA0 = -1;

int minVal = 49;
int maxVal = 125;

boolean debug = false;

uint16_t pentatonicTable[54] = { 0,1,3,6,8,10,13,15,18,20,22,25,27,30,32,34,37,39,42,44,46,49,51,54,56,58,61,63,66,68,70,73,75,78,80,82,85,87,90,92,94,97,99,102,104,106,109,111,114,116,118,121,123,126 };

uint16_t mapPentatonic(uint16_t input) {
  uint8_t value = (input) / (maxVal/53);
  return (pentatonicTable[value]);
}

void setup ()
{
  pinMode (SENSOR_PIN, INPUT); // Set the signal pin as input
  if (debug) Serial.begin(115200);
}


void loop ()
{
  unsigned long startMillis = millis();                  // Start of sample window
  float peakToPeak = 0;                                  // peak-to-peak level

  unsigned int signalMax = 0;                            //minimum value
  unsigned int signalMin = 1024;                         //maximum value

  // collect data for 50 mS
  while (millis() - startMillis < sampleWindow)
  {
    sample = analogRead(SENSOR_PIN);                    //get reading from microphone
    if (sample < 1024)                                  // toss out spurious readings
    {
      if (sample > signalMax)
      {
        signalMax = sample;                           // save just the max levels
      }
      else if (sample < signalMin)
      {
        signalMin = sample;                           // save just the min levels
      }
    }
  }

  peakToPeak = signalMax - signalMin;                    // max - min = peak-peak amplitude
  int db = map(peakToPeak, 20, 900, 49.5, 90);         //calibrate for deciBels

  n0 = db;
  if (n0 != previousA0) {
    usbMIDI.sendControlChange(controllerA0, constrain (map (n0, minVal , maxVal, 0, 127), 0, 127), channel);
    if(n0 > minVal+2){
    usbMIDI.sendNoteOn(mapPentatonic(n0), 99, channel);  // 60 = C4
    delay(5);
    usbMIDI.sendNoteOff(mapPentatonic(n0), 0, channel);  // 60 = C4
    }
    previousA0 = n0;
  }

  while (usbMIDI.read()) {
    // ignore incoming messages
  }
  if (debug) {
    //Serial.print("Loudness: ");
    Serial.println(db);
    //Serial.println("dB");
  }
  delay(2);
}
