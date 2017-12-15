# IoT.Starter.Pi.Thing		

##### IoT Starter Pi Thing starts the app for Home Intelligence using a Raspberry Pi with Linux.

The Raspberry Pi (RPI) with arm 32-bit CPU is supposed to be equipped with custom hardware like temperature and humidity sensors, proximity sensors, and maybe motors to open doors and windows. Infrared leds are very interesting, since they enable RPI to output commands to home appliances, as a universal remote control. The objective is to develop a user friendly  control to ambient light, air conditioner, home theater, etc.

This `Thing` is based on the [IoT.Starter.Pi.Core](https://github.com/josemotta/IoT.Starter.Pi.Core "IoT.Starter.Pi.Core") which means the home-web and home-ui  projects are the starting points for this project. Main directions are summarized below:

- Modeling follows API First strategy, in order to define the services provided by the `Thing`.
- The API should decompose the intelligence of the `Thing` concerning security, control and data access.
- Programming and Development (P&D) will be accomplished at a speedy x64 micro with Windows 10 and Visual Studio 2017 exploring .NET Core 2.0 and ASP.NET Core 2.0 platforms.
- Deployment at RPI is based on Docker. Code is generated at x64 machine,  containers are pushed to the cloud and then pulled back to be deployed at the RPI.
- IoT Starter Pi Thing includes basic stuff to be included in any `Thing`.
- Future projects are expected to start from the `Thing`.

### Product Modeling

- The `Thing` maybe installed at some location (coordinates or zip code) and internal zones (0-n);
- Each `Thing` will be designed to handle some home environment (temperature, humidity), lighting, sound (music, video), etc.
- The `Thing` may report data/activities to the cloud, for example, to a `ThingHub` website;
- A temperature and humidity sensor is mandatory at any `Thing`;
- Temperature and humidity will be reported to the `ThingHub`;

### P&D

### Deploy

### Test


