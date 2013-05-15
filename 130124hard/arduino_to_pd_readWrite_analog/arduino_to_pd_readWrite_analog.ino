void setup() {
  Serial.begin(38400);
  pinMode(13, OUTPUT);
  pinMode(3, OUTPUT);
}
void loop() {
  Serial.write(analogRead(A0)>>2);  //send to pd
  if(Serial.available()) {
    byte value= Serial.read();
    digitalWrite(13, value);  //set arduino led on/off
    digitalWrite(3, value);  //set also output on pin 3 (arduino)
  }
  delay(40);  //updaterate
}
