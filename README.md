## ROBO PIG -- Feed and monitor your lazy house cat

## DIY Feeder
- Supplies
  - Raspberry Pi
  - Continuous Rotation Servo (https://www.adafruit.com/products/154)
  - Micro USB Breakout Board (https://www.adafruit.com/products/1833)
  - USB cable (https://www.adafruit.com/products/592)
  - 5v USB Power supply (https://www.adafruit.com/products/501)
  - Cobbler and Breakout board for prototyping (https://www.adafruit.com/products/914)
  - Snack dispensor

- Hardware Prep
  - Solder micro USB breakout board

- Set up Your Pi
  - Great instructions here: https://www.raspberrypi.org/
  - Format SD card and set up OS
  - Configure Ethernet or Wifi (http://raspberrypihq.com/how-to-add-wifi-to-the-raspberry-pi/)
  -

- Remote Access to Pi
  - SSH https://www.raspberrypi.org/documentation/remote-access/ssh/unix.md
  - editing on sublime = http://www.onenorth.com/blog/post/editing-files-on-raspberry-pi-with-local-sublime
  - SSH for Ada classroom (ssh pi@172.24.127.219)
  - IP for home 192.168.0.24
  - Occidentalis (https://github.com/adafruit/Adafruit-Pi-Finder#adafruit-raspberry-pi-finder)
-

Move Servo with Servo Blaster
http://raspberrypi.stackexchange.com/questions/27222/controlling-a-continuous-servo-with-raspberry-pi
- TRY http://raspiprojects.com/install-servoblaster-raspberry-pi-control-servo-python.html
- http://www.education.rec.ri.cmu.edu/content/electronics/boe/robot_motion/1.html

Move with RPi GPIO
- servo1.py on main directory moves it incrementally

