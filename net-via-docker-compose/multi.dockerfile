FROM mcr.microsoft.com/dotnet/sdk:6.0-jammy as build
WORKDIR /src
COPY . /src
RUN ["dotnet","build","WebApplication_DIT_Docker.sln"]

FROM mcr.microsoft.com/dotnet/aspnet:6.0-jammy
WORKDIR /gs
COPY --from=build /src/WebApplication_DIT_Docker/bin/Debug/net6.0/* /gs
EXPOSE 80
ENTRYPOINT ["dotnet","WebApplication_DIT_Docker.dll"]

