#include <Wire.h>
#include "Adafruit_SGP30.h"

Adafruit_SGP30 sgp;


#define LOWCC1 16
#define HIGHCC1 LOWCC1 + 32

float minVal = -40.00;
float maxVal = 80.00;

// the MIDI channel number to send messages
const int channel = 1;

// the MIDI continuous controller for each analog input
const int controllerA0 = 16; // 10 = pan position
const int controllerA1 = 17; // 10 = pan position

const boolean debug = false;

/* return absolute humidity [mg/m^3] with approximation formula
* @param temperature [°C]
* @param humidity [%RH]
*/
uint32_t getAbsoluteHumidity(float temperature, float humidity) {
    // approximation formula from Sensirion SGP30 Driver Integration chapter 3.15
    const float absoluteHumidity = 216.7f * ((humidity / 100.0f) * 6.112f * exp((17.62f * temperature) / (243.12f + temperature)) / (273.15f + temperature)); // [g/m^3]
    const uint32_t absoluteHumidityScaled = static_cast<uint32_t>(1000.0f * absoluteHumidity); // [mg/m^3]
    return absoluteHumidityScaled;
}

void setup() {

  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(115200);

  
  while (!Serial) { delay(10); } // Wait for serial console to open!

  Serial.println("SGP30 test");

  if (! sgp.begin()){
    Serial.println("Sensor not found :(");
    while (1);
  }
  Serial.print("Found SGP30 serial #");
  Serial.print(sgp.serialnumber[0], HEX);
  Serial.print(sgp.serialnumber[1], HEX);
  Serial.println(sgp.serialnumber[2], HEX);

  // If you have a baseline measurement from before you can assign it to start, to 'self-calibrate'
  //sgp.setIAQBaseline(0x8E68, 0x8F41);  // Will vary for each sensor!
}

int counter = 0;
void loop() {
  digitalWrite(LED_BUILTIN, HIGH);
  // If you have a temperature / humidity sensor, you can set the absolute humidity to enable the humditiy compensation for the air quality signals
  //float temperature = 22.1; // [°C]
  //float humidity = 45.2; // [%RH]
  //sgp.setHumidity(getAbsoluteHumidity(temperature, humidity));

  if (! sgp.IAQmeasure()) {
    Serial.println("Measurement failed");
    return;
  }
  Serial.print("TVOC "); Serial.print(sgp.TVOC); Serial.print(" ppb\t");
  Serial.print("eCO2 "); Serial.print(sgp.eCO2); Serial.println(" ppm");

  usbMIDI.sendControlChange(controllerA0, constrain (map (sgp.TVOC,0 , 60000, 0, 127), 0, 127), channel);
  usbMIDI.sendControlChange(controllerA1, constrain (map (sgp.eCO2, 400 , 60000, 0, 127), 0, 127), channel);
  

  if (! sgp.IAQmeasureRaw()) {
    Serial.println("Raw Measurement failed");
    return;
  }
  //Serial.print("Raw H2 "); Serial.print(sgp.rawH2); Serial.print(" \t");
  //Serial.print("Raw Ethanol "); Serial.print(sgp.rawEthanol); Serial.println("");
 
   delay(500);
    digitalWrite(LED_BUILTIN, LOW);
    delay(500);
  

  counter++;
  if (counter == 30) {
    counter = 0;

    uint16_t TVOC_base, eCO2_base;
    if (! sgp.getIAQBaseline(&eCO2_base, &TVOC_base)) {
      Serial.println("Failed to get baseline readings");
      return;
    }
    Serial.print("****Baseline values: eCO2: 0x"); Serial.print(eCO2_base, HEX);
    Serial.print(" & TVOC: 0x"); Serial.println(TVOC_base, HEX);
  }
  while (usbMIDI.read()) {
    // ignore incoming messages
  }
}
