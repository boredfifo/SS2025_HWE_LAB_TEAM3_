#include <WiFiNINA.h>
#include <utility/wifi_drv.h>
#include <WiFi.h>
#include <Arduino.h>
#define LED_PIN 13
const char* ssid = "fifo";
const char*  password = "fifoluwa"; 
String ip = "172.20.10.3";

WiFiServer server(80);

void setup() {
  // put your setup code here, to run once:
  //WiFi.mode(WIFI_STA);.
  Serial.begin(9600);
  WiFi.begin(ssid, password);

  while(WiFi.status() != WL_CONNECTED){
    delay(1000);
    Serial.println("Connecting");
  }
  Serial.println("Connected");
  Serial.println(WiFi.localIP());
  pinMode(LED_BUILTIN, OUTPUT);
  
  server.begin();

}

void loop() {
  WiFiClient client = server.available(); // listen for incoming clients

  if (client) {
    Serial.println("New Client Connected");
    String currentLine = "";

    while (client.connected()) {
      if (client.available()) {
        char c = client.read();
        currentLine += c;
        Serial.write(c);

        if (currentLine.endsWith("GET /LED=ON")) {
          digitalWrite(LED_BUILTIN, HIGH);
        } else if (currentLine.endsWith("GET /LED=OFF")) {
          digitalWrite(LED_BUILTIN, LOW);
        }

        if (c == '\n') {
          // send HTML page
          client.println("HTTP/1.1 200 OK");
          client.println("Content-type:text/html");
          client.println();
          client.println("<!DOCTYPE html><html><body>");
          client.println("<h1>LED Control</h1>");
          client.println("<p><a href=\"/LED=ON\"><button>Turn ON</button></a></p>");
          client.println("<p><a href=\"/LED=OFF\"><button>Turn OFF</button></a></p>");
          client.println("</body></html>");
          client.println();
          break;
        }
      }
    }
    delay(1);
    client.stop();
    Serial.println("Client Disconnected");
  }
}