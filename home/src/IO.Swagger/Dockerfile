FROM microsoft/aspnetcore:2.0 AS base
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1
ENV ASPNETCORE_URLS "http://*:5010"
WORKDIR /app
EXPOSE 80

FROM microsoft/aspnetcore-build:2.0 AS build
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1
ENV ASPNETCORE_URLS "http://*:5010"
WORKDIR /src
COPY *.sln ./
COPY *.dcproj ./
COPY src/IO.Swagger/IO.Swagger.csproj src/IO.Swagger/
RUN dotnet restore src/IO.Swagger/
COPY . .
WORKDIR /src/src/IO.Swagger
RUN dotnet build -c Development -o /app

FROM build AS publish
RUN dotnet publish -c Development -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "IO.Swagger.dll"]