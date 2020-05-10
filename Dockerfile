FROM nikhilpathania/jenkins_ssh_agent

LABEL maintainer = "Menelaos Vergis <menelaosvergis@gmail.com>"

RUN apt-get update && \
    wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install apt-transport-https && \
    apt-get update && \
    apt-get install dotnet-sdk-3.1 && \
