#/bin/bash

CORES=$(( `nproc` + 1 ))

echo "Build script for CyanogenMod 10.1 by luca020400"
echo "Enjoy !!!"
echo ""

echo "Cleaning"
rm -rf out/target >> /dev/null
rm -rf device/huawei/ >> /dev/null
rm -rf vendor/huawei/ >> /dev/null
echo ""

echo "Initializing the CyanogenMod Repository"
repo init -u git://github.com/CyanogenMod/android.git -b cm-10.1 >> /dev/null
echo ""

echo "Downloading sources"
repo sync -j8 >> /dev/null

echo "Y300/G510 --> 1"
echo "G330 --> 2"
echo "Build Y300/G510 & G330 --> 3"
echo "Kernel only --> 4"

echo -n "Make your choice : "
read device

if [[ $device = "" ]]; then
    echo ""
    echo 'You pressed enter!'

elif [[ $device = "1" ]]; then
    echo ""
    echo "You selected Y300/G510"
    echo ""
    rm -rf device/huawei/u8825 >> /dev/null
    vendor/cm/get-prebuilts
    . build/envsetup.sh
    breakfast u8833
    echo ""
    echo "Building CyanogenMod 10.1 for Y300/G510"
    mka bacon -j$CORES
    echo "Done"
    cp out/target/product/u8833/cm-*.zip . >> /dev/null
    echo ""
    echo "The build is in the CyanogenMod directory"
    echo ""

elif [[ $device = "2" ]]; then
    echo ""
    echo "You selected G330"
    echo ""
    rm -rf device/huawei/u8833 >> /dev/null
    vendor/cm/get-prebuilts
    . build/envsetup.sh
    breakfast u8825
    echo ""
    echo "Building CyanogenMod 10.1 for G330"
    mka bacon -j$CORES
    echo "Done"
    cp out/target/product/u8825/cm-*.zip . >> /dev/null
    echo ""
    echo "The build is in the CyanogenMod directory"
    echo ""

elif [[ $device = "3" ]]; then
    echo ""
    echo "You selected Build Y300/G510 & G330"
    echo ""
    rm -rf device/huawei/u8825 >> /dev/null
    vendor/cm/get-prebuilts
    . build/envsetup.sh
    breakfast u8833
    echo ""
    echo "Building CyanogenMod 10.1 for Y300/G510"
    mka bacon -j$CORES
    echo "Done"
    cp out/target/product/u8833/cm-*.zip . >> /dev/null
    echo ""
    echo "The Y300/G510 build is in the CyanogenMod directory"
    echo ""

    echo "Cleaning"
    rm -rf out/target >> /dev/null
    rm -rf device/huawei/ >> /dev/null
    rm -rf vendor/huawei/ >> /dev/null
    echo ""
    
    echo "Re-syncing"
    repo sync -j8 >> /dev/null

    rm -rf device/huawei/u8833 >> /dev/null
    vendor/cm/get-prebuilts
    . build/envsetup.sh
    breakfast u8825
    echo ""
    echo "Building CyanogenMod 10.1 for G330"
    mka bacon -j$CORES
    echo "Done"
    cp out/target/product/u8825/cm-*.zip . >> /dev/null
    echo ""
    echo "The G330 build is in the CyanogenMod directory"
    echo ""

elif [[ $device = "4" ]]; then
    echo ""
    echo "You selected Kernel only"
    echo ""
    rm -rf device/huawei/u8825 >> /dev/null
    . build/envsetup.sh
    echo ""
    echo "Building Kernel"
    lunch $u8833 && mka bootimage -j$CORES
    echo "Done"
    echo ""

else echo "" && echo "You must select 1, 2, 3 or 4"
fi
