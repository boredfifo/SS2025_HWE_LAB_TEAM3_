#include <ArduinoMqttClient.h>
#include <WiFiNINA.h>
#include "arduino_secrets.h"

///////please enter your sensitive data in the Secret tab/arduino_secrets.h
char ssid[] = SECRET_SSID;        // your network SSID (name)
char pass[] = SECRET_PASS;    // your network password (use for WPA, or use as key for WEP)

WiFiClient wifiClient;
MqttClient mqttClient(wifiClient);

const char broker[] = "test.mosquitto.org";
int        port     = 1883;
const char topic[]  = "LightIntensity";

//set interval for sending messages (milliseconds)
const long interval = 8000;
unsigned long previousMillis = 0;

int count = 0;

void setup() {
  //Initialize serial and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  // attempt to connect to Wifi network:
  Serial.print("Attempting to connect to WPA SSID: ");
  Serial.println(ssid);
  while (WiFi.begin(ssid, pass) != WL_CONNECTED) {
    // failed, retry
    Serial.print(".");
    delay(5000);
  }

  Serial.println("You're connected to the network");
  Serial.println();

  Serial.print("Attempting to connect to the MQTT broker: ");
  Serial.println(broker);

  if (!mqttClient.connect(broker, port)) {
    Serial.print("MQTT connection failed! Error code = ");
    Serial.println(mqttClient.connectError());

    while (1);
  }

  Serial.println("You're connected to the MQTT broker!");
  Serial.println();
}

void loop() {

  mqttClient.poll();

  unsigned long currentMillis = millis();

  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;

    //record random value from A0, A1 and A2
    int LDR1 = analogRead(A0);
    int LDR2 = analogRead(A1);
    int LDR3 = analogRead(A2);
    int LDR4 = analogRead(A4);

    Serial.print("Sending message to topic: ");
    Serial.println(topic);
    Serial.println(LDR1);

    Serial.print("Sending message to topic: ");
    Serial.println(topic);
    Serial.println(LDR2);

    Serial.print("Sending message to topic: ");
    Serial.println(topic);
    Serial.println(LDR3);

    Serial.print("Sending message to topic: ");
    Serial.println(topic);
    Serial.println(LDR4);

    // send message, the Print interface can be used to set the message contents
    mqttClient.beginMessage(topic);
    mqttClient.print(LDR1);
    mqttClient.endMessage();

    mqttClient.beginMessage(topic);
    mqttClient.print(LDR2);
    mqttClient.endMessage();

    mqttClient.beginMessage(topic);
    mqttClient.print(LDR3);
    mqttClient.endMessage();

    mqttClient.beginMessage(topic);
    mqttClient.print(LDR4);
    mqttClient.endMessage();

    Serial.println();
  }
}
