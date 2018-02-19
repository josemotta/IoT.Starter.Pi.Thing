# IoT.Starter.Pi.Thing		

#### Home Intelligence with Raspberry Pi

### Embryos for Home Intelligence using Raspberry Pi with Linux, Docker & .NET Core.

:star: *Please star this project if you find it useful!*

This project develops microservices based on API First Design, targeting Raspberry Pi with Linux. In order to speed up IoT initiatives, the IoT starter evolves a customizable, ready to run, `Thing` device. A comprehensive path is provided by following episodes:

1. [**IoT.Starter.Pi.Core**](https://github.com/josemotta/IoT.Starter.Pi.Thing/wiki/1.-IoT.Starter.Pi.Core): At this project targeted to Raspberry Pi with Linux, the API First Design strategy is used to develop an ASP.NET Core Web Server automatically generated by SwaggerHub. 

2. [**IoT.Starter.Pi.Thing**](https://github.com/josemotta/IoT.Starter.Pi.Thing/wiki/2.-IoT.Starter.Pi.Thing): IoT Starter Pi Thing includes the basic stuff to be included in any `Thing`, which means future projects are expected to start from here. 

3. [**IoT.Starter.Pi.Lirc**](https://github.com/josemotta/IoT.Starter.Pi.Thing/wiki/3.-IoT.Starter.Pi.Lirc): This mission provides infrared (IR) output capability to IoT.Starter.Pi.Thing. 

4. [**IoT.Starter.Pi.Lumi**](https://github.com/josemotta/IoT.Starter.Pi.Thing/wiki/4.-IoT.Starter.Pi.Lumi): At this complement of the third part, the API and corresponding web service is extended to consider IR remotes and their respective codes. 

5. [**IoT.Starter.Pi.Compose**](https://github.com/josemotta/IoT.Starter.Pi.Thing/wiki/5.-IoT.Starter.Pi.Compose): At Raspberry Pi side, running each container separately is still somewhat time consuming. Taking `Thing` a step further, docker-composer `up` is used to load images, create containers &  relationships, and run them all.

After each change on the [API](https://app.swaggerhub.com/apis/motta/home), SwaggerHub automatically generates updated code for `home-web` with corresponding web service. The `Thing` has also `home-ui` and `nginx-proxy` images, handling respectively user interface and SSL security. They all run in separate docker containers, cooperating and sharing common resources with a host powered by Raspberry Pi with Linux & .NET Core. 

The solution builds fast and efficiently at a speedy x64 machine equipped with Windows 10 and Visual Studio 2017. The docker-compose `build` command follows the steps from each `dockerfile`, generating the images below that are finally pushed to DockerHub registry:

- [nginx-proxy](https://hub.docker.com/r/josemottalopes/nginx-proxy/)
- [home-web](https://hub.docker.com/r/josemottalopes/home-web/) (or [home-web-ir](https://hub.docker.com/r/josemottalopes/home-web-ir/))
- [home-ui](https://hub.docker.com/r/josemottalopes/home-ui/)

At Raspberry Pi, running each container manually is somewhat time consuming. Taking  `IoT.Starter.Pi.Thing` a step further with docker-composer `up` command, the same `docker-compose.yml` file, used at `build` phase by x64 machine, is reused to load images, create containers, establish their relationships, and run them all. This time at Raspberry Pi side.

The code will keep evolving `IoT.Starter.Pi.Thing` embryos powered by open API First Design and [IoT starter](https://github.com/josemotta/IoT.Starter.Np2.Core) concepts. 

## IOT STARTER

| IoT starter  | **Thing** | **Thing-IR** |  
| :---         |     :---:      |          :---: |  
| useful for  | all IoT projects |  infrared (IR) IoT projects |  
| description | embryo for IoT | IR embryo for IoT, powered by Lirc | 
| SSL proxy   | [nginx-proxy](https://hub.docker.com/r/josemottalopes/nginx-proxy/)     | [nginx-proxy](https://hub.docker.com/r/josemottalopes/nginx-proxy/)    |  
| user interface     | [home-ui](https://hub.docker.com/r/josemottalopes/home-ui/)       | [home-ui](https://hub.docker.com/r/josemottalopes/home-ui/)      |  
| web service  | [home-web](https://hub.docker.com/r/josemottalopes/home-web/)       | [home-web-ir](https://hub.docker.com/r/josemottalopes/home-web-ir/)      | 

## Memory available

After all three containers running at Raspberry Pi 2 model B with Linux, the `free -h` command below detects more than 400 Mbytes free memory. By definition of IoT Starter concept, `IoT.Starter.Pi.Thing` comes with just basic stuff, ready to start the development of your IoT initiative. Then, this is the RAM amount available for `home-web` and `home-ui` growth.

	pi@lumi:~ $ docker ps
	CONTAINER ID        IMAGE                        COMMAND                  CREATED             STATUS              PORTS                          NAMES
	ae97ff490db3        josemottalopes/home-web-ir   "dotnet IO.Swagger.dâ¦"   18 hours ago        Up 18 hours         0.0.0.0:5010->5010/tcp         home-web-ir
	d4c58be28387        josemottalopes/nginx-proxy   "nginx -g 'daemon ofâ¦"   18 hours ago        Up 18 hours         80/tcp, 0.0.0.0:443->443/tcp   ssl-proxy
	00fc3028480f        josemottalopes/home-ui       "dotnet Home.UI.dll"     18 hours ago        Up 18 hours         0.0.0.0:80->80/tcp             home-ui

	pi@lumi:~ $ free -h
	              total        used        free      shared  buff/cache   available
	Mem:           927M        179M        411M         58M        335M        639M
	Swap:           99M          0B         99M

As shown by `df -h` command, the 15 GB disk mounted at Raspberry Pi 2 model B with Linux still have 10 GB free space.

	pi@lumi:~ $ df -h
	Filesystem      Size  Used Avail Use% Mounted on
	/dev/root        15G  4.1G  9.5G  30% /
	devtmpfs        460M     0  460M   0% /dev
	tmpfs           464M     0  464M   0% /dev/shm
	tmpfs           464M   13M  452M   3% /run
	tmpfs           5.0M  4.0K  5.0M   1% /run/lock
	tmpfs           464M     0  464M   0% /sys/fs/cgroup
	/dev/mmcblk0p1   42M   21M   21M  51% /boot
	tmpfs            93M     0   93M   0% /run/user/1000



