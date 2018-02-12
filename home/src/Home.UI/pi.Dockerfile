FROM microsoft/dotnet:2.0.0-runtime-stretch-arm32v7 AS base
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1
ENV ASPNETCORE_URLS "http://*:80"
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.0-sdk AS build
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1
ENV ASPNETCORE_URLS "http://*:80"
WORKDIR /src
COPY *.sln ./
COPY *.dcproj ./
COPY src/Home.UI/Home.UI.csproj src/Home.UI/
RUN dotnet restore src/Home.UI/
COPY . .
WORKDIR /src/src/Home.UI
#RUN dotnet build -c Development -o /app
#RUN dotnet build -c Release -o /app
#RUN dotnet build -c Release -r linux-arm -o /app
RUN dotnet build -c Development -r linux-arm -o /app

FROM build AS publish
#RUN dotnet publish -c Release -o /app
#RUN dotnet publish -c Development -o /app
RUN dotnet publish -c Release -r linux-arm -o /app
#RUN dotnet publish -c Development -r linux-arm -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Home.UI.dll"]
