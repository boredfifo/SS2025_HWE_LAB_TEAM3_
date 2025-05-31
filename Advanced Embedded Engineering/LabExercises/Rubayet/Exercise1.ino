#include <SPI.h>
#include <WiFiNINA.h>
#include "arduino_secrets.h"

char ssid[] = XXXXXXXX;       
char pass[] = XXXXXXXX;    
int keyIndex = 0;                

int led =  LED_BUILTIN;
int status = WL_IDLE_STATUS;

WiFiServer server(80);

void setup() {

  Serial.begin(9600);

  while (!Serial) {

    ; 

  }

  Serial.println("Access Point Web Server");

  pinMode(led, OUTPUT);      

  if (WiFi.status() == WL_NO_MODULE) {

    Serial.println("Communication with WiFi module failed!");

    while (true);

  }



  Serial.print("Creating access point named: ");

  Serial.println(ssid);


  status = WiFi.beginAP(ssid, pass);

  if (status != WL_AP_LISTENING) {

    Serial.println("Creating access point failed");

    while (true);

  }


  delay(10000);

  server.begin();

  printWiFiStatus();
}

void loop() {

  if (status != WiFi.status()) {

    status = WiFi.status();

    if (status == WL_AP_CONNECTED) {

      Serial.println("Device connected to AP");

    } else {

      Serial.println("Device disconnected from AP");

    }

  }



  WiFiClient client = server.available();   
  if (client) {                             
    Serial.println("new client");           

    String currentLine = "";                

    while (client.connected()) {            

      if (client.available()) {           

        char c = client.read();            

        Serial.write(c);                   

        if (c == '\n') {                   


          if (currentLine.length() == 0) {


            client.println("HTTP/1.1 200 OK");

            client.println("Content-type:text/html");

            client.println();

            
            client.print("Click <a href=\"/H\">here</a> turn the LED on<br>");

            client.print("Click <a href=\"/L\">here</a> turn the LED off<br>");

            

            client.println();

            

            break;

          }

          else {     
            currentLine = "";

          }

        }

        else if (c != '\r') {    

          currentLine += c;      

        }


        if (currentLine.endsWith("GET /H")) {

          digitalWrite(led, HIGH);               

        }

        if (currentLine.endsWith("GET /L")) {

          digitalWrite(led, LOW);                

        }

      }

    }

    client.stop();

    Serial.println("client disconnected");

  }
}

void printWiFiStatus() {

  Serial.print("SSID: ");

  Serial.println(WiFi.SSID());

  IPAddress ip = WiFi.localIP();

  Serial.print("IP Address: ");

  Serial.println(ip);


  Serial.print("To see this page in action, open a browser to http://");

  Serial.println(ip);

}
