#include <WiFiNINA.h>
#include <PubSubClient.h>
#include <ArduinoJson.h>

// Wi-Fi
const char* ssid       = "fifo";
const char* pass       = "fifoluwa";

// MQTT
const char* mqttServer = "172.20.10.4";
const int   mqttPort   = 1883;
const char* topic      = "led/status";

WiFiClient    wifiClient;
PubSubClient  client(wifiClient);

// LED pins
const int redPin   = A2;
const int greenPin = A1;
const int bluePin  = A0;

void reconnect() {
  while (!client.connected()) {
    Serial.print("→ Connecting MQTT… ");
    if (client.connect("ArduinoClient")) {
      Serial.println("OK");
      client.subscribe(topic);
      Serial.print("✅ Subscribed to "); Serial.println(topic);
    } else {
      Serial.print("FAIL, rc="); Serial.print(client.state());
      Serial.println("  retry in 2s");
      delay(2000);
    }
  }
}

void callback(char* topic, byte* payload, unsigned int length) {
  Serial.println(F("----- CALLBACK ENTER -----"));
  Serial.print(F("Topic: ")); Serial.println(topic);
  Serial.print(F("Raw payload (len=")); Serial.print(length); Serial.println(F("):"));
  // 1) Dump raw bytes
  for (unsigned int i = 0; i < length; i++) {
    Serial.write(payload[i]);
  }
  Serial.println();

  // 2) Build a trimmed String
  String json = "";
  for (unsigned int i = 0; i < length; i++) {
    json += (char)payload[i];
  }
  json.trim();
  Serial.print(F("Trimmed JSON: `")); Serial.print(json); Serial.println(F("`"));

  // 3) Parse into a larger document
  StaticJsonDocument<256> doc;
  DeserializationError err = deserializeJson(doc, json);
  if (err) {
    Serial.print(F("❌ JSON parse error: "));
    Serial.println(err.c_str());
    Serial.println(F("----- CALLBACK EXIT -----"));
    return;
  }

  // 4) Extract (with default -1 so we know if key was missing)
  int redVal   = doc["red"]   | -1;
  int greenVal = doc["green"] | -1;
  int blueVal  = doc["blue"]  | -1;

  Serial.print(F("Parsed → red="));   Serial.print(redVal);
  Serial.print(F("  green=")); Serial.print(greenVal);
  Serial.print(F("  blue="));  Serial.println(blueVal);

  // 5) Drive LEDs
  digitalWrite(redPin,   redVal   == 1 ? HIGH : LOW);
  digitalWrite(greenPin, greenVal == 1 ? HIGH : LOW);
  digitalWrite(bluePin,  blueVal  == 1 ? HIGH : LOW);

  Serial.println(F("----- CALLBACK EXIT -----"));
}

void setup() {
  Serial.begin(9600);
  pinMode(redPin,   OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin,  OUTPUT);

  // Wi-Fi
  Serial.print(F("Connecting Wi-Fi"));
  WiFi.begin(ssid, pass);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print('.');
  }
  Serial.println();
  Serial.print(F("Wi-Fi IP: "));
  Serial.println(WiFi.localIP());

  // MQTT
  client.setServer(mqttServer, mqttPort);
  client.setCallback(callback);
  reconnect();
}

void loop() {
  if (!client.connected()) reconnect();
  client.loop();
}
