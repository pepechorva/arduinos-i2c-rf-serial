// Wire Slave Receiver
// by Nicholas Zambetti <http://www.zambetti.com>

// Demonstrates use of the Wire library
// Receives data as an I2C/TWI slave device
// Refer to the "Wire Master Writer" example for use with this

// Created 29 March 2006

// This example code is in the public domain.


#include <Wire.h>

void setup()
{
    for(int i=0; i<8 ; i++)
      pinMode(i, OUTPUT);

  Wire.begin(4);                // join i2c bus with address #4
  Wire.onReceive(receiveEvent); // register event
  for(int i=0; i<8 ; i++)
    digitalWrite(i, LOW);
}

void loop()
{
  delay(100);
}

// function that executes whenever data is received from master
// this function is registered as an event, see setup()
void receiveEvent(int howMany)
{
    for(int i=0; i<8 ; i++)
    digitalWrite(i, LOW);

  while(1 < Wire.available()) // loop through all but the last
  {
    char c = Wire.receive(); // receive byte as a character
  }
  int x = Wire.receive();    // receive byte as an integer
  if(x>=0 && x<8)
  {
    digitalWrite(x, HIGH);
  }
  else /*no funciona???*/
  {
    for(int i=0; i<8 ; i++)
      digitalWrite(i, LOW);
  }
}

