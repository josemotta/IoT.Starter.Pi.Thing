# IoT Starter Pi Thing

### Code for Raspberry Pi with Linux

| `IoT Starter`  | **Thing** | **Thing-IR** |  
| :---         |     :---      |          :--- |  
|   |  |   |  
| useful for  | all projects |  infrared (IR) projects |  
| description | embryo for IoT | IR embryo for IoT, powered by Lirc | 
|   |  |   |  
| **At x64 machine**  |  |   |  
| **web service**  | [home-web](https://hub.docker.com/r/josemottalopes/home-web/)       | [home-web-ir](https://hub.docker.com/r/josemottalopes/home-web-ir/)      | 
|  | [src/IO.Swagger/pi.Dockerfile](https://github.com/josemotta/IoT.Starter.Pi.Thing/blob/master/home/src/IO.Swagger/pi.Dockerfile)       | [Lirc/lumi.Dockerfile](https://github.com/josemotta/IoT.Starter.Pi.Thing/blob/master/home/Lirc/lumi.dockerfile/)      | 
| **user interface**     | [home-ui](https://hub.docker.com/r/josemottalopes/home-ui/)       | [home-ui](https://hub.docker.com/r/josemottalopes/home-ui/)      |  
|      | [src/Home.UI/pi.Dockerfile](https://github.com/josemotta/IoT.Starter.Pi.Thing/blob/master/home/src/Home.UI/pi.Dockerfile)       | [src/Home.UI/pi.Dockerfile](https://github.com/josemotta/IoT.Starter.Pi.Thing/blob/master/home/src/Home.UI/pi.Dockerfile)       |  
| **ssl proxy**   | [nginx-proxy](https://hub.docker.com/r/josemottalopes/nginx-proxy/)     | [nginx-proxy](https://hub.docker.com/r/josemottalopes/nginx-proxy/)    |  
|   | [Proxy/proxy.Dockerfile](https://github.com/josemotta/IoT.Starter.Pi.Thing/blob/master/home/Proxy/proxy.Dockerfile)     | [Proxy/proxy.Dockerfile](https://github.com/josemotta/IoT.Starter.Pi.Thing/blob/master/home/Proxy/proxy.Dockerfile)     |  
| compose file  | [home/thing-compose.yml](https://github.com/josemotta/IoT.Starter.Pi.Thing/blob/master/home/thing-compose.yml) |  [home/lumi-compose.yml](https://github.com/josemotta/IoT.Starter.Pi.Thing/blob/master/home/lumi-compose.yml) |  
| commands:  |  |   |  
| - build | docker-compose -f thing-compose.yml build |  docker-compose -f lumi-compose.yml build |
| - push  | docker-compose -f thing-compose.yml push |  docker-compose -f lumi-compose.yml push |    
|   |  |   |  
| **At Raspberry Pi**  |  |   |  
| commands:  |  |   |  
| - update | docker-compose -f thing-compose.yml pull |  docker-compose -f lumi-compose.yml pull |    
| - run | docker-compose -f thing-compose.yml up -d |  docker-compose -f lumi-compose.yml up -d |    
| - stop/remove  | docker-compose -f thing-compose.yml down |  docker-compose -f lumi-compose.yml down |    

### Code for x64 with Windows 10

Use Visual Studio 2017 default building and run scheme to test code at x64 machine.

#### docker-compose.yml  

home-web: src/IO.Swagger/Dockerfile  
home-ui: src/Home.UI/Dockerfile  

## Build & push linux-arm code at x64 machine

Build all images and push them to DockerHub using a couple commands:

	# build for Thing
	$ docker-compose -f thing-compose.yml build
	$ docker-compose -f thing-compose.yml push

	# build for Thing-IR with infrared support
	$ docker-compose -f lumi-compose.yml build
	$ docker-compose -f lumi-compose.yml push

Below is a typical build & push session:

	jo@CANOAS24 MINGW64 /c/_git/IoT.Starter.Pi.Thing (master)
	$ cd home
	
	jo@CANOAS24 MINGW64 /c/_git/IoT.Starter.Pi.Thing/home (master)
	$ docker-compose -f lumi-compose.yml build
	Building home.ui
	Step 1/22 : FROM microsoft/dotnet:2.0.0-runtime-stretch-arm32v7 AS base
	2.0.0-runtime-stretch-arm32v7: Pulling from microsoft/dotnet
	0d9fbbfaa2cd: Already exists
	df2edba83b75: Pull complete
	585b7c106138: Pull complete
	fe88d40d3842: Pull complete
	Digest: sha256:912b8b14a5c2a9b15b8d3ae2d435c584e04c3de4b47298f6548984bb3724d605
	Status: Downloaded newer image for microsoft/dotnet:2.0.0-runtime-stretch-arm32v7
	 ---> 3ae39f545a0e
	Step 2/22 : ENV DOTNET_CLI_TELEMETRY_OPTOUT 1
	 ---> Running in 494ebf04ce0b
	 ---> d2cf12224843
	Removing intermediate container 494ebf04ce0b
	Step 3/22 : ENV ASPNETCORE_URLS "http://*:80"
	 ---> Running in 18b4a8a6671c
	 ---> 9300803c70ba
	Removing intermediate container 18b4a8a6671c
	Step 4/22 : WORKDIR /app
	 ---> 1a9a3390af04
	Removing intermediate container 720b8e647fa9
	Step 5/22 : EXPOSE 80
	 ---> Running in e410e0256ee4
	 ---> eb8a296f4da7
	Removing intermediate container e410e0256ee4
	Step 6/22 : FROM microsoft/dotnet:2.0-sdk AS build
	2.0-sdk: Pulling from microsoft/dotnet
	3e731ddb7fc9: Pull complete
	47cafa6a79d0: Pull complete
	79fcf5a213c7: Pull complete
	68e99216b7ad: Pull complete
	1d7d492634b7: Pull complete
	4c5ae8f461a0: Pull complete
	35c7f2041358: Pull complete
	Digest: sha256:e66e192f5aebae70d70df8e3b1b070f4de3ac0851006737652da664575f307f1
	Status: Downloaded newer image for microsoft/dotnet:2.0-sdk
	 ---> 0d92e6d42a8a
	Step 7/22 : ENV DOTNET_CLI_TELEMETRY_OPTOUT 1
	 ---> Running in 0d61c8e26c17
	 ---> fa397586a746
	Removing intermediate container 0d61c8e26c17
	Step 8/22 : ENV ASPNETCORE_URLS "http://*:80"
	 ---> Running in 27e7e9d62543
	 ---> 33246db5bc26
	Removing intermediate container 27e7e9d62543
	Step 9/22 : WORKDIR /src
	 ---> 35ce8d18a811
	Removing intermediate container c41c0d82f930
	Step 10/22 : COPY *.sln ./
	 ---> 3ebe0de4614b
	Step 11/22 : COPY *.dcproj ./
	 ---> 8f3191163150
	Step 12/22 : COPY src/Home.UI/Home.UI.csproj src/Home.UI/
	 ---> db80ea8bbacd
	Step 13/22 : RUN dotnet restore src/Home.UI/
	 ---> Running in 1adebd2763f7
	  Restoring packages for /src/src/Home.UI/Home.UI.csproj...
	  Restoring packages for /src/src/Home.UI/Home.UI.csproj...
	  Installing Microsoft.VisualStudio.Web.CodeGeneration.Contracts 2.0.1.
	  Installing Microsoft.VisualStudio.Web.CodeGeneration.Tools 2.0.1.
	  Restore completed in 3.13 sec for /src/src/Home.UI/Home.UI.csproj.
	  Installing Microsoft.AspNetCore.NodeServices 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.Formatters.Xml 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.Localization 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.Razor 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.RazorPages 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.Cors 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.ApiExplorer 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.Razor.ViewCompilation 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.TagHelpers 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.DataAnnotations 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.Core 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.ViewFeatures 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.Formatters.Json 2.0.1.
	  Installing Microsoft.AspNetCore.SpaServices 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.Abstractions 2.0.1.
	  Installing Microsoft.AspNetCore.All 2.0.3.
	  Generating MSBuild file /src/src/Home.UI/obj/Home.UI.csproj.nuget.g.props.
	  Generating MSBuild file /src/src/Home.UI/obj/Home.UI.csproj.nuget.g.targets.
	  Restore completed in 4.36 sec for /src/src/Home.UI/Home.UI.csproj.
	 ---> 086e00826aae
	Removing intermediate container 1adebd2763f7
	Step 14/22 : COPY . .
	 ---> 53f053813bb5
	Step 15/22 : WORKDIR /src/src/Home.UI
	 ---> fe52e5d0bc22
	Removing intermediate container d7113d5b58c1
	Step 16/22 : RUN dotnet build -c Development -r linux-arm -o /app
	 ---> Running in 4267bc6fe808
	Microsoft (R) Build Engine version 15.5.180.51428 for .NET Core
	Copyright (C) Microsoft Corporation. All rights reserved.
	
	  Restoring packages for /src/src/Home.UI/Home.UI.csproj...
	  Restoring packages for /src/src/Home.UI/Home.UI.csproj...
	  Restore completed in 455.47 ms for /src/src/Home.UI/Home.UI.csproj.
	  Installing runtime.unix.System.Private.Uri 4.3.0.
	  Installing runtime.any.System.Globalization.Calendars 4.3.0.
	  Installing runtime.unix.System.Net.Primitives 4.3.0.
	  Installing runtime.any.System.Runtime.Handles 4.3.0.
	  Installing runtime.unix.Microsoft.Win32.Primitives 4.3.0.
	  Installing runtime.any.System.Diagnostics.Tracing 4.3.0.
	  Installing System.Private.Uri 4.3.0.
	  Installing runtime.any.System.Reflection.Primitives 4.3.0.
	  Installing runtime.linux-arm.Microsoft.NETCore.DotNetAppHost 2.0.0.
	  Installing runtime.any.System.Threading.Timer 4.3.0.
	  Installing runtime.unix.System.Net.Sockets 4.3.0.
	  Installing runtime.any.System.Runtime.InteropServices 4.3.0.
	  Installing runtime.unix.System.IO.FileSystem 4.3.0.
	  Installing runtime.unix.System.Console 4.3.0.
	  Installing runtime.any.System.Diagnostics.Tools 4.3.0.
	  Installing runtime.unix.System.Runtime.Extensions 4.3.0.
	  Installing runtime.any.System.Runtime 4.3.0.
	  Installing runtime.any.System.Globalization 4.3.0.
	  Installing runtime.any.System.IO 4.3.0.
	  Installing runtime.any.System.Collections 4.3.0.
	  Installing runtime.any.System.Text.Encoding 4.3.0.
	  Installing runtime.any.System.Reflection 4.3.0.
	  Installing runtime.any.System.Threading.Tasks 4.3.0.
	  Installing runtime.unix.System.Diagnostics.Debug 4.3.0.
	  Installing runtime.any.System.Text.Encoding.Extensions 4.3.0.
	  Installing runtime.any.System.Reflection.Extensions 4.3.0.
	  Installing runtime.any.System.Resources.ResourceManager 4.3.0.
	  Installing runtime.linux-arm.Microsoft.NETCore.DotNetHostResolver 2.0.0.
	  Installing runtime.linux-arm.Microsoft.NETCore.DotNetHostPolicy 2.0.0.
	  Installing runtime.linux-arm.Microsoft.NETCore.App 2.0.0.
	  Generating MSBuild file /src/src/Home.UI/obj/Home.UI.csproj.nuget.g.props.
	  Generating MSBuild file /src/src/Home.UI/obj/Home.UI.csproj.nuget.g.targets.
	  Restore completed in 7.73 sec for /src/src/Home.UI/Home.UI.csproj.
	  Home.UI -> /app/Home.UI.dll
	
	Build succeeded.
	    0 Warning(s)
	    0 Error(s)
	
	Time Elapsed 00:00:12.09
	 ---> fcc8809646ee
	Removing intermediate container 4267bc6fe808
	Step 17/22 : FROM build AS publish
	 ---> fcc8809646ee
	Step 18/22 : RUN dotnet publish -c Release -r linux-arm -o /app
	 ---> Running in 1fd7165d9645
	Microsoft (R) Build Engine version 15.5.180.51428 for .NET Core
	Copyright (C) Microsoft Corporation. All rights reserved.
	
	  Restore completed in 86.05 ms for /src/src/Home.UI/Home.UI.csproj.
	  Restore completed in 28.08 ms for /src/src/Home.UI/Home.UI.csproj.
	  Home.UI -> /src/src/Home.UI/bin/Release/netcoreapp2.0/linux-arm/Home.UI.dll
	  Home.UI -> /app/
	 ---> 4a34342d5b3b
	Removing intermediate container 1fd7165d9645
	Step 19/22 : FROM base AS final
	 ---> eb8a296f4da7
	Step 20/22 : WORKDIR /app
	 ---> 44be6fccc371
	Removing intermediate container a441d920dec9
	Step 21/22 : COPY --from=publish /app .
	 ---> 97752e147615
	Step 22/22 : ENTRYPOINT dotnet Home.UI.dll
	 ---> Running in ddecc2b58ee6
	 ---> 64b6123a3641
	Removing intermediate container ddecc2b58ee6
	Successfully built 64b6123a3641
	Successfully tagged josemottalopes/home-ui:latest
	Building io.swagger
	Step 1/27 : FROM microsoft/dotnet:2.0.0-runtime-stretch-arm32v7 AS base
	 ---> 3ae39f545a0e
	Step 2/27 : ENV DOTNET_CLI_TELEMETRY_OPTOUT 1
	 ---> Using cache
	 ---> d2cf12224843
	Step 3/27 : ENV ASPNETCORE_URLS "http://*:5010"
	 ---> Running in 5d7e0156aea6
	 ---> e37c4017638f
	Removing intermediate container 5d7e0156aea6
	Step 4/27 : WORKDIR /app
	 ---> 30d9da456beb
	Removing intermediate container 266b64229127
	Step 5/27 : RUN apt-get update   && apt-get upgrade -y   && apt-get install -y        lirc   --no-install-recommends &&   rm -rf /var/lib/apt/lists/*
	 ---> Running in 573866fb41a6
	Ign:1 http://deb.debian.org/debian stretch InRelease
	Get:2 http://deb.debian.org/debian stretch-updates InRelease [91.0 kB]
	Get:3 http://deb.debian.org/debian stretch Release [118 kB]
	Get:4 http://deb.debian.org/debian stretch Release.gpg [2434 B]
	Get:5 http://security.debian.org stretch/updates InRelease [63.0 kB]
	Get:6 http://deb.debian.org/debian stretch-updates/main armhf Packages [8338 B]
	Get:7 http://deb.debian.org/debian stretch/main armhf Packages [9306 kB]
	Get:8 http://security.debian.org stretch/updates/main armhf Packages [376 kB]
	Fetched 9965 kB in 31s (316 kB/s)
	Reading package lists...
	Reading package lists...
	Building dependency tree...
	Reading state information...
	Calculating upgrade...
	The following packages will be upgraded:
	  base-files curl iproute2 libcurl3 libicu57 libssl1.0.2 libtasn1-6
	  sensible-utils tzdata
	9 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
	Need to get 9842 kB of archives.
	After this operation, 48.1 kB disk space will be freed.
	Get:1 http://deb.debian.org/debian stretch/main armhf base-files armhf 9.9+deb9u3 [67.3 kB]
	Get:2 http://deb.debian.org/debian stretch-updates/main armhf tzdata all 2018c-0+deb9u1 [264 kB]
	Get:3 http://deb.debian.org/debian stretch/main armhf iproute2 armhf 4.9.0-1+deb9u1 [598 kB]
	Get:4 http://security.debian.org stretch/updates/main armhf sensible-utils all 0.0.9+deb9u1 [10.8 kB]
	Get:5 http://security.debian.org stretch/updates/main armhf libssl1.0.2 armhf 1.0.2l-2+deb9u2 [919 kB]
	Get:6 http://deb.debian.org/debian stretch/main armhf libicu57 armhf 57.1-6+deb9u1 [7450 kB]
	Get:7 http://security.debian.org stretch/updates/main armhf libtasn1-6 armhf 4.10-1.1+deb9u1 [45.7 kB]
	Get:8 http://security.debian.org stretch/updates/main armhf curl armhf 7.52.1-5+deb9u4 [223 kB]
	Get:9 http://security.debian.org stretch/updates/main armhf libcurl3 armhf 7.52.1-5+deb9u4 [264 kB]
	debconf: delaying package configuration, since apt-utils is not installed
	Fetched 9842 kB in 21s (468 kB/s)
	(Reading database ... 7097 files and directories currently installed.)
	Preparing to unpack .../base-files_9.9+deb9u3_armhf.deb ...
	Unpacking base-files (9.9+deb9u3) over (9.9+deb9u2) ...
	Setting up base-files (9.9+deb9u3) ...
	Installing new version of config file /etc/debian_version ...
	(Reading database ... 7097 files and directories currently installed.)
	Preparing to unpack .../sensible-utils_0.0.9+deb9u1_all.deb ...
	Unpacking sensible-utils (0.0.9+deb9u1) over (0.0.9) ...
	Setting up sensible-utils (0.0.9+deb9u1) ...
	(Reading database ... 7097 files and directories currently installed.)
	Preparing to unpack .../0-tzdata_2018c-0+deb9u1_all.deb ...
	Unpacking tzdata (2018c-0+deb9u1) over (2017b-1) ...
	Preparing to unpack .../1-iproute2_4.9.0-1+deb9u1_armhf.deb ...
	Unpacking iproute2 (4.9.0-1+deb9u1) over (4.9.0-1) ...
	Preparing to unpack .../2-libssl1.0.2_1.0.2l-2+deb9u2_armhf.deb ...
	Unpacking libssl1.0.2:armhf (1.0.2l-2+deb9u2) over (1.0.2l-2+deb9u1) ...
	Preparing to unpack .../3-libtasn1-6_4.10-1.1+deb9u1_armhf.deb ...
	Unpacking libtasn1-6:armhf (4.10-1.1+deb9u1) over (4.10-1.1) ...
	Preparing to unpack .../4-curl_7.52.1-5+deb9u4_armhf.deb ...
	Unpacking curl (7.52.1-5+deb9u4) over (7.52.1-5+deb9u2) ...
	Preparing to unpack .../5-libcurl3_7.52.1-5+deb9u4_armhf.deb ...
	Unpacking libcurl3:armhf (7.52.1-5+deb9u4) over (7.52.1-5+deb9u2) ...
	Preparing to unpack .../6-libicu57_57.1-6+deb9u1_armhf.deb ...
	Unpacking libicu57:armhf (57.1-6+deb9u1) over (57.1-6) ...
	Setting up tzdata (2018c-0+deb9u1) ...
	debconf: unable to initialize frontend: Dialog
	debconf: (TERM is not set, so the dialog frontend is not usable.)
	debconf: falling back to frontend: Readline
	debconf: unable to initialize frontend: Readline
	debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/arm-linux-gnueabihf/perl/5.24.1 /usr/local/share/perl/5.24.1 /usr/lib/arm-linux-gnueabihf/perl5/5.24 /usr/share/perl5 /usr/lib/arm-linux-gnueabihf/perl/5.24 /usr/share/perl/5.24 /usr/local/lib/site_perl /usr/lib/arm-linux-gnueabihf/perl-base .) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
	debconf: falling back to frontend: Teletype
	
	Current default time zone: 'Etc/UTC'
	Local time is now:      Thu Feb 15 18:07:43 UTC 2018.
	Universal Time is now:  Thu Feb 15 18:07:43 UTC 2018.
	Run 'dpkg-reconfigure tzdata' if you wish to change it.
	
	Setting up libicu57:armhf (57.1-6+deb9u1) ...
	Setting up iproute2 (4.9.0-1+deb9u1) ...
	Setting up libtasn1-6:armhf (4.10-1.1+deb9u1) ...
	Setting up libssl1.0.2:armhf (1.0.2l-2+deb9u2) ...
	debconf: unable to initialize frontend: Dialog
	debconf: (TERM is not set, so the dialog frontend is not usable.)
	debconf: falling back to frontend: Readline
	debconf: unable to initialize frontend: Readline
	debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/arm-linux-gnueabihf/perl/5.24.1 /usr/local/share/perl/5.24.1 /usr/lib/arm-linux-gnueabihf/perl5/5.24 /usr/share/perl5 /usr/lib/arm-linux-gnueabihf/perl/5.24 /usr/share/perl/5.24 /usr/local/lib/site_perl /usr/lib/arm-linux-gnueabihf/perl-base .) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
	debconf: falling back to frontend: Teletype
	Processing triggers for libc-bin (2.24-11+deb9u1) ...
	Setting up libcurl3:armhf (7.52.1-5+deb9u4) ...
	Setting up curl (7.52.1-5+deb9u4) ...
	Processing triggers for libc-bin (2.24-11+deb9u1) ...
	Reading package lists...
	Building dependency tree...
	Reading state information...
	The following additional packages will be installed:
	  dh-python libasound2 libasound2-data libexpat1 libftdi1-2 libjack-jackd2-0
	  liblirc-client0 liblirc0 libmpdec2 libopus0 libportaudio2 libpython3-stdlib
	  libpython3.5-minimal libpython3.5-stdlib libreadline7 libsamplerate0
	  libsqlite3-0 libusb-0.1-4 libusb-1.0-0 mime-support python3 python3-minimal
	  python3.5 python3.5-minimal readline-common
	Suggested packages:
	  libdpkg-perl libasound2-plugins alsa-utils jackd2 opus-tools
	  lirc-compat-remotes lirc-drv-irman lirc-doc lirc-x setserial ir-keytable
	  python3-doc python3-tk python3-venv python3.5-venv python3.5-doc binutils
	  binfmt-support readline-doc
	Recommended packages:
	  python3-yaml python3-gi gir1.2-vte bzip2 file xz-utils
	The following NEW packages will be installed:
	  dh-python libasound2 libasound2-data libexpat1 libftdi1-2 libjack-jackd2-0
	  liblirc-client0 liblirc0 libmpdec2 libopus0 libportaudio2 libpython3-stdlib
	  libpython3.5-minimal libpython3.5-stdlib libreadline7 libsamplerate0
	  libsqlite3-0 libusb-0.1-4 libusb-1.0-0 lirc mime-support python3
	  python3-minimal python3.5 python3.5-minimal readline-common
	0 upgraded, 26 newly installed, 0 to remove and 0 not upgraded.
	Need to get 8065 kB of archives.
	After this operation, 29.2 MB of additional disk space will be used.
	Get:1 http://deb.debian.org/debian stretch/main armhf libpython3.5-minimal armhf 3.5.3-1 [566 kB]
	Get:2 http://deb.debian.org/debian stretch/main armhf libexpat1 armhf 2.2.0-2+deb9u1 [64.4 kB]
	Get:3 http://deb.debian.org/debian stretch/main armhf python3.5-minimal armhf 3.5.3-1 [1440 kB]
	Get:4 http://deb.debian.org/debian stretch/main armhf python3-minimal armhf 3.5.3-1 [35.3 kB]
	Get:5 http://deb.debian.org/debian stretch/main armhf mime-support all 3.60 [36.7 kB]
	Get:6 http://deb.debian.org/debian stretch/main armhf libmpdec2 armhf 2.4.2-1 [69.6 kB]
	Get:7 http://deb.debian.org/debian stretch/main armhf readline-common all 7.0-3 [70.4 kB]
	Get:8 http://deb.debian.org/debian stretch/main armhf libreadline7 armhf 7.0-3 [131 kB]
	Get:9 http://deb.debian.org/debian stretch/main armhf libsqlite3-0 armhf 3.16.2-5+deb9u1 [499 kB]
	Get:10 http://deb.debian.org/debian stretch/main armhf libpython3.5-stdlib armhf 3.5.3-1 [2087 kB]
	Get:11 http://deb.debian.org/debian stretch/main armhf python3.5 armhf 3.5.3-1 [229 kB]
	Get:12 http://deb.debian.org/debian stretch/main armhf libpython3-stdlib armhf 3.5.3-1 [18.6 kB]
	Get:13 http://deb.debian.org/debian stretch/main armhf dh-python all 2.20170125 [86.8 kB]
	Get:14 http://deb.debian.org/debian stretch/main armhf python3 armhf 3.5.3-1 [21.6 kB]
	Get:15 http://deb.debian.org/debian stretch/main armhf libasound2-data all 1.1.3-5 [173 kB]
	Get:16 http://deb.debian.org/debian stretch/main armhf libasound2 armhf 1.1.3-5 [445 kB]
	Get:17 http://deb.debian.org/debian stretch/main armhf libusb-1.0-0 armhf 2:1.0.21-1 [48.7 kB]
	Get:18 http://deb.debian.org/debian stretch/main armhf libftdi1-2 armhf 1.3-2+b2 [27.5 kB]
	Get:19 http://deb.debian.org/debian stretch/main armhf libopus0 armhf 1.2~alpha2-1 [150 kB]
	Get:20 http://deb.debian.org/debian stretch/main armhf libsamplerate0 armhf 0.1.8-8+b2 [946 kB]
	Get:21 http://deb.debian.org/debian stretch/main armhf libjack-jackd2-0 armhf 1.9.10+20150825git1ed50c92~dfsg-5 [252 kB]
	Get:22 http://deb.debian.org/debian stretch/main armhf libportaudio2 armhf 19.6.0-1 [57.5 kB]
	Get:23 http://deb.debian.org/debian stretch/main armhf libusb-0.1-4 armhf 2:0.1.12-30 [21.4 kB]
	Get:24 http://deb.debian.org/debian stretch/main armhf liblirc-client0 armhf 0.9.4c-9 [53.4 kB]
	Get:25 http://deb.debian.org/debian stretch/main armhf liblirc0 armhf 0.9.4c-9 [105 kB]
	Get:26 http://deb.debian.org/debian stretch/main armhf lirc armhf 0.9.4c-9 [431 kB]
	debconf: delaying package configuration, since apt-utils is not installed
	Fetched 8065 kB in 12s (621 kB/s)
	Selecting previously unselected package libpython3.5-minimal:armhf.
	(Reading database ... 7094 files and directories currently installed.)
	Preparing to unpack .../00-libpython3.5-minimal_3.5.3-1_armhf.deb ...
	Unpacking libpython3.5-minimal:armhf (3.5.3-1) ...
	Selecting previously unselected package libexpat1:armhf.
	Preparing to unpack .../01-libexpat1_2.2.0-2+deb9u1_armhf.deb ...
	Unpacking libexpat1:armhf (2.2.0-2+deb9u1) ...
	Selecting previously unselected package python3.5-minimal.
	Preparing to unpack .../02-python3.5-minimal_3.5.3-1_armhf.deb ...
	Unpacking python3.5-minimal (3.5.3-1) ...
	Selecting previously unselected package python3-minimal.
	Preparing to unpack .../03-python3-minimal_3.5.3-1_armhf.deb ...
	Unpacking python3-minimal (3.5.3-1) ...
	Selecting previously unselected package mime-support.
	Preparing to unpack .../04-mime-support_3.60_all.deb ...
	Unpacking mime-support (3.60) ...
	Selecting previously unselected package libmpdec2:armhf.
	Preparing to unpack .../05-libmpdec2_2.4.2-1_armhf.deb ...
	Unpacking libmpdec2:armhf (2.4.2-1) ...
	Selecting previously unselected package readline-common.
	Preparing to unpack .../06-readline-common_7.0-3_all.deb ...
	Unpacking readline-common (7.0-3) ...
	Selecting previously unselected package libreadline7:armhf.
	Preparing to unpack .../07-libreadline7_7.0-3_armhf.deb ...
	Unpacking libreadline7:armhf (7.0-3) ...
	Selecting previously unselected package libsqlite3-0:armhf.
	Preparing to unpack .../08-libsqlite3-0_3.16.2-5+deb9u1_armhf.deb ...
	Unpacking libsqlite3-0:armhf (3.16.2-5+deb9u1) ...
	Selecting previously unselected package libpython3.5-stdlib:armhf.
	Preparing to unpack .../09-libpython3.5-stdlib_3.5.3-1_armhf.deb ...
	Unpacking libpython3.5-stdlib:armhf (3.5.3-1) ...
	Selecting previously unselected package python3.5.
	Preparing to unpack .../10-python3.5_3.5.3-1_armhf.deb ...
	Unpacking python3.5 (3.5.3-1) ...
	Selecting previously unselected package libpython3-stdlib:armhf.
	Preparing to unpack .../11-libpython3-stdlib_3.5.3-1_armhf.deb ...
	Unpacking libpython3-stdlib:armhf (3.5.3-1) ...
	Selecting previously unselected package dh-python.
	Preparing to unpack .../12-dh-python_2.20170125_all.deb ...
	Unpacking dh-python (2.20170125) ...
	Setting up libpython3.5-minimal:armhf (3.5.3-1) ...
	Setting up libexpat1:armhf (2.2.0-2+deb9u1) ...
	Setting up python3.5-minimal (3.5.3-1) ...
	Setting up python3-minimal (3.5.3-1) ...
	Selecting previously unselected package python3.
	(Reading database ... 8078 files and directories currently installed.)
	Preparing to unpack .../00-python3_3.5.3-1_armhf.deb ...
	Unpacking python3 (3.5.3-1) ...
	Selecting previously unselected package libasound2-data.
	Preparing to unpack .../01-libasound2-data_1.1.3-5_all.deb ...
	Unpacking libasound2-data (1.1.3-5) ...
	Selecting previously unselected package libasound2:armhf.
	Preparing to unpack .../02-libasound2_1.1.3-5_armhf.deb ...
	Unpacking libasound2:armhf (1.1.3-5) ...
	Selecting previously unselected package libusb-1.0-0:armhf.
	Preparing to unpack .../03-libusb-1.0-0_2%3a1.0.21-1_armhf.deb ...
	Unpacking libusb-1.0-0:armhf (2:1.0.21-1) ...
	Selecting previously unselected package libftdi1-2:armhf.
	Preparing to unpack .../04-libftdi1-2_1.3-2+b2_armhf.deb ...
	Unpacking libftdi1-2:armhf (1.3-2+b2) ...
	Selecting previously unselected package libopus0:armhf.
	Preparing to unpack .../05-libopus0_1.2~alpha2-1_armhf.deb ...
	Unpacking libopus0:armhf (1.2~alpha2-1) ...
	Selecting previously unselected package libsamplerate0:armhf.
	Preparing to unpack .../06-libsamplerate0_0.1.8-8+b2_armhf.deb ...
	Unpacking libsamplerate0:armhf (0.1.8-8+b2) ...
	Selecting previously unselected package libjack-jackd2-0:armhf.
	Preparing to unpack .../07-libjack-jackd2-0_1.9.10+20150825git1ed50c92~dfsg-5_armhf.deb ...
	Unpacking libjack-jackd2-0:armhf (1.9.10+20150825git1ed50c92~dfsg-5) ...
	Selecting previously unselected package libportaudio2:armhf.
	Preparing to unpack .../08-libportaudio2_19.6.0-1_armhf.deb ...
	Unpacking libportaudio2:armhf (19.6.0-1) ...
	Selecting previously unselected package libusb-0.1-4:armhf.
	Preparing to unpack .../09-libusb-0.1-4_2%3a0.1.12-30_armhf.deb ...
	Unpacking libusb-0.1-4:armhf (2:0.1.12-30) ...
	Selecting previously unselected package liblirc-client0:armhf.
	Preparing to unpack .../10-liblirc-client0_0.9.4c-9_armhf.deb ...
	Unpacking liblirc-client0:armhf (0.9.4c-9) ...
	Selecting previously unselected package liblirc0:armhf.
	Preparing to unpack .../11-liblirc0_0.9.4c-9_armhf.deb ...
	Unpacking liblirc0:armhf (0.9.4c-9) ...
	Selecting previously unselected package lirc.
	Preparing to unpack .../12-lirc_0.9.4c-9_armhf.deb ...
	Unpacking lirc (0.9.4c-9) ...
	Setting up readline-common (7.0-3) ...
	Setting up liblirc0:armhf (0.9.4c-9) ...
	Setting up mime-support (3.60) ...
	Setting up libreadline7:armhf (7.0-3) ...
	Setting up libasound2-data (1.1.3-5) ...
	Setting up liblirc-client0:armhf (0.9.4c-9) ...
	Setting up libopus0:armhf (1.2~alpha2-1) ...
	Setting up libasound2:armhf (1.1.3-5) ...
	Setting up libusb-1.0-0:armhf (2:1.0.21-1) ...
	Processing triggers for libc-bin (2.24-11+deb9u1) ...
	Setting up libsqlite3-0:armhf (3.16.2-5+deb9u1) ...
	Setting up libsamplerate0:armhf (0.1.8-8+b2) ...
	Setting up libusb-0.1-4:armhf (2:0.1.12-30) ...
	Setting up libmpdec2:armhf (2.4.2-1) ...
	Setting up libftdi1-2:armhf (1.3-2+b2) ...
	Setting up libpython3.5-stdlib:armhf (3.5.3-1) ...
	Setting up libjack-jackd2-0:armhf (1.9.10+20150825git1ed50c92~dfsg-5) ...
	Setting up python3.5 (3.5.3-1) ...
	Setting up libpython3-stdlib:armhf (3.5.3-1) ...
	Setting up libportaudio2:armhf (19.6.0-1) ...
	Setting up dh-python (2.20170125) ...
	Setting up python3 (3.5.3-1) ...
	running python rtupdate hooks for python3.5...
	running python post-rtupdate hooks for python3.5...
	Setting up lirc (0.9.4c-9) ...
	/var/lib/dpkg/info/lirc.postinst: 5: /var/lib/dpkg/info/lirc.postinst: systemd-tmpfiles: not found
	Listing '/usr/lib/arm-linux-gnueabihf/python3/dist-packages/lirc/'...
	Compiling '/usr/lib/arm-linux-gnueabihf/python3/dist-packages/lirc/baseview.py'...
	Compiling '/usr/lib/arm-linux-gnueabihf/python3/dist-packages/lirc/choosers.py'...
	Compiling '/usr/lib/arm-linux-gnueabihf/python3/dist-packages/lirc/config.py'...
	Compiling '/usr/lib/arm-linux-gnueabihf/python3/dist-packages/lirc/database.py'...
	Compiling '/usr/lib/arm-linux-gnueabihf/python3/dist-packages/lirc/mvc_control.py'...
	Compiling '/usr/lib/arm-linux-gnueabihf/python3/dist-packages/lirc/mvc_model.py'...
	Compiling '/usr/lib/arm-linux-gnueabihf/python3/dist-packages/lirc/mvc_view.py'...
	Compiling '/usr/lib/arm-linux-gnueabihf/python3/dist-packages/lirc/util.py'...
	invoke-rc.d: could not determine current runlevel
	invoke-rc.d: policy-rc.d denied execution of start.
	invoke-rc.d: could not determine current runlevel
	invoke-rc.d: policy-rc.d denied execution of start.
	Processing triggers for libc-bin (2.24-11+deb9u1) ...
	 ---> 9e96b7f6574e
	Removing intermediate container 573866fb41a6
	Step 6/27 : RUN mkdir -p /var/run/lirc   && rm -f /etc/lirc/lircd.conf.d/devinput.*
	 ---> Running in 8377390a4a7e
	 ---> 91f252399570
	Removing intermediate container 8377390a4a7e
	Step 7/27 : COPY Lirc/setup/config.txt /boot/config.txt
	 ---> 30fe7f80e3fa
	Step 8/27 : COPY Lirc/setup/lirc_options.conf /etc/lirc/lirc_options.conf
	 ---> b02056a40183
	Step 9/27 : COPY Lirc/setup/ir-remote.conf /etc/modprobe.d/ir-remote.conf
	 ---> 8a93a2823f40
	Step 10/27 : COPY Lirc/remotes /etc/lirc/lircd.conf.d
	 ---> 39859954b769
	Step 11/27 : FROM microsoft/dotnet:2.0-sdk AS build
	 ---> 0d92e6d42a8a
	Step 12/27 : ENV DOTNET_CLI_TELEMETRY_OPTOUT 1
	 ---> Using cache
	 ---> fa397586a746
	Step 13/27 : ENV ASPNETCORE_URLS "http://*:5010"
	 ---> Running in 9b365d526981
	 ---> 452446a9a470
	Removing intermediate container 9b365d526981
	Step 14/27 : WORKDIR /src
	 ---> 24e68905313f
	Removing intermediate container e76151f1e8b1
	Step 15/27 : COPY *.sln ./
	 ---> 436fa4bc4f10
	Step 16/27 : COPY *.dcproj ./
	 ---> d9e72dd70306
	Step 17/27 : COPY src/IO.Swagger/IO.Swagger.csproj src/IO.Swagger/
	 ---> 8e487faf7a0c
	Step 18/27 : RUN dotnet restore src/IO.Swagger/
	 ---> Running in bf2c659fc0a9
	  Restoring packages for /src/src/IO.Swagger/IO.Swagger.csproj...
	  Restoring packages for /src/src/IO.Swagger/IO.Swagger.csproj...
	  Installing Microsoft.Extensions.FileProviders.Abstractions 1.0.1.
	  Installing Microsoft.Extensions.FileSystemGlobbing 1.0.1.
	  Installing Microsoft.Extensions.Primitives 1.0.1.
	  Installing System.Xml.XPath.XDocument 4.0.1.
	  Installing System.Diagnostics.StackTrace 4.0.1.
	  Installing Microsoft.NETCore.DotNetHost 1.0.1.
	  Installing Microsoft.Extensions.FileProviders.Physical 1.0.1.
	  Installing Microsoft.Extensions.Configuration.Abstractions 1.0.2.
	  Installing Microsoft.CodeAnalysis.Common 1.3.0.
	  Installing System.Security.Principal.Windows 4.0.0.
	  Installing System.Security.Claims 4.0.1.
	  Installing runtime.native.System.Net.Security 4.0.1.
	  Installing Microsoft.NETCore.DotNetHostResolver 1.0.1.
	  Installing Microsoft.NETCore.Jit 1.0.2.
	  Installing Microsoft.NETCore.Windows.ApiSets 1.0.1.
	  Installing Microsoft.Extensions.Configuration.FileExtensions 1.0.2.
	  Installing Microsoft.Extensions.Configuration 1.0.2.
	  Installing Microsoft.CodeAnalysis.CSharp 1.3.0.
	  Installing Microsoft.CodeAnalysis.VisualBasic 1.3.0.
	  Installing System.Net.NameResolution 4.0.0.
	  Installing System.ComponentModel.Annotations 4.1.0.
	  Installing System.Net.Security 4.0.0.
	  Installing System.Threading.Tasks.Parallel 4.0.1.
	  Installing Microsoft.NETCore.DotNetHostPolicy 1.0.1.
	  Installing System.Net.Requests 4.0.11.
	  Installing System.IO.FileSystem.Watcher 4.0.0.
	  Installing System.IO.MemoryMappedFiles 4.0.0.
	  Installing System.Net.WebHeaderCollection 4.0.1.
	  Installing Microsoft.VisualBasic 10.0.1.
	  Installing System.ComponentModel 4.0.1.
	  Installing System.IO.UnmanagedMemoryStream 4.0.1.
	  Installing Microsoft.NETCore.Runtime.CoreCLR 1.0.2.
	  Installing System.Numerics.Vectors 4.1.1.
	  Installing Libuv 1.9.0.
	  Installing System.Reflection.DispatchProxy 4.0.1.
	  Installing Microsoft.Extensions.Configuration.Json 1.0.2.
	  Installing Microsoft.NETCore.App 1.0.0.
	  Installing Microsoft.Extensions.Configuration.UserSecrets 1.0.2.
	  Installing Microsoft.Extensions.SecretManager.Tools 1.0.0.
	  Restore completed in 10.39 sec for /src/src/IO.Swagger/IO.Swagger.csproj.
	  Installing System.Net.WebSockets 4.0.0.
	  Installing Microsoft.AspNetCore.Http.Features 1.0.3.
	  Installing System.ComponentModel.Primitives 4.1.0.
	  Installing System.Collections.Specialized 4.0.1.
	  Installing Microsoft.AspNetCore.Hosting.Server.Abstractions 1.0.4.
	  Installing System.Text.Encodings.Web 4.0.1.
	  Installing System.Linq.Expressions 4.1.1.
	  Installing Microsoft.Extensions.Localization.Abstractions 1.0.3.
	  Installing Microsoft.AspNetCore.Hosting.Server.Abstractions 1.0.3.
	  Installing Microsoft.Extensions.DependencyInjection.Abstractions 1.0.2.
	  Installing Microsoft.AspNetCore.Http.Abstractions 1.0.3.
	  Installing Microsoft.AspNetCore.WebUtilities 1.0.3.
	  Installing Microsoft.Net.Http.Headers 1.0.3.
	  Installing Microsoft.DotNet.InternalAbstractions 1.0.0.
	  Installing System.ComponentModel.TypeConverter 4.1.0.
	  Installing Microsoft.AspNetCore.Hosting.Abstractions 1.0.4.
	  Installing Microsoft.Extensions.WebEncoders 1.0.3.
	  Installing Microsoft.AspNetCore.Routing.Abstractions 1.0.4.
	  Installing Microsoft.AspNetCore.Http.Extensions 1.0.3.
	  Installing Microsoft.Extensions.Options 1.0.2.
	  Installing Microsoft.Extensions.ObjectPool 1.0.1.
	  Installing Microsoft.Extensions.Localization 1.0.3.
	  Installing Microsoft.AspNetCore.Hosting.Abstractions 1.0.3.
	  Installing Microsoft.AspNetCore.Mvc.Abstractions 1.0.4.
	  Installing Microsoft.AspNetCore.Http 1.0.3.
	  Installing Microsoft.Extensions.DependencyModel 1.0.0.
	  Installing Microsoft.AspNetCore.Authorization 1.0.3.
	  Installing Microsoft.Extensions.PlatformAbstractions 1.0.0.
	  Installing Microsoft.Extensions.Logging.Abstractions 1.0.2.
	  Installing Microsoft.AspNetCore.JsonPatch 1.0.0.
	  Installing Microsoft.AspNetCore.StaticFiles 1.0.4.
	  Installing Microsoft.AspNetCore.Routing 1.0.4.
	  Installing System.Xml.XPath 4.0.0.
	  Installing Microsoft.Extensions.FileProviders.Embedded 1.0.1.
	  Installing Microsoft.AspNetCore.Mvc.DataAnnotations 1.0.4.
	  Installing Microsoft.AspNetCore.Mvc.ApiExplorer 1.0.4.
	  Installing Microsoft.AspNetCore.Mvc.Core 1.0.4.
	  Installing Microsoft.AspNetCore.Mvc.Formatters.Json 1.0.4.
	  Installing Swashbuckle.AspNetCore.SwaggerUI 1.1.0.
	  Installing Swashbuckle.AspNetCore.SwaggerGen 1.1.0.
	  Installing Swashbuckle.AspNetCore.Swagger 1.1.0.
	  Installing Microsoft.AspNetCore.Mvc.Razor.ViewCompilation 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.Localization 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.Formatters.Xml 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.RazorPages 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.Core 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.Razor 2.0.1.
	  Installing Microsoft.AspNetCore.NodeServices 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.Cors 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.ApiExplorer 2.0.1.
	  Installing Microsoft.AspNetCore.SpaServices 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.TagHelpers 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.Abstractions 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.ViewFeatures 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.Formatters.Json 2.0.1.
	  Installing Microsoft.AspNetCore.Mvc.DataAnnotations 2.0.1.
	  Installing Swashbuckle.AspNetCore 1.1.0.
	  Installing Newtonsoft.Json 11.0.1-beta1.
	  Installing Microsoft.AspNetCore.All 2.0.3.
	  Generating MSBuild file /src/src/IO.Swagger/obj/IO.Swagger.csproj.nuget.g.props.
	  Generating MSBuild file /src/src/IO.Swagger/obj/IO.Swagger.csproj.nuget.g.targets.
	  Restore completed in 11.19 sec for /src/src/IO.Swagger/IO.Swagger.csproj.
	 ---> 1924bfc397cd
	Removing intermediate container bf2c659fc0a9
	Step 19/27 : COPY . .
	 ---> b7a426ed84d0
	Step 20/27 : WORKDIR /src/src/IO.Swagger
	 ---> f6393b7aa10e
	Removing intermediate container 6c6f5a8bafed
	Step 21/27 : RUN dotnet build -c Release -r linux-arm -o /app
	 ---> Running in 1eac0e500ac8
	Microsoft (R) Build Engine version 15.5.180.51428 for .NET Core
	Copyright (C) Microsoft Corporation. All rights reserved.
	
	  Restoring packages for /src/src/IO.Swagger/IO.Swagger.csproj...
	  Restoring packages for /src/src/IO.Swagger/IO.Swagger.csproj...
	  Restore completed in 474.82 ms for /src/src/IO.Swagger/IO.Swagger.csproj.
	  Installing runtime.unix.System.Private.Uri 4.3.0.
	  Installing System.Private.Uri 4.3.0.
	  Installing runtime.linux-arm.Microsoft.NETCore.DotNetAppHost 2.0.0.
	  Installing runtime.unix.System.Runtime.Extensions 4.3.0.
	  Installing runtime.any.System.Runtime 4.3.0.
	  Installing runtime.any.System.Collections 4.3.0.
	  Installing runtime.unix.System.IO.FileSystem 4.3.0.
	  Installing runtime.any.System.Text.Encoding 4.3.0.
	  Installing runtime.any.System.Reflection.Extensions 4.3.0.
	  Installing runtime.unix.System.Net.Primitives 4.3.0.
	  Installing runtime.any.System.Runtime.InteropServices 4.3.0.
	  Installing runtime.any.System.Text.Encoding.Extensions 4.3.0.
	  Installing runtime.any.System.Reflection.Primitives 4.3.0.
	  Installing runtime.any.System.IO 4.3.0.
	  Installing runtime.any.System.Diagnostics.Tools 4.3.0.
	  Installing runtime.any.System.Runtime.Handles 4.3.0.
	  Installing runtime.any.System.Globalization.Calendars 4.3.0.
	  Installing runtime.unix.System.Console 4.3.0.
	  Installing runtime.any.System.Diagnostics.Tracing 4.3.0.
	  Installing runtime.any.System.Globalization 4.3.0.
	  Installing runtime.unix.Microsoft.Win32.Primitives 4.3.0.
	  Installing runtime.unix.System.Net.Sockets 4.3.0.
	  Installing runtime.any.System.Threading.Tasks 4.3.0.
	  Installing runtime.any.System.Resources.ResourceManager 4.3.0.
	  Installing runtime.any.System.Threading.Timer 4.3.0.
	  Installing runtime.any.System.Reflection 4.3.0.
	  Installing runtime.unix.System.Diagnostics.Debug 4.3.0.
	  Installing runtime.linux-arm.Microsoft.NETCore.DotNetHostResolver 2.0.0.
	  Installing runtime.linux-arm.Microsoft.NETCore.DotNetHostPolicy 2.0.0.
	  Installing runtime.linux-arm.Microsoft.NETCore.App 2.0.0.
	  Generating MSBuild file /src/src/IO.Swagger/obj/IO.Swagger.csproj.nuget.g.props.
	  Generating MSBuild file /src/src/IO.Swagger/obj/IO.Swagger.csproj.nuget.g.targets.
	  Restore completed in 6.14 sec for /src/src/IO.Swagger/IO.Swagger.csproj.
	Controllers/RemoteApi.cs(123,25): warning CS1591: Missing XML comment for publicly visible type or member 'ShellHelper' [/src/src/IO.Swagger/IO.Swagger.csproj]
	Controllers/RemoteApi.cs(125,30): warning CS1591: Missing XML comment for publicly visible type or member 'ShellHelper.Bash(string)' [/src/src/IO.Swagger/IO.Swagger.csproj]
	  IO.Swagger -> /app/IO.Swagger.dll
	
	Build succeeded.
	
	Controllers/RemoteApi.cs(123,25): warning CS1591: Missing XML comment for publicly visible type or member 'ShellHelper' [/src/src/IO.Swagger/IO.Swagger.csproj]
	Controllers/RemoteApi.cs(125,30): warning CS1591: Missing XML comment for publicly visible type or member 'ShellHelper.Bash(string)' [/src/src/IO.Swagger/IO.Swagger.csproj]
	    2 Warning(s)
	    0 Error(s)
	
	Time Elapsed 00:00:10.88
	 ---> cd709f506d51
	Removing intermediate container 1eac0e500ac8
	Step 22/27 : FROM build AS publish
	 ---> cd709f506d51
	Step 23/27 : RUN dotnet publish -c Release -r linux-arm -o /app
	 ---> Running in 3104749dc4c6
	Microsoft (R) Build Engine version 15.5.180.51428 for .NET Core
	Copyright (C) Microsoft Corporation. All rights reserved.
	
	  Restore completed in 54.04 ms for /src/src/IO.Swagger/IO.Swagger.csproj.
	  Restore completed in 19.97 ms for /src/src/IO.Swagger/IO.Swagger.csproj.
	  IO.Swagger -> /src/src/IO.Swagger/bin/Release/netcoreapp2.0/linux-arm/IO.Swagger.dll
	  IO.Swagger -> /app/
	 ---> 91b3c8736306
	Removing intermediate container 3104749dc4c6
	Step 24/27 : FROM base AS final
	 ---> 39859954b769
	Step 25/27 : WORKDIR /app
	 ---> 8842c63a8131
	Removing intermediate container fe0c14982cfd
	Step 26/27 : COPY --from=publish /app .
	 ---> 5b84e3ae5619
	Step 27/27 : ENTRYPOINT dotnet IO.Swagger.dll
	 ---> Running in caecf04db00a
	 ---> c80a979d454b
	Removing intermediate container caecf04db00a
	Successfully built c80a979d454b
	Successfully tagged josemottalopes/home-web-ir:latest
	Building ssl.proxy
	Step 1/7 : FROM arm32v7/nginx
	latest: Pulling from arm32v7/nginx
	235baf89a76b: Pull complete
	03299fdd2d07: Pull complete
	dcd45307b6c8: Pull complete
	Digest: sha256:479588bd938e572f17426a10761a91e379efb568e40de5d3416852445b4cf01a
	Status: Downloaded newer image for arm32v7/nginx:latest
	 ---> fcfb0d11d416
	Step 2/7 : WORKDIR /app
	 ---> 0eb8067bc86d
	Removing intermediate container d18543ebde76
	Step 3/7 : COPY Proxy/setup/proxy.conf /etc/nginx/conf.d/
	 ---> 59d448c85dd2
	Step 4/7 : COPY Proxy/setup/key.pem /etc/nginx/conf.d/
	 ---> d19cd5b748ab
	Step 5/7 : COPY Proxy/setup/cert.pem /etc/nginx/conf.d/
	 ---> 6134c70ba787
	Step 6/7 : EXPOSE 443
	 ---> Running in 4233db947389
	 ---> 0b39d1125026
	Removing intermediate container 4233db947389
	Step 7/7 : CMD nginx -g daemon off;
	 ---> Running in 032d10c2b21e
	 ---> dd0a5a0a4f5a
	Removing intermediate container 032d10c2b21e
	Successfully built dd0a5a0a4f5a
	Successfully tagged josemottalopes/nginx-proxy:latest
	
	jo@CANOAS24 MINGW64 /c/_git/IoT.Starter.Pi.Thing/home (master)
	$ docker-compose -f lumi-compose.yml push
	Pushing home.ui (josemottalopes/home-ui:latest)...
	The push refers to a repository [docker.io/josemottalopes/home-ui]
	7025a90c8c96: Pushed
	4f8c776bb8ed: Pushed
	03ed26e18bcd: Mounted from microsoft/dotnet
	33b89107fb22: Mounted from microsoft/dotnet
	2b9aa61adb86: Mounted from microsoft/dotnet
	ccd48fa5ba35: Layer already exists
	latest: digest: sha256:22973808b360a4ee18e0d156dce129f430963ef8b3f6d054bba6b7c4a152e1a6 size: 1581
	Pushing io.swagger (josemottalopes/home-web-ir:latest)...
	The push refers to a repository [docker.io/josemottalopes/home-web-ir]
	1cb1c98c2b67: Pushed
	e2889c5ab169: Pushed
	ed6d3811af0f: Pushed
	d0ea462efdd8: Pushed
	be2cc3456a48: Pushed
	e9f84126fbea: Pushed
	02b5dcb8cd2c: Pushed
	cdc1dc7eb6d3: Pushed
	03ed26e18bcd: Mounted from josemottalopes/home-ui
	33b89107fb22: Mounted from josemottalopes/home-ui
	2b9aa61adb86: Mounted from josemottalopes/home-ui
	ccd48fa5ba35: Layer already exists
	latest: digest: sha256:f5c7d92ab0b5e1b3bac7253aeb111aa4ae592a3bc7a777fc75c9ca7e08ac48b0 size: 2830
	Pushing ssl.proxy (josemottalopes/nginx-proxy:latest)...
	The push refers to a repository [docker.io/josemottalopes/nginx-proxy]
	93b693f0eb03: Pushed
	33fa2a374ae0: Pushed
	476399dda696: Pushed
	9e7315eca070: Pushed
	635e4ef64f21: Mounted from arm32v7/nginx
	2609f558589d: Mounted from arm32v7/nginx
	2c844972db4f: Mounted from arm32v7/nginx
	latest: digest: sha256:561b8f0e03150d6a73c106079bf28a3330a9f2d87262d8ab855acfc52b1f7239 size: 1777

