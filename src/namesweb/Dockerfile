FROM microsoft/dotnet:2.1-aspnetcore-runtime-alpine AS base
WORKDIR /app
#EXPOSE 57270
#EXPOSE 44348
EXPOSE 443

FROM microsoft/dotnet:2.1-sdk-alpine AS build
WORKDIR /src
COPY namesweb.csproj .
RUN dotnet restore
COPY . .
WORKDIR /src
RUN dotnet build -c Release -o /app

FROM build AS publish
RUN dotnet publish -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "namesweb.dll"]
