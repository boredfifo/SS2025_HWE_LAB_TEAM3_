import paho.mqtt.subscribe as subscribe
import paho.mqtt.publish as publish
import json
import time
import paho.mqtt.client as mqtt

threshold = 100
#hostName = "192.168.1.100"

def getValues():
    msg = subscribe.simple("solartracker/ldr")
    ldrValuesfromBroker = msg.payload.decode()
    parsedLDRvalues = json.loads(ldrValuesfromBroker)
    return parsedLDRvalues

def publishbRecommendation():
    values = getValues()
    top = int(values["top"])
    bottom = int(values["bottom"])
    left = int(values["left"])
    right = int(values["right"])

    if (top - bottom > threshold) or (left - right > threshold):
        status = "dark"
    else:
        status = "bright"
    publish.single("ldr/control/status", status, hostname=hostName)

client = mqtt.Client()
client.connect("localhost", 1883, 60)
while True:
    publishbRecommendation()
    time.sleep(5)
