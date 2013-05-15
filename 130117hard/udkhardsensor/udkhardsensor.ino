void setup() {
  Serial.begin(38400);
  pinMode(2, INPUT_PULLUP);
}
void loop() {
  Serial.println(digitalRead(2));  //print to serial monitor (computer)
  digitalWrite(3, digitalRead(2));  //output on pin 3 (arduino)
  delay(100);  //updaterate
}
