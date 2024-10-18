# Use R version 4.1.0 from the Rocker project as the base image
FROM rocker/r-ver:4.1.0

# Install necessary tools and libraries
RUN apt-get update && apt-get install -y \
    wget \
    gdebi-core \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install RStudio (use DEB package)
RUN wget https://download2.rstudio.org/r/ubuntu-$(lsb_release -cs)/amd64/rstudio-2023.09.0-349-amd64.deb \
    && gdebi -n rstudio-2023.09.0-349-amd64.deb || apt-get install -y ./rstudio-2023.09.0-349-amd64.deb \
    && rm rstudio-2023.09.0-349-amd64.deb
