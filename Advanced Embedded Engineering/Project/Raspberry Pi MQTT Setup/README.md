## Steps Taken

### 1. Initial OS Setup
- Installed Raspberry Pi OS using Raspberry Pi Imager.
- Connected to the internet via Ethernet.
- Performed system update:
  
  ```bash
  sudo apt update && sudo apt upgrade -y
  ````
  ---
  

**2. Working Solution**

Added Mosquitto official repo:

````bash
sudo apt install -y curl gnupg
curl -fsSL https://repo.mosquitto.org/debian/mosquitto-repo.gpg.key | sudo tee /usr/share/keyrings/mosquitto-archive-keyring.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/mosquitto-archive-keyring.gpg] http://repo.mosquitto.org/debian bookworm main" | sudo tee /etc/apt/sources.list.d/mosquitto.list > /dev/null
Updated and installed:
````

````bash
sudo apt update
sudo apt install -y mosquitto mosquitto-clients
Enabled and started Mosquitto:
````

````bash
sudo systemctl enable mosquitto
sudo systemctl start mosquitto
````
---

**3. MQTT Broker Testing**

**Verified via two terminals:**

- 1. **Terminal 1**
````bash
mosquitto_sub -t "test/topic"
````
- 2. **Terminal 2**

````bash    
mosquitto_pub -t "test/topic" -m "Hello"
````
---

**6. Arduino Uno WiFi Rev2 Integration**

- Arduino connects to WiFi and MQTT server (Raspberry Pi)

- Reads LDR values and publishes formatted message:

--- 
