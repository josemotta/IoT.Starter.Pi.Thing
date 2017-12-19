# IoT.Starter.Pi.Thing		

### IoT Starter Pi Thing develops a cell for Home Intelligence using a Raspberry Pi with Linux.

The Raspberry Pi (RPI) with arm 32-bit CPU is supposed to be equipped with custom hardware like temperature and humidity sensors, proximity sensors, and maybe motors to open doors and windows in the near future. Infrared leds are very interesting components to be explored, since they enable RPI to output commands to home appliances, as a universal remote control. The objective is to develop the `Thing`, a user friendly IoT device that may help us to manage ambient light, air conditioner and home theater among others.

The `Thing` is based on the [IoT.Starter.Pi.Core](https://github.com/josemotta/IoT.Starter.Pi.Core "IoT.Starter.Pi.Core") which means home-web and home-ui are the starting projects. Main directions are summarized below:

- Modeling follows API First strategy, in order to define the services provided by the `Thing`.
- The API modeling should decompose the intelligence of the `Thing` concerning security, control and data access.
- Programming and Development (P&D) will be accomplished at speedy x64 micros with Windows 10 and Visual Studio 2017 exploring .NET Core 2.0 and ASP.NET Core 2.0 platforms.
- Deployment at RPI is based on Docker containers. As shown at this Alex Ellis [tutorial](https://blog.alexellis.io/dotnetcore-on-raspberrypi/ "Build .NET Core apps for Raspberry Pi with Docker"), code is generated at x64 machine,  containers are pushed to the cloud and then pulled back to be deployed at the RPI.
- IoT Starter Pi Thing includes basic stuff to be included in any `Thing`, which means future projects are expected to start from this `Thing`.

### 1. Modeling

- The `Thing` is installed at some location (coordinates or zip code) and internal zone (0-n);
- Each `Thing` will be designed to handle some home environment (temperature, humidity), lighting, sound (music, video).
- The `Thing` may use an external website, in order to store and retrieve info related to its activities;
- A temperature (optionally also humidity) sensor is mandatory at any `Thing`. It is expected that temperature (and humidity)  of each `Thing` be reported to an external website;

### 2. Programming and Development (P&D)

#### Project home-web

#### Project home-ui

### 3. Deploy

#### Linux

The RPI is supposed to be installed with following: 

- The Linux Raspbian GNU/Linux 9.1 (stretch) [Lite version](https://www.raspberrypi.org/downloads/raspbian/) is used to initialize the `Thing`. Generate the Micro SD Card at your micro with [Etcher](https://www.raspberrypi.org/magpi/pi-sd-etcher/), for example, and boot the RPI.
- Then it is wise to update/upgrade everything, I suggest a tutorial published by Tlindener in 2015, please get it [here](http://thinghub.net/blog/2015/08/31/setup-raspberrypi-with-minified-raspbian-minibian/). Skip the beginning and start at step 3. Just in case, if you need the configuration program raspi-config, it is already available at Lite version. 

#### Temperature Sensor DS18B20 1-wire

The Thing is attached to a temperature sensor that support 1-Wire. Many models are available, for example, the DS18B20 described below.

- [Dallas DS18B20](https://cdn.sparkfun.com/datasheets/Sensors/Temp/DS18B20.pdf "DS18B20") Programmable Resolution 1-Wire Digital Thermometer
- Keyes assembly already includes pull up and led

![DS18B20](https://i.imgur.com/MgeMeal.png)


##### 1-Wire setup

Append to /boot/config.txt (no spaces) and reboot. Sensor is attached to GPIO 4 of RPi header pin 7.

    # Enable 1-wire interface
    dtoverlay=w1-gpio-pullup,gpiopin=4

##### Commands

	#Start
    modprobe w1_gpio
    modprobe w1_therm

    #List
	lsmod | grep w1

	#Read the temperature
    cd /sys/bus/w1/devices
    cd 28-*
    cat w1_slave

Following is a screenshot, showing several commands related to temperature sensor. First, the `lsmod` command filtered by `grep` shows w1-related modules. Then, navigating through the /sys directory we may check the sensors details. After reading from our component with `cat w1_slave` command, the value appears at bottom, after "t=". The actual temperature is 27.750 degrees Celsius and "YES" means that CRC was checked OK after DS18B20 transmitted the info to RPI. A simple and safe device that can be multiplied, thanks to the 1-wire bus technology. Please note that all this is built in  in the Linux Lite version.

	pi@lumi:~ $ lsmod | grep w1
	w1_therm                6401  0
	w1_gpio                 4818  0
	wire                   32619  2 w1_gpio,w1_therm
	pi@lumi:~ $ cd /sys/bus/w1/devices
	pi@lumi:/sys/bus/w1/devices $ ll
	total 0
	lrwxrwxrwx 1 root root 0 Dec 18 18:27 28-00000523113b -> ../../../devices/w1_bus_master1/28-00000523113b
	lrwxrwxrwx 1 root root 0 Dec 18 18:27 w1_bus_master1 -> ../../../devices/w1_bus_master1
	pi@lumi:/sys/bus/w1/devices $ cd 28-*
	pi@lumi:/sys/bus/w1/devices/28-00000523113b $ ll
	total 0
	lrwxrwxrwx 1 root root    0 Dec 18 18:28 driver -> ../../../bus/w1/drivers/w1_slave_driver
	-r--r--r-- 1 root root 4096 Dec 18 18:28 id
	-r--r--r-- 1 root root 4096 Dec 18 18:28 name
	drwxr-xr-x 2 root root    0 Dec 18 18:28 power
	lrwxrwxrwx 1 root root    0 Dec 18 18:28 subsystem -> ../../../bus/w1
	-rw-r--r-- 1 root root 4096 Dec 18 18:28 uevent
	-rw-r--r-- 1 root root 4096 Dec 18 18:28 w1_slave
	pi@lumi:/sys/bus/w1/devices/28-00000523113b $ cat w1_slave
	bc 01 4b 46 7f ff 04 10 d2 : crc=d2 YES
	bc 01 4b 46 7f ff 04 10 d2 t=27750
	pi@lumi:/sys/bus/w1/devices/28-00000523113b $

### 4. Test


