
  /* RECIEVER CODE*/
  
#include <Wire.h>
  #include <VirtualWire.h>

void setup()
{
    Wire.begin(); // join i2c bus (address optional for master)
    Serial.begin(9600);	// Debugging only
    Serial.println("setup");

    // Initialise the IO and ISR
    vw_set_ptt_inverted(true); // Required for DR3100
    vw_setup(2000);	 // Bits per sec
    vw_set_rx_pin(2);
    vw_rx_start();       // Start the receiver PLL running

}

void loop()
{
  
  
    uint8_t buf[VW_MAX_MESSAGE_LEN];
    uint8_t buflen = VW_MAX_MESSAGE_LEN;

    if (vw_get_message(buf, &buflen)) // Non-blocking
    {
	int i;

        digitalWrite(13, true); // Flash a light to show received good message
	// Message with a good checksum received, dump it.
	Serial.print("Got: ");
	
	for (i = 0; i < buflen; i++)
	{
          Wire.beginTransmission(4); // transmit to device #4
        if(buf[i] == '0'){Wire.send(0);}
        if(buf[i] == '1'){Wire.send(1);}
        if(buf[i] == '2'){Wire.send(2);}
        if(buf[i] == '3'){Wire.send(3);}
        if(buf[i] == '4'){Wire.send(4);}
        if(buf[i] == '5'){Wire.send(5);}
        if(buf[i] == '6'){Wire.send(6);}
        if(buf[i] == '7'){Wire.send(7);}
	}
  Wire.endTransmission();    // stop transmitting


   }
}
