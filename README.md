Carbon-Dev Source
===================

Getting Started
---------------
To get started with Carbon-Dev sources, you'll need to get
familiar with [Git and Repo](http://source.android.com/source/version-control.html).


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

    repo init -u git://github.com/luca020400/android.git -b jb2
    curl https://raw.githubusercontent.com/luca020400/build_script/master/build.sh >> build.sh
    chmod +x build.sh
    ./build.sh
