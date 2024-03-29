// Pico W example of sending a serial port  message with the internal temperature of the board
// ichingxs4all

float f; // the float f will hold the temperature value

bool debug = true;  //set to false if no serial debug is needed

int tempo = 100;  //The tempo of how fast the readings will be transmitted in msecs

bool ledState; //The boolean ledState will hold the state of the build in led


void setup() {
  
  if (debug) Serial.begin(9600); //Setup the serial port to debug
  
  // initialize digital pin LED_BUILTIN as an output and turn on the led to indicate that we are alive
  pinMode(LED_BUILTIN, OUTPUT);
  ledState = HIGH;
  digitalWrite(LED_BUILTIN, ledState);
}

void loop() {
  // put your main code here, to run repeatedly:
f = analogReadTemp(); //Read the internal temperature of the Pico W

if(debug)Serial.println(f);  //Print the temperature value to the Serial port

//Change the led state to have a visible indication of the status change
  ledState = !ledState; 
  digitalWrite(LED_BUILTIN, ledState);
delay(tempo);
}
