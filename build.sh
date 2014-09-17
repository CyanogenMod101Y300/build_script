#/bin/bash

echo "Build script for CarbonRom 4.2.2 by luca020400"
echo "Enjoy !!!"
rm -rf out/target/product/u8833 >> /dev/null
rm -rf system/core >> /dev/null
repo sync -f && rm -rf system/core && repo sync -f
. build/envsetup.sh
lunch <<EOF
8
EOF
CORES=`nproc`
make carbon -j$CORES
mv /out/target/product/u8833/CA* .
echo "Done"
echo "The build is in the carbon directory"
