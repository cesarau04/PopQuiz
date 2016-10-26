import processing.serial.*;
import cc.arduino.*;

Arduino arduino; 
int ledPin = 13;
int switch1 = 8;

void setup() {
  size(700, 500);background(0,0,0);
  arduino = new Arduino(this, "COM3--p", 57600); 
  arduino.pinMode(ledPin, Arduino.OUTPUT);
  arduino.pinMode(switch1, Arduino.INPUT);
  //arduino.pinMode(switch2, Arduino.INPUT);
  //arduino.pinMode(switch3, Arduino.INPUT);
  //arduino.pinMode(switch4, Arduino.INPUT);
  arduino.digitalWrite(ledPin, Arduino.LOW);
}

void draw() {
  println(arduino.digitalRead(switch1));
  int c = arduino.digitalRead(switch1);
  if(c==0){
    background(25,25,25);
  }else{
    background(124,240,75);
  }
  if (keyPressed == true) { 
    arduino.digitalWrite(13,Arduino.HIGH); 
  } else {
    arduino.digitalWrite(13,Arduino.LOW); 
  }
  delay(50);
}
