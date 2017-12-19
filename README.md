# IoT.Starter.Pi.Thing		

### IoT Starter Pi Thing starts the app for Home Intelligence using a Raspberry Pi with Linux.

The Raspberry Pi (RPI) with arm 32-bit CPU is supposed to be equipped with custom hardware like temperature and humidity sensors, proximity sensors, and maybe motors to open doors and windows in the near future. Infrared leds are very interesting components to be explored, since they enable RPI to output commands to home appliances, as a universal remote control. The objective is to develop the `Thing`, a user friendly IoT device that may help us to manage ambient light, air conditioner and home theater among  others at home.

The `Thing` is based on the [IoT.Starter.Pi.Core](https://github.com/josemotta/IoT.Starter.Pi.Core "IoT.Starter.Pi.Core") which means home-web and home-ui are the starting projects. Main directions are summarized below:

- Modeling follows API First strategy, in order to define the services provided by the `Thing`.
- The API modeling should decompose the intelligence of the `Thing` concerning security, control and data access.
- Programming and Development (P&D) will be accomplished at a speedy x64 micro with Windows 10 and Visual Studio 2017 exploring .NET Core 2.0 and ASP.NET Core 2.0 platforms.
- Deployment at RPI is based on Docker. Code is generated at x64 machine,  containers are pushed to the cloud and then pulled back to be deployed at the RPI.
- IoT Starter Pi Thing includes basic stuff to be included in any `Thing`, which means future projects are expected to start from this `Thing`.

### Modeling

- The `Thing` is installed at some location (coordinates or zip code) and internal zone (0-n);
- Each `Thing` will be designed to handle some home environment (temperature, humidity), lighting, sound (music, video).
- The `Thing` may report to the cloud, for example to a `ThingHub` website, in order to store and retrieve info related to its activities;
- A temperature (optionally also humidity) sensor is mandatory at any `Thing`. It is expected that temperature (and humidity)  of each `Thing` be reported to `ThingHub`;

### Programming and Development (P&D)

#### Project home-web

#### Project home-ui

### Deploy

The RPI is supposed to be installed with following: 

- The Linux Raspbian GNU/Linux 9.1 (stretch) [Lite version](https://www.raspberrypi.org/downloads/raspbian/) is used to initialize the `Thing`. Generate the Micro SD Card at your micro with [Etcher](https://www.raspberrypi.org/magpi/pi-sd-etcher/), for example, and boot the RPI.
- Then it is wise to update/upgrade everything, I suggest a tutorial published by Tlindener in 2015, please get it [here](http://thinghub.net/blog/2015/08/31/setup-raspberrypi-with-minified-raspbian-minibian/). Skip the beginning and start at step 3. Just in case, if you need the configuration program raspi-config, it is already available at Lite version. 

### Test


