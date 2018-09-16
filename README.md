# lasthenia_docker

Container for reproducing results in, "Grow where you thrive, or where only you can survive? An analysis of performance curve evolution in a clade with diverse habitat affinities."

To use this container (assuming Docker is installed), build the container from DockerHub locally and connect with:

    docker run -e PASSWORD=<PASSWORD> -p 80:8787 -d -e ROOT=TRUE -t silastittes/lasthenia_docker


Alternatively, you can run:

    docker run -w /home/rstudio/lasthenia_curves/ -e ROOT=TRUE -it silastittes/lasthenia_docker bash

Doing so will bring you to the bash terminal inside the container. Skip to the steps starting with `touch` to reproduce the analyses.

Running the above with sudo may be required depending on your Docker settings. 

Looking at the first option above, the 80:8787 specifies the ports to use on your machine and in the container respectively. 8787 is the default for RStudio server, which could be in use by another user, which is why I've haphazardly chosen 80. Don't forget to change `<PASSWORD>` to an actual password. 

If you chose the first command, next open your web browser and type:

    localhost:80

or:

    <server_ip_address>:80


You should be prompted to type a username and password. Use rstudio as your username and use the password you chose above. Once inside RStudio server, switch from the Console tab to the Terminal in the lower left panel. 

To reproduce all major analyses reported in the paper, run the following in the Terminal (preferably in RStudio server to facilitate opening PDFs of figures in the browser):

    cd lasthenia_curves/
    sudo su

    #change timestamps to trigger make to start at first rule
    touch */*
    make

Some warnings and errors may occur (mostly about x11, others about perl scripts), but all analyses will be produced.

It will take several hours for the pipeline to finish.


For those familiar with the paper, there is a set of simulations intended to explore our assumption of equal spacing among treatments. This takes several days to run, so was intentionally excluded in the Makefile. If these results are of interest, the best way to do so is opening the `simulate_axis.R` script in Rstudio and running the commands within. 


If you would like to interact with the generated files on your host computer, you can get them out of the container using the following:

    #determine container id (last column)
    docker ps

    #copy lasthenia curves to working directory on host machine
    docker cp <containerId>:/home/rstudio/lasthenia_curves .


Once you're happy, you can stop the container using:

    docker stop <containerId>


If issues occur, or you have any questions at all, I would love to hear about them --please email me! silas(dot)tittes(at)gmail(dot)com



