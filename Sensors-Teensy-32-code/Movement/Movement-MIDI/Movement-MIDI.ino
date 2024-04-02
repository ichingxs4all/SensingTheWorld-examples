#define SerialPort Serial

#include <Wire.h>

#include <SparkFunMPU9250-DMP.h>

MPU9250_DMP imu;

double roll , pitch, yaw;
long int pre_ts = 0;

// the MIDI channel number to send messages
const int channel = 1;

const int ccpitch= 16;
const int ccroll= 17;
const int ccyaw= 18;

boolean debug = false;

void setup()
{

pinMode(LED_BUILTIN, OUTPUT);
  {
    SerialPort.begin(115200);

    if (imu.begin() != INV_SUCCESS)
    {
      while (1)
      {
        SerialPort.println("Unable to communicate with MPU-9250");
        SerialPort.println("Check connections, and try again.");
        SerialPort.println();
        digitalWrite(LED_BUILTIN, HIGH);
      delay(500);
      digitalWrite(LED_BUILTIN, LOW);
      delay(500);
      }
    }


    imu.setSensors(INV_XYZ_GYRO | INV_XYZ_ACCEL | INV_XYZ_COMPASS);


    imu.setGyroFSR(250); // Set gyro to 2000 dps
    // Accel options are +/- 2, 4, 8, or 16 g
    imu.setAccelFSR(2); // Set accel to +/-2g
    imu.setLPF(10); // Set LPF corner frequency to 5Hz
    imu.setSampleRate(10); // Set sample rate to 10Hz
    imu.setCompassSampleRate(50); // Set mag rate to 10Hz
  }

  pre_ts = millis();
}

//}
void loop()
{
  digitalWrite(LED_BUILTIN, HIGH);
  if ( imu.dataReady() )
  {
    imu.update(UPDATE_ACCEL | UPDATE_GYRO | UPDATE_COMPASS);
    printIMUData(millis() - pre_ts);
    pre_ts = millis();
  }
  // i think if you remove these last two lines everything breaks and things are sad and people cry
  while (usbMIDI.read()); // read and discard any incoming MIDI messages
 
  digitalWrite(LED_BUILTIN, LOW);
  delay(10);
}

void printIMUData(long int dt)
{

  float accelX = imu.calcAccel(imu.ax);
  float accelY = imu.calcAccel(imu.ay);
  float accelZ = imu.calcAccel(imu.az);
  float gyroX = imu.calcGyro(imu.gx) / 57.3;
  float gyroY = imu.calcGyro(imu.gy) / 57.3;
  float gyroZ = imu.calcGyro(imu.gz) / 57.3;
  float magX = imu.calcMag(imu.mx);
  float magY = imu.calcMag(imu.my);
  float magZ = imu.calcMag(imu.mz);

  //SerialPort.println("Accel: " + String(accelX) + ", " + String(accelY) + ", " + String(accelZ) + " g");
  //SerialPort.println("Gyro: " + String(gyroX) + ", " + String(gyroY) + ", " + String(gyroZ) + " dps");
  //SerialPort.println("Mag: " + String(magX) + ", " + String(magY) + ", " + String(magZ) + " uT");
  //SerialPort.println("Time: " + String(imu.time) + " ms");

  //Euler angle from accel


  pitch = atan2 (accelY , ( sqrt ((accelX * accelX) + (accelZ * accelZ))));
  roll = atan2(-accelX , ( sqrt((accelY * accelY) + (accelZ * accelZ))));

  // yaw from mag

  float Yh = (magY * cos(roll)) - (magZ * sin(roll));
  float Xh = (magX * cos(pitch)) + (magY * sin(roll) * sin(pitch)) + (magZ * cos(roll) * sin(pitch));

  yaw =  atan2(Yh, Xh);


  roll = roll * 57.3;
  pitch = pitch * 57.3;
  yaw = yaw * 57.3;

  usbMIDI.sendControlChange(ccpitch, map( pitch, -90, 90, 0, 127), channel);
  usbMIDI.sendControlChange(ccroll, map( roll, -90, 90, 0, 127), channel);
  usbMIDI.sendControlChange(ccyaw, map( yaw, -180, 180, 0, 127), channel);
  

  if(debug){
  Serial.print ("pitch "  + String( pitch) );
  Serial.print (" , ");
  Serial.print("roll " + String( roll));
  Serial.print (" , ");
  Serial.println("yaw " + String( yaw ));
  }
while (usbMIDI.read()); // read and discard any incoming MIDI messages
delay(20);
}
