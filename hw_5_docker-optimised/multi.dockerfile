FROM mcr.microsoft.com/dotnet/sdk:6.0-jammy as build
WORKDIR /src
COPY . /src
RUN ["dotnet","build","WebApplication_DIT_Docker.sln"]

FROM mcr.microsoft.com/dotnet/aspnet:6.0-jammy
LABEL version 1.0
WORKDIR /gs
COPY --from=build /src/WebApplication_DIT_Docker/bin/Debug/net6.0/* /gs
RUN set -eux \
  && useradd -u 9000 kazak \
  #&& useradd -g 9000 kazak \
  && chown -R 9000:9000 /gs
EXPOSE 80
USER kazak:kazak
ENTRYPOINT ["dotnet","WebApplication_DIT_Docker.dll"]

