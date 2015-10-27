## Build a Robot Pet Feeder (v1)
Welcome! Below are instructions for building your own remote controlled pet feeder. Included are instructions on linking your device to the [Robo Feeder](www.robofeedpet.com) site, which allows you to trigger the device remotely, as well as schedule feedings. 

The site serves as an API for your Raspberry Pi.The example code below will make requests to endpoints on the API that provide instructions for the Pi and by extension, the feeder. 

- Software
    + Supplies
    + Configure Raspberry Pi
    + Remote options for using Pi
    + Code
        * Python
        * Cron
- Hardware
    + Supplies
    + Solder micro USB
    + Wire servo
    + Modify snack dispensor
    + Connect it all up!

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
    + Download modules
        * python-crontab
        * requests
        
- Remote Access for the Pi
    Once you have the Pi setup with an OS and internet, you might want to access the terminal on the Pi remotely. There are many ways to do this. I SSHed into the terminal and used a sublime package to open files using Sublime 2. 
    + Instructions for SSH can be found in the [Pi documentation](https://www.raspberrypi.org/documentation/remote-access/ssh/unix.md). You must be on the same network as the Pi, and have information about the IP address of the Pi (you can find this by typing 'hostname -I' into the terminal).
    + If you want the ability to edit files in a text editor other than nano, then the intsructions [here](http://www.onenorth.com/blog/post/editing-files-on-raspberry-pi-with-local-sublime) are excellent for getting set up using sublime. You SSH into the Pi, and open and work on files from the Pi on your machine. 
- Code
    + Servo Code
        The code to move the servo is quite simple.   
             ```py
            if r["request"] == "feed":
            import servo1;
            send_confirmation();
            else:
            print "No food now"
            ```
    + API Code  
    The code below will send a request to the Robo Feeder website and recieve a response. The data in the response will dictate which action the Pi will perform. You can see more in the comments. 
        ```py
        placeholder for api.code
        ```py
    + Cron  
        [Cron](https://www.raspberrypi.org/documentation/linux/usage/cron.md) is a useful way to schedule requests to the Robo Feeder API and website. You can use cron to poll the API and check for new feed requests or scheduled feedings. There are a [few tutorials](http://www.devils-heaven.com/raspberry-pi-cron-jobs/) out there that helped me understand cron jobs. 
        * To create new cron jobs, you can type 'sudo crontab -e' aenter new cron jobs.
        * The code below will run a cron job every 15 seconds. 
            ```
            - * * * * sleep 00; some_job
            - * * * * sleep 15; some_job
            - * * * * sleep 30; some_job
            - * * * * sleep 45; some_job 
            ```
        * You will also need to use the python-crontab module. This will allow python to create a new cron job, as well as remove jobs depending on what data is sent from the API.
        * Wrap python files in sh files that 'launch' the code. 
        


## Hardware
- Supplies
    + Continuos Rotation Servo motor (https://www.adafruit.com/products/154)
    + Micro USB Breakout Board https://www.adafruit.com/products/1833)
    + USB Cable (https://www.adafruit.com/products/592)
    + 5v USB Power supply (https://www.adafruit.com/products/501)
    + Cobbler and Breakout board for prototyping (http://www.amazon.com/gp/product/B00OG531XI?psc=1&redirect=true&ref_=oh_aui_detailpage_o01_s00)
    + Prototyping breadboard
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
- Prepare Micro USB
    The first hardware component to get going is to solder the micro USB. You need to solder the pins to the shield, which will then allow you to plug it into the breadboard. The 5v USB power supply will be plugged into the shield. This will power the servo. 
- Wire Servo
    + Connect the cobbler to the breadbread
    + The servo needs to be connected to the breadboard, as well as to the power supply
    + You can see an example of how to wire [here](https://learn.adafruit.com/adafruits-raspberry-pi-lesson-8-using-a-servo-motor/hardware)
- Test!  
    Before building modifying the feeder, it's a good idea to test that the code will turn the servo. 
    + Run code using 'python servo.py'
- Modify Snack Dispensor
    + Remove or modify handle
    + Drill holes in aluminum collar
    + Drill holes in dispensor
    + Glue servo head to handle or handle bar
    + Place servo on bolts to hold into place

## Put it all together
- In the python code examples above, replace the "token" with the token provided by the Robo Feeder account
- Test!

    

