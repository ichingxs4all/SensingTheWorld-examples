// Pico W example of sending an OSC message with the internal temperature of the board
// Change the wifi setting according to your network in the WiFi.ino tab above 
// Add this ArduinoOSC library through 'Manage Libraries' in the Menu
//
//ichingxs4all

#include <ArduinoOSCWiFi.h> // Add this ArduinoOSC library through 'Manage Libraries' in the Menu

// for ArduinoOSC
const char* host = "192.168.188.255";  //Network or host to send to, change this according to your network
const int send_port = 8000;            //OSC Port to send to

float f; // the float f will hold the temperature value

bool debug = true;  //set to false if no serial debug is needed

int tempo = 500;  //The tempo of how fast the readings will be transmitted in msecs

bool ledState; //The boolean ledState will hold the state of the build in led

void setup() {
  if (debug) Serial.begin(115200); //Setup the serial port to debug
  
  // initialize digital pin LED_BUILTIN as an output and turn on the led to indicate that we are alive
  pinMode(LED_BUILTIN, OUTPUT);
  ledState = HIGH;
  digitalWrite(LED_BUILTIN, ledState);
  
  setupWiFi();  // Setup the Wifi connection
}

void loop() {

  f = analogReadTemp(); //Read the internal temperature of the Pico W

  OscWiFi.send(host, send_port, "/temp", f);  //Send the temperture as an OSC message
  OscWiFi.update();                           // should be called to receive + send osc

  //Change the led state to have a visible indication of the status change
  ledState = !ledState; 
  digitalWrite(LED_BUILTIN, ledState);

  delay(tempo); //Wait before transmitting a new value;
}
