# Bluetooth connection test code for TinyBit robots

from weallcode_robot import Robot

spacer = "+--------------------+"

print("Python Robot Tester\n{}\n".format(spacer))
robotName = input("Enter robot name: ")
robotTester = Robot(robotName)

print("\nVerify that LEDs turn on\n\n{}\n".format(spacer))

robotTester.led(255, 0, 0, 2)

try:
    robotTester.run()
except Exception as error:
    print("❌ Error: {}".format(error))

