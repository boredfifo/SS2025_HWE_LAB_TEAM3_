#include <Servo.h>
#include <
NEW SKETCH
WiFiNINA.h>
#include <PubSubClient.h>

// WiFi credentials
char ssid[] = "fifo";
char pass[] = "fifoluwa";

// MQTT
WiFiClient wifiClient;
PubSubClient client(wifiClient);
const char* mqttServer ="172.20.10.4"; // Raspberry Pi IP
const int mqttPort = 1883;

// Servo setup
Servo servoX;  // left-right
int posX = 90;
const int stepSize = 5;
const int threshold = 30;

// LDR pins (only using left and right)
int ldrLeft = A2;
int ldrRight = A3;

void setup() {
  Serial.begin(9600);

  servoX.attach(9);
  servoX.write(posX);
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
  int left = analogRead(ldrLeft);
  int right = analogRead(ldrRight);

  // Publish MQTT message
  String payload = "Left: " + String(left) + " | Right: " + String(right);
  client.publish("solartracker/ldr", payload.c_str());
  Serial.println("Published: " + payload);

  // Servo logic
  int diffX = abs(left - right);

  if (diffX < threshold) {
    Serial.println("Aligned - No movement.");
  } else {
    if (left > right) posX -= stepSize;
    else posX += stepSize;

    posX = constrain(posX, 0, 180);
    servoX.write(posX);
    Serial.print("Moving Horizontal: "); Serial.println(posX);
  }

  delay(1000);
}
