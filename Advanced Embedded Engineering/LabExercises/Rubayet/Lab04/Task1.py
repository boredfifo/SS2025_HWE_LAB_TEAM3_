import RPi.GPIO as gpio
import time

gpio.setmode(gpio.BCM)
gpio.setmode(18, gpio.OUT)
gpio.setmode(23,gpio.OUT)

colour = input("Yellow or Green ?")

if colour == "Yellow":
  gpio.OUTPUT(23,gpio.HIGH)
  time.sleep(2)
  gpio.OUTPUT(23,gpio.LOW)

elif colour == "Green":
  gpio.OUTPUT(18,gpio.HIGH)
  time.sleep(2)
  gpio.OUTPUT(18,gpio.LOW)

else:
  print("Wrong Input")

gpio.cleanup()
