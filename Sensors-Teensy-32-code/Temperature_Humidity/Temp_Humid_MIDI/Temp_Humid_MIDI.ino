// Demo for getting individual unified sensor data from the AHT Humidity and Temperature sensor

#include <Adafruit_AHTX0.h>

Adafruit_AHTX0 aht;

Adafruit_Sensor *aht_humidity, *aht_temp;

#define LOWCC1 16
#define HIGHCC1 LOWCC1 + 32

float minVal = -40.00;
float maxVal = 80.00;

// the MIDI channel number to send messages
const int channel = 1;

// the MIDI continuous controller for each analog input
const int controller0 = 16; // 10 = pan position
const int controller1 = 17; // 10 = pan position

const boolean debug = false;

float n0;
float previousA0 = -1;

void setup(void) {
  pinMode(LED_BUILTIN, OUTPUT);

  if(debug){
  Serial.begin(115200);
  while (!Serial)
    delay(10); // will pause Zero, Leonardo, etc until serial console opens

  Serial.println("Adafruit AHT10/AHT20 test!");
  }
  if (!aht.begin()) {
    if(debug) Serial.println("Failed to find AHT10/AHT20 chip");
    while (1) {
      digitalWrite(LED_BUILTIN, HIGH);
      delay(500);
      digitalWrite(LED_BUILTIN, LOW);
      delay(500);
    }
  }

  //Serial.println("AHT10/AHT20 Found!");
  aht_temp = aht.getTemperatureSensor();
  if(debug) aht_temp->printSensorDetails();
  
  aht_humidity = aht.getHumiditySensor();
  if(debug) aht_humidity->printSensorDetails();
}

void loop() {
  digitalWrite(LED_BUILTIN, HIGH);
   //Get a new normalized sensor event 
  sensors_event_t humidity;
  sensors_event_t temp;
  aht_humidity->getEvent(&humidity);
  aht_temp->getEvent(&temp);
  
/*
  Serial.print("\t\tTemperature ");
  Serial.print(temp.temperature);
  Serial.println(" deg C");

  /* Display the results (humidity is measured in % relative humidity (% rH) */
  /*
  Serial.print("\t\tHumidity: ");
  Serial.print(humidity.relative_humidity);
  Serial.println(" % rH");
  Serial.print("\t\tTemperature: ");
  Serial.print(temp.temperature);
  Serial.println(" degrees C");


  delay(100);
*/
  //   serial plotter friendly format
  usbMIDI.sendControlChange(controller0, constrain (map (temp.temperature, minVal , maxVal, 0, 127), 0, 127), channel);
  usbMIDI.sendControlChange(controller1, constrain (map (humidity.relative_humidity, 0 , 100, 0, 127), 0, 127), channel);
  if(debug){
  Serial.print(temp.temperature);
  Serial.print(",");

  Serial.print(humidity.relative_humidity);

  Serial.println();
  }

  // http://forum.pjrc.com/threads/24179-Teensy-3-Ableton-Analog-CC-causes-midi-crash
  while (usbMIDI.read()) {
    // ignore incoming messages
  }
  delay(5);
    digitalWrite(LED_BUILTIN, LOW);
    delay(5);
  
}
