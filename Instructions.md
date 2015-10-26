## Build a Robot Pet Feeder
Welcome! Below are instructions for building your own remote controlled pet feeder. Included are instructions on linking your device to the [Robo Feeder](www.robofeedpet.com) site, which allows you to trigger the device remotely, as well as schedule feedings. 

- Software
    + Supplies
    + Configure Raspberry Pi
    + Remote options for using Pi
    + Code
- Hardware
    + Supplies
    + Solder micro USB
    + Test servo
    + Drill collar
    + Hot glue handle to servo head

## Software

- Supplies
    + Raspberry Pi (Example is model B+)
    + 32GB SD Card or pre-configured card 
    + USB Wifi Dongle 
    + Keyboard
    + Monitor 

- Configure Raspberry Pi
    There is some set up required to get your Pi up and running, especially if you wish to use Wifi.
    + Download an Operating System image. You will need to plug the Pi into a monitor or TV w/ and HDMI cable and connect a keyboard. For this example, I opted to install Raspian. For great instructions, see the Raspberry Pi [quick start guide](https://www.raspberrypi.org/help/quick-start-guide/)
    + [This](http://raspberrypihq.com/how-to-add-wifi-to-the-raspberry-pi/) guide was very useful in providing instructions for configuring wifi on the Pi. 
    
- Remote Access for the Pi
    Once you have the Pi setup with an OS and internet, you might want to access the terminal on the Pi remotely. There are many ways to do this. I SSHed into the terminal and used a sublime package to open files using Sublime 2. 
    + Instructions for SSH can be found in the [Pi documentation](https://www.raspberrypi.org/documentation/remote-access/ssh/unix.md). You must be on the same network as the Pi, and have information about the IP address of the Pi (you can find this by typing 'hostname -I' into the terminal).
    + If you want the ability to edit files in a text editor other than nano, then the intsructions [here](http://www.onenorth.com/blog/post/editing-files-on-raspberry-pi-with-local-sublime) are excellent for getting set up using sublime. You SSH into the Pi, and open and work on files from the Pi on your machine. 


## Hardware
- Supplies
    + Continuos Rotation Servo motor (https://www.adafruit.com/products/154)
    + Micro USB Breakout Board https://www.adafruit.com/products/1833)
    + USB Cable (https://www.adafruit.com/products/592)
    + 5v USB Power supply (https://www.adafruit.com/products/501)
    + Cobbler and Breakout board for prototyping (http://www.amazon.com/gp/product/B00OG531XI?psc=1&redirect=true&ref_=oh_aui_detailpage_o01_s00)
    + Snack dispensor (http://www.amazon.com/gp/product/B0053TC9YS?psc=1&redirect=true&ref_=oh_aui_detailpage_o02_s00)
    + Male to male wires
    + Bolts and nuts
    + Aluminum or flexible plastic sheet
    + Wire or paper clips
- Tools
    + Hot glue gun
    + Wire cutters
    + Drill
    + Dremmel

