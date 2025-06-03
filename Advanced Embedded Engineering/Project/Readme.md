# IoT Solar Tracking System with MQTT

This repository contains all the files, code, and resources related to our IoT-based Solar Tracking System project using MQTT. The system uses a Raspberry Pi as the MQTT broker and an ESP32/Arduino board to control servo motors and monitor solar intensity via LDR sensors.

## Repository Structure

├── RaspberryPi_MQTT_Setup/
│ └── Instructions to install and configure the MQTT broker on Raspberry Pi
│
├── 3D_Model/
│ ├── Fusion360/
│ │ └── CAD design files of the solar tracker
│ └── Renders/
│ └── Images and screenshots of the final design
│
├── solorproject_with_MQTT_RP/
│ └── Code for basic MQTT communication between ESP32/Arduino and Raspberry Pi
│
├── solorproject_with_MQTT_RP_LDR_SERVO_READINGS/
│ └── Full project code with LDR sensor readings and servo motor movements
│
└── README.md

---

##  RaspberryPi_MQTT_Setup

This folder contains a step-by-step guide to set up the Raspberry Pi as an MQTT broker using **Mosquitto**. The setup includes:

- Installing Mosquitto broker
- Enabling port forwarding if needed
- Running the broker on boot
- Testing the connection locally and over Wi-Fi

>  Use this setup before running the ESP32/Arduino code.

---

## 3D_Model

This directory includes all design files for the mechanical assembly of the solar tracker:

- **Fusion360** files for editable CAD designs
- **Render** folder contains images showing how the model looks when assembled
- Design includes LDR sensor mounts, servo holders, and solar panel frame

---

##  solorproject_with_MQTT_RP

This folder contains the basic version of the MQTT communication setup:

- ESP32/Arduino code to publish dummy sensor data
- Raspberry Pi (broker) and serial monitor test logs
- Can be used to test connectivity before adding sensors and motors

---

##  solorproject_with_MQTT_RP_LDR_SERVO_READINGS

This is the full version of the project:

- LDR sensor readings are sent over MQTT
- Servo motors adjust panel orientation based on light intensity
- Real-time feedback visible on Serial Monitor and Raspberry Pi terminal

>  Data can optionally be visualized on a mobile dashboard or web UI (coming soon).

---

##  Dependencies

- Arduino IDE / PlatformIO
- PubSubClient library (for MQTT)
- WiFiNINA or ESP32 WiFi libraries
- Mosquitto MQTT Broker on Raspberry Pi
- Servo motor and LDR sensor hardware

---

## 📸 Demo & Output

Images and short clips of the system in action (tracking sunlight and adjusting angle) are available in the [3D_Model/Renders](./3D_Model/Renders/) folder.

---



