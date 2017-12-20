FROM ubuntu:16.04

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software.version="1.0"

LABEL version="1.0"
LABEL software="nmrML2batman"

# Install required packages and nmrML2batman script
RUN apt-get update && apt-get install -y --no-install-recommends r-base r-base-dev \
                              libcurl4-openssl-dev libssl-dev libxml2-dev&& \
    echo 'options("repos"="http://cran.rstudio.com", download.file.method = "libcurl")' >> /etc/R/Rprofile.site && \
    R -e "install.packages(c('getopt','optparse','XML','base64enc'))" && \
    apt-get purge -y r-base-dev libcurl4-openssl-dev libssl-dev && \
    apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*

# Add nmrML2batman.R to /usr/local/bin
ADD nmrML2batman.R /usr/local/bin
RUN chmod 0755 /usr/local/bin/nmrML2batman.R

# Define entry point, useful for generale use
ENTRYPOINT ["nmrML2batman.R"]
