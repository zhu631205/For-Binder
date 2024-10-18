FROM rocker/r-ver:4.1.0

# Install necessary packages
RUN R -e "install.packages(c('devtools', 'BiocManager'))"
RUN R -e "BiocManager::install('ArchR')"

# Install RStudio
RUN apt-get update && apt-get install -y \
    gdebi-core \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://download2.rstudio.org/r/centos7/amd64/rstudio-1.4.1717-1.x86_64.rpm \
    && gdebi -n rstudio-1.4.1717-1.x86_64.rpm \
    && rm rstudio-1.4.1717-1.x86_64.rpm
