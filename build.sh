#/bin/bash

CORES=$(( `nproc` + 1 ))

echo "Build script for CarbonRom 4.2.2 by luca020400"
echo "Enjoy !!!"

echo "Cleaning"
rm -rf out/target/product/u8833 >> /dev/null
rm -rf device/huawei/u8833 >> /dev/null
rm -rf out/target/product/u8825 >> /dev/null
rm -rf device/huawei/u8825 >> /dev/null
rm -rf vendor/huawei/ >> /dev/null

echo "Initializing the CarbonRomJellyBeanY300 Repository"
repo init -u git://github.com/CarbonRomJellyBeanY300/android.git -b jb2 >> /dev/null

echo "Downloading sources 1/2"
rm -rf system/core >> /dev/null
repo sync -f  >> /dev/null
echo "Downloading sources 2/2"
rm -rf system/core >> /dev/null
repo sync -f  >> /dev/null

echo "Select your device"
echo "Y300/G510 --> 1"
echo "G330 --> 2"

read -s -n 1 device
if [[ $device = "" ]]; then
    echo 'You pressed enter!'
elif [[ $device = "1" ]]; then
    echo "You selected Y300/G510"
    rm -rf device/huawei/u8825 >> /dev/null
    . build/envsetup.sh
    lunch carbon_u8833-userdebug
    echo "Building CarbonRom 4.2.2 for Y300/G510"
    make carbon -j$CORES
    echo "Done"
    cp out/target/product/u8833/CARBON*.zip . >> /dev/null
elif [[ $device = "2" ]]; then
    echo "You selected G330"
    rm -rf device/huawei/u8833 >> /dev/null
    . build/envsetup.sh
    lunch carbon_u8825-userdebug
    echo "Building CarbonRom 4.2.2 for G330"
    make carbon -j$CORES
    echo "Done"
    cp out/target/product/u8825/CARBON*.zip . >> /dev/null
else echo "You must select 1 or 2"
fi
echo "The build is in the carbon directory"
