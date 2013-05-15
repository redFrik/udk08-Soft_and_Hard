void setup() {
  Serial.begin(9600);
  pinMode(9, OUTPUT);
}
void loop() {
  if(Serial.available()) {
    byte val= Serial.read();
    analogWrite(9, val);
  }
}
