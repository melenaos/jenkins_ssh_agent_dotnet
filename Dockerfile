FROM nikhilpathania/jenkins_ssh_agent

LABEL maintainer = "Menelaos Vergis <menelaosvergis@gmail.com>"

RUN apt-get update && \
    wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install apt-transport-https && \
    apt-get update && \
    apt-get install -y --no-install-recommends  dotnet-sdk-3.1
    
# Speedup the dotnet tool
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1
ENV DOTNET_SKIP_FIRST_TIME_EXPERIENCE 1

# Trigger the population of the local package cache
ENV NUGET_XMLDOC_MODE skip
RUN mkdir warmup \
    && cd warmup \
    && dotnet new \
    && cd .. \
    && rm -rf warmup \
    && rm -rf /tmp/NuGetScratch
### END .NET

