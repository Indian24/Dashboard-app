# Use the .NET 9 SDK to build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy and restore
COPY ["Dashboard-app.csproj", "./"]
RUN dotnet restore

# Build and publish
COPY . .
RUN dotnet publish -c Release -o /app/publish

# Use the .NET 9 Runtime to run
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

# Railway dynamic port
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

ENTRYPOINT ["dotnet", "Dashboard-app.dll"]