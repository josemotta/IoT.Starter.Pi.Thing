# Docker

### Generating code for x64 with Windows 10

#### docker-compose.yml  

dockerfile: src/IO.Swagger/Dockerfile  
dockerfile: src/Home.UI/Dockerfile  

### Generating code for Raspberry Pi with Linux

#### pi.docker-compose.yml  

dockerfile: src/IO.Swagger/pi.Dockerfile  
dockerfile: src/Home.UI/pi.Dockerfile  

image: josemottalopes/home-web  
image: josemottalopes/home-ui

**Links:**  
https://app.swaggerhub.com/apis/motta/home/1.0.1  
https://hub.docker.com/r/josemottalopes/home-web/  
https://hub.docker.com/r/josemottalopes/home-ui/  

## Building home-web

Web Server for Home project at port:5010

#### x64: Build 

	cd home
	docker-compose -f pi.docker-compose.yml build   
	docker push josemottalopes/home-web:latest  

#### arm: RaspberryPi (hostname "rpi")  
`docker run --privileged -p 5010:5010 -d josemottalopes/home-web`  

#### any browser: Client Test
    http://rpi:5010/swagger/

## Building home-ui

Web UI for Home project at port:80

#### x64: Build 

	cd home
	docker-compose -f pi.docker-compose.yml build   
	docker push josemottalopes/home-ui:latest  

#### arm: RaspberryPi (hostname "rpi")  
`docker run --privileged -p 80:80 -d josemottalopes/home-ui:latest`  

#### any browser: Client Test
    http://rpi/