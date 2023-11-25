FROM r-base:4.3.2

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
   texlive-plain-generic texlive-fonts-recommended
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-amd64.deb
RUN dpkg -i quarto-1.3.450-linux-amd64.deb
COPY setup_fonts.sh /setup_fonts.sh
RUN bash setup_fonts.sh
COPY 09-texlive-fonts.conf /etc/fonts/conf.avail/09-texlive-fonts.conf
RUN cd /etc/fonts/conf.d; ln -s ../conf.avail/09-texlive-fonts.conf
RUN fc-cache -s

#RUN tlmgr init-usertree
#RUN tlmgr install sourcesanspro

RUN groupadd --gid 1002 experimentology
RUN useradd -m -s /bin/bash -g 1002 -u 1002 experimentology 
RUN mkdir /experimentology
WORKDIR /experimentology
