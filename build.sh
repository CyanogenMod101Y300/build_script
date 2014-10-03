#/bin/bash

echo "Build script for CarbonRom 4.2.2 by luca020400"
echo "Enjoy !!!"
repo init -u git://github.com/CarbonRomJellyBeanY300/android.git -b jb2
rm -rf out/target/product/u8833 >> /dev/null
rm -rf system/core >> /dev/null
echo "Downloading sources"
repo sync -f && rm -rf system/core >> /dev/null && repo sync -f
echo "Building CarbonRom 4.2.2"
. build/envsetup.sh
lunch <<EOF
8
EOF
CORES=$(( `nproc` + 1 ))
make carbon -j$CORES
cp out/target/product/u8833/CARBON*.zip .
echo "Done"
echo "The build is in the carbon directory"
