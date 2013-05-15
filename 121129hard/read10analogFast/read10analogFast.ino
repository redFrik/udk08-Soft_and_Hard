//arduino mega code
void setup() {
  Serial.begin(115200);
}
void loop() {
  Serial.write(253);
  Serial.write(254);
  serialPrint(analogRead(A0));
  serialPrint(analogRead(A1));
  serialPrint(analogRead(A2));
  serialPrint(analogRead(A3));
  serialPrint(analogRead(A4));
  serialPrint(analogRead(A5));
  serialPrint(analogRead(A6));
  serialPrint(analogRead(A7));
  serialPrint(analogRead(A8));
  serialPrint(analogRead(A9));
  Serial.write(255);
  //delay(1);
}
void serialPrint(int val) {
  Serial.write(val>>2);  //bits 2-9
  Serial.write(val&3);   //bits 0-1
}
