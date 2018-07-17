FROM microsoft/mssql-server-linux:latest

# Import the public repository GPG keys
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc |  apt-key add -

# Update the list of products
RUN apt-get update

# install curl
RUN apt-get install curl -y

# Register the Microsoft Ubuntu repository
RUN curl -o /etc/apt/sources.list.d/microsoft.list https://packages.microsoft.com/config/ubuntu/16.04/prod.list

# Update the list of products
RUN apt-get update

# Install mssql-cli
RUN apt-get install mssql-cli


# Docker Image for showing the mssql-cli tool
# https://github.com/dbcli/mssql-cli
#
# docker build -t sql1 .
# docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=!Passw0rd' -p 1433:1433 --name sql1 -d sql1
# docker exec -it sql1 mssql-cli

# DOCS - Quickstart with Docker + Linux
# https://docs.microsoft.com/sql/linux/quickstart-install-connect-docker?view=sql-server-linux-2017&WT.mc_id=oscon-conference-shboyer

# Docker Why github
# https://github.com/spboyer/docker-why

# mssql-cli
# https://github.com/dbcli/mssql-cli

# SQL Operations Studio
# https://github.com/Microsoft/sqlopsstudio
# Docs - https://docs.microsoft.com/sql/sql-operations-studio/what-is?view=sql-server-2017&WT.mc_id=oscon-conference-shboyer

