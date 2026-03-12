# Use the official .NET runtime as a base image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

# Copy your compiled files into the container
COPY . .

# Tell Docker which DLL to run (replace 'Dashboard-app.dll' with your actual entry point)
ENTRYPOINT ["dotnet", "Dashboard-app.dll"]