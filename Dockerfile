FROM r-base:4.2.3

# install necessary system libraries
RUN apt-get update && apt-get -y install cmake \
    libfreetype-dev \
    libfontconfig1-dev \
    xclip \
    git \
    unzip \
    libcurl4-openssl-dev \
    libxml2-dev \
    libmagick++-dev \
    libpq-dev \
    libssl-dev \
    libmariadb-dev \
    libharfbuzz-dev \
    libfribidi-dev

# install all necessary R packages
RUN apt-get update && apt-get -y install 
COPY install_packages.R /install_packages.R
COPY packages.R /packages.R
RUN Rscript install_packages.R

# install latest dev version of quarto
#RUN cd /opt && git clone https://github.com/quarto-dev/quarto-cli
#RUN cd /opt/quarto-cli && ./configure.sh
#ENV PATH="${PATH}:/opt/quarto-cli/package/dist/bin"
RUN apt-get update && apt-get install -y texlive texlive-publishers \
   texlive-fonts-extra texlive-latex-extra \
   texlive-humanities lmodern texlive-xetex \
   texlive-plain-generic
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-amd64.deb
RUN dpkg -i quarto-1.3.450-linux-amd64.deb
COPY setup_fonts.sh /setup_fonts.sh
RUN bash setup_fonts.sh

RUN mkdir /experimentology
WORKDIR /experimentology
