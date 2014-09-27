luca0204000 automatic buiild script
===================================


Create the Directories
----------------------

You will need to set up some directories in your build environment.

To create them run:

    mkdir -p ~/carbon
    cd ~/carbon


Install the Repository Tool
---------------------------

    sudo apt-get install phablet-tools

Initialize the CarbonRom Repository and Build CarbonRom
-------------------------------------------------------

    curl https://raw.githubusercontent.com/luca020400/build_script/master/build.sh >> build.sh
    chmod +x build.sh
    ./build.sh
