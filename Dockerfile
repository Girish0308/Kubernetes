FROM microsoft/dotnet:2.0.0-sdk

WORKDIR /code

RUN mkdir -p /var/lib/docker/tmp/docker-builder023668462/src/Worker

ADD src/Worker /code/src/Worker

RUN dotnet restore -v minimal src/Worker \
    && dotnet publish -c Release -o "./" "src/Worker/" 

CMD dotnet src/Worker/Worker.dll
