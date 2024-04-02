
 
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
void setup ()  
{   
  pinMode (SENSOR_PIN, INPUT); // Set the signal pin as input  
  if(debug) Serial.begin(115200);

}  
 
   
void loop ()  
{ 
   unsigned long startMillis= millis();                   // Start of sample window
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
   int db = map(peakToPeak,20,900,49.5,90);             //calibrate for deciBels
 
  n0=db;
  if (n0 != previousA0) {
      usbMIDI.sendControlChange(controllerA0, constrain (map (n0, minVal , maxVal, 0, 127),0,127), channel);
      previousA0 = n0;
    }

while (usbMIDI.read()) {
    // ignore incoming messages
  }
  if(debug){
  Serial.print("Loudness: ");
  Serial.print(db);
  Serial.println("dB");
  }
 delay(2);
}
