#include <Servo.h>
#include <WiFiNINA.h>
#include <ArduinoJson.h>
#include <PubSubClient.h>

// WiFi credentials
char ssid[] = "Wifiname_5G_notAccepted";
char pass[] = "PassWord";

// MQTT
WiFiClient wifiClient;
PubSubClient client(wifiClient);
const char* mqttServer = "192.168.1.100"; //Raspberry Pi IP
const int mqttPort = 1883;

// Servo setup
Servo servoX;  // left-right
Servo servoY;  // up-down

int posX = 90;
int posY = 90;

const int stepSize = 5;
const int threshold = 20;

// LDR pins
int ldrTop = A0;
int ldrBottom = A1;
int ldrLeft = A2;
int ldrRight = A3;

void setup() {
  Serial.begin(9600);

  servoX.attach(9);
  servoY.attach(10);

  servoX.write(posX);
  servoY.write(posY);
  delay(1000);

  // Connect to WiFi
  while (WiFi.begin(ssid, pass) != WL_CONNECTED) {
    Serial.println("Connecting to WiFi...");
    delay(1000);
  }
  Serial.println("Connected to WiFi");

  // Connect to MQTT
  client.setServer(mqttServer, mqttPort);
  while (!client.connected()) {
    Serial.println("Connecting to MQTT...");
    if (client.connect("ArduinoClient")) {
      Serial.println("Connected to MQTT broker");
    } else {
      delay(1000);
    }
  }
}

void loop() {
  if (!client.connected()) {
    client.connect("ArduinoClient");
  }
  client.loop();

  // Read LDRs
  int top = analogRead(ldrTop);
  int bottom = analogRead(ldrBottom);
  int left = analogRead(ldrLeft);
  int right = analogRead(ldrRight);

  publishLDRData(top, bottom, left, right);
  

  // Servo logic
  int diffX = abs(left - right);
  int diffY = abs(top - bottom);

  if (diffX < threshold && diffY < threshold) {
    Serial.println("Aligned - No movement.");
  } else {
    if (diffX > threshold) {
      if (left > right) posX -= stepSize;
      else posX += stepSize;
      posX = constrain(posX, 0, 180);
      servoX.write(posX);
      Serial.print("Moving Horizontal: "); Serial.println(posX);
    }

    if (diffY > threshold) {
      Serial.println("VERTICAL MOVE TRIGGERED");
      if (top > bottom) posY -= stepSize;
      else posY += stepSize;
      posY = constrain(posY, 0, 180);
      servoY.write(posY);
      Serial.print("Moving Vertical: "); Serial.println(posY);
    }
  }

  delay(1000);
}


void publishLDRData(int top, int bottom, int left, int right){
  StaticJsonDocument<128> doc;

  doc["top"] = top;
  doc["bottom"] = bottom;
  doc["left"] = left;
  doc["right"] = right;

  char payload[128];
  serializeJson(doc, payload);

  client.publish("solartracker/ldr", payload);
  Serial.println("Published: " + payload);
}
