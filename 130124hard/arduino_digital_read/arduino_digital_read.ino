//reading 10 digital inputs and send to pd

void setup() {
  Serial.begin(38400);
  pinMode(2, INPUT_PULLUP);
  pinMode(3, INPUT_PULLUP);
  pinMode(4, INPUT_PULLUP);
  pinMode(5, INPUT_PULLUP);
  pinMode(6, INPUT_PULLUP);
  pinMode(7, INPUT_PULLUP);
  pinMode(8, INPUT_PULLUP);
  pinMode(9, INPUT_PULLUP);
  pinMode(10, INPUT_PULLUP);
  pinMode(11, INPUT_PULLUP);
}

void loop() {
  byte sensors= 0;
  sensors= sensors+(digitalRead(2)*1);
  sensors= sensors+(digitalRead(3)*2);
  sensors= sensors+(digitalRead(4)*4);
  sensors= sensors+(digitalRead(5)*8);
  sensors= sensors+(digitalRead(6)*16);
  sensors= sensors+(digitalRead(7)*32);
  sensors= sensors+(digitalRead(8)*64);
  sensors= sensors+(digitalRead(9)*128);
  Serial.write(2);
  Serial.write(sensors);
  
  sensors= 0;
  sensors= sensors+(digitalRead(10)*1);
  sensors= sensors+(digitalRead(11)*2);
  
  Serial.write(3);
  Serial.write(sensors);
  
  delay(40);  //updaterate
}

