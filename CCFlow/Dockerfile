#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["CCFlow/CCFlow.NetCore.csproj", "CCFlow/"]
COPY ["Components/BP.Cloud/BP.Cloud.NetCore.csproj", "Components/BP.Cloud/"]
COPY ["Components/BP.En30/BP.En30.NetCore.csproj", "Components/BP.En30/"]
COPY ["Components/BP.WF/BP.WF.NetCore.csproj", "Components/BP.WF/"]
RUN dotnet restore "CCFlow/CCFlow.NetCore.csproj"
COPY . .
WORKDIR "/src/CCFlow"
RUN dotnet build "CCFlow.NetCore.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "CCFlow.NetCore.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CCFlow.NetCore.dll"]