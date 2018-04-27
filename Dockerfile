FROM  microsoft/mssql-server-linux:latest
EXPOSE 1433

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=P@ssw0rd
WORKDIR /usr/src/app
COPY ./sql .



