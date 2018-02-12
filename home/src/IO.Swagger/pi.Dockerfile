FROM microsoft/dotnet:2.0.0-runtime-stretch-arm32v7 AS base
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1
ENV ASPNETCORE_URLS "http://*:5010"
WORKDIR /app

FROM microsoft/dotnet:2.0-sdk AS build
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1
ENV ASPNETCORE_URLS "http://*:5010"
WORKDIR /src
COPY *.sln ./
COPY *.dcproj ./
COPY src/IO.Swagger/IO.Swagger.csproj src/IO.Swagger/
RUN dotnet restore src/IO.Swagger/
COPY . .
WORKDIR /src/src/IO.Swagger
RUN dotnet build -c Release -r linux-arm -o /app
#RUN dotnet build -c Development -r linux-arm -o /app

FROM build AS publish
RUN dotnet publish -c Release -r linux-arm -o /app
#RUN dotnet publish -c Development -r linux-arm -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "IO.Swagger.dll"]