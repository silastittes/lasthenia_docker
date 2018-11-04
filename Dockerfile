####### Dockerfile #######
FROM rocker/tidyverse

MAINTAINER Silas Tittes silas.tittes@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    libglu1-mesa-dev \
    libjpeg-dev \

&& install2.r --error \
    --deps TRUE \
    lme4 \
    rstan \
    truncnorm \
    scales \
    geomorph \
    ape \
    phytools \
    xtable \
    openxlsx \
    abind \
    glmnet \
    nlme \
    flextable \
    officer \
    ggrepel \
    ggjoy \ 
    rlang \
    stringr \ 
    ggridges \
&& R --no-restore --no-save -e 'devtools::install_github("silastittes/performr", local = FALSE, version = 0.1)' \
&& R --no-restore --no-save -e 'devtools::install_github("thomasp85/patchwork")' \
&& R --no-restore --no-save -e 'devtools::install_github("rmcelreath/rethinking", version = 1.59)'

WORKDIR /home/rstudio
RUN git clone -b "accepted" https://github.com/silastittes/lasthenia_curves.git

