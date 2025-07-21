# IoT-Based Solar Tracking and RGB LED Control System

This project demonstrates a small-scale IoT system combining solar tracking with MQTT-based RGB LED control using two Arduino Uno boards and a Raspberry Pi. It was developed as part of an Advanced Embedded Systems course at Hochschule Hamm-Lippstadt.

##  Project Overview

- **LDR-Based Sun Tracking**: Light-dependent resistors (LDRs) detect the direction of strongest sunlight.
- **Servo-Driven Solar Panel**: Based on LDR input, servo motors rotates the platform where the solar panel is mounted to face the sun.
- **Solar-Powered RGB Control**: The solar panel powers a second Arduino board, which is connected to an RGB LED.
- **Remote LED Control**: The RGB LED changes color based on MQTT messages received over WiFi.
- **MQTT Communication**: A Raspberry Pi runs the Mosquitto MQTT broker, managing wireless communication between devices.
- **Modular IoT Design**: Combines sensor-based actuation with real-time wireless control.

##  Hardware Components

- 2x **Arduino Uno** (Solar Tracker + RGB LED Controller)
- **Raspberry Pi** with Mosquitto MQTT broker
- **Solar Panel** (powers the RGB Arduino)
- 1x **Servo Motor** (horizontal tracking)
- 2x **LDRs** (left and right light detection)
- **RGB LED**
- Custom **3D Printed** mounts (designed in Fusion 360)

##  System Design

- **Single-axis Tracking**: Only horizontal movement due to limitations of vertical servo torque.
- **Mechanical Structure**: Designed and 3D printed to mount the panel, LDRs, and servos securely.
- **Modular Setup**: Easily extendable with more sensors or devices.

##  Software & Libraries

- **Arduino IDE**
- **WiFiNINA** and **PubSubClient** libraries for MQTT and WiFi communication
- **Fusion 360** for 3D design
- **Mosquitto MQTT** on Raspberry Pi
- MQTT client apps or CLI tools for message publishing and subscription

##  MQTT Topics

- `solartracker/ldr` – Publishes LDR sensor data from the solar tracker.
- `led/color` – Subscribes to RGB LED color commands.

##  Project Highlights

- Dynamic sun tracking using LDR and servo mechanism.
- Solar energy directly powers the RGB Arduino setup.
- Remote real-time LED color changes via MQTT.
- Smooth communication with low-latency message delivery.
- Compact and functional 3D-printed hardware assembly.

##  Future Improvements

- Switch to **ESP32** for integrated WiFi and more GPIO pins.
- Add **battery management** to store and utilize solar energy.
- Build a **web dashboard** for sensor monitoring and RGB control.
- Include **power output**, **temperature**, or **voltage** sensors.

##  Developed By

**Moiz Zaheer Malik** 

**Rubayet Kamal** 

**Mofifoluwa Akinwande** 


---

> 
