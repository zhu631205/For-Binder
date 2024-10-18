# Use R version 4.1.0 from the Rocker project as the base image
FROM rocker/r-ver:4.1.0

# Install necessary packages, including wget and gdebi
RUN apt-get update && apt-get install -y \
    gdebi-core \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install RStudio
RUN wget https://download2.rstudio.org/r/centos7/amd64/rstudio-1.4.1717-1.x86_64.rpm \
    && gdebi -n rstudio-1.4.1717-1.x86_64.rpm \
    && rm rstudio-1.4.1717-1.x86_64.rpm
