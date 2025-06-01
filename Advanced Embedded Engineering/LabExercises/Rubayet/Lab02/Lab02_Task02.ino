#include <ArduinoBLE.h>

BLEService ledService("180A"); // LED control service

BLEByteCharacteristic redChar("2A56", BLERead | BLEWrite);   // Red LED
BLEByteCharacteristic greenChar("2A57", BLERead | BLEWrite); // Green LED
BLEByteCharacteristic blueChar("2A58", BLERead | BLEWrite);  // Blue LED

BLEUnsignedCharCharacteristic analogChar("2A59", BLERead | BLENotify); // Analog sensor

const int redPin = 2;
const int greenPin = 3;
const int bluePin = 4;
long previousMillis = 0;

void setup() {
  Serial.begin(9600);
  while (!Serial);

  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);
  pinMode(LED_BUILTIN, OUTPUT);

  if (!BLE.begin()) {
    Serial.println("starting BLE failed!");
    while (1);
  }

  BLE.setLocalName("Rubayet's RGB LED");
  BLE.setAdvertisedService(ledService);

  ledService.addCharacteristic(redChar);
  ledService.addCharacteristic(greenChar);
  ledService.addCharacteristic(blueChar);
  ledService.addCharacteristic(analogChar);

  BLE.addService(ledService);

  redChar.writeValue(0);
  greenChar.writeValue(0);
  blueChar.writeValue(0);
  analogChar.writeValue(0);

  BLE.advertise();
  Serial.println("BLE device active, waiting for connections...");
}

void loop() {
  BLEDevice central = BLE.central();

  if (central) {
    Serial.print("Connected to central: ");
    Serial.println(central.address());
    digitalWrite(LED_BUILTIN, HIGH);

    while (central.connected()) {
      long currentMillis = millis();
      if (currentMillis - previousMillis >= 200) {
        previousMillis = currentMillis;

        int analogValue = analogRead(A1);
        analogChar.writeValue(analogValue);

        // RED
        if (redChar.written()) {
          byte redVal = redChar.value();
          analogWrite(redPin, redVal);
          Serial.print("Red: ");
          Serial.println(redVal);
        }

        // GREEN
        if (greenChar.written()) {
          byte greenVal = greenChar.value();
          analogWrite(greenPin, greenVal);
          Serial.print("Green: ");
          Serial.println(greenVal);
        }

        // BLUE
        if (blueChar.written()) {
          byte blueVal = blueChar.value();
          analogWrite(bluePin, blueVal);
          Serial.print("Blue: ");
          Serial.println(blueVal);
        }
      }
    }

    digitalWrite(LED_BUILTIN, LOW);
    Serial.print("Disconnected from central: ");
    Serial.println(central.address());
  }
}
