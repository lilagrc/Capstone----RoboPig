## ROBO PIG -- Remotely feed your pets

## DIY Feeder
- Supplies
  - Raspberry Pi B+
  - Continuous Rotation Servo (https://www.adafruit.com/products/154)
  - Micro USB Breakout Board (https://www.adafruit.com/products/1833)
  - USB cable (https://www.adafruit.com/products/592)
  - 5v USB Power supply (https://www.adafruit.com/products/501)
  - Cobbler and Breakout board for prototyping (http://www.amazon.com/gp/product/B00OG531XI?psc=1&redirect=true&ref_=oh_aui_detailpage_o01_s00)
  - Snack dispensor (http://www.amazon.com/gp/product/B0053TC9YS?psc=1&redirect=true&ref_=oh_aui_detailpage_o02_s00)
  - Male to male wires

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


# pub sub model - might be too much work
- tell server interested in outcome of event
- polling server w/ pi is what i'm doing now

-- JS poll to rails server checking if update --

- Create Python scripts to call browser API
  - Get request to find out instructions
  - Post to send confirmation
- Create cron job to run automatically
  -http://unix.stackexchange.com/questions/11102/cron-running-job-every-15-seconds
  - http://www.devils-heaven.com/raspberry-pi-cron-jobs/
  - http://trevorappleton.blogspot.com/2014/06/scheduling-python-programs-using-cron.html
  - https://pypi.python.org/pypi/python-crontab

- Checkin questions
  - Python for code climate
  - Testing for python/hardware
  - Expanding to multiple users so it can be used by anyone who builds feeder
    - does the authenticate method ensure the logged in user's key is being used in the api call?
    - Why can't I use sessions in API call
    - error

  - What seems like good priority -- extending, more hardware, jquery and style
  - Or should work on stats?
  - Monitor if confirmation is sent from Pi
  - Heroku okay?

  - build out doc for Pi --> really focus on it
  -- every time motor turns, send post request
  - - extract token
-- Tech challenge -- the moment i realized the token needed to belong to the pet/feeder, and the code explosion that followed. It solved the actual use case I'd had in mind all along, only I didn't realize until it was nearly done.
