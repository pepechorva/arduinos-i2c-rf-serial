


#include <VirtualWire.h>

void setup()
{
    Serial.begin(9600);	  // Debugging only
    Serial.println("setup");

    // Initialise the IO and ISR
    vw_set_ptt_inverted(true); // Required for DR3100
    vw_setup(2000);	 // Bits per sec
        vw_set_tx_pin(3); 
}

void loop()
{
  char *msg;
    if (Serial.available() > 0) 
    {
      int inByte = Serial.read();
      switch (inByte) 
      {
        case '0':    
           msg = "0";
          break;
        case '1':    
          msg = "1";
          break;
       case '2':    
          msg = "2";
          break;
       case '3':    
          msg = "3";
          break;
       case '4':    
          msg = "4";
          break;
       case '5':    
          msg = "5";
          break;
       case '6':    
          msg = "6";
          break;
       case '7':    
          msg = "7";
          break;
      }
    vw_send((uint8_t *)msg, strlen(msg));
    vw_wait_tx(); // Wait until the whole message is gone
  }
}
  
