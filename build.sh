#/bin/bash

rm -rf out/target/product/u8833
rm -rf system/core
repo sync -f && rm -rf system/core && repo sync -f
. build/envsetup.sh
lunch <<EOF
8
EOF
make carbon -j5
mv /out/target/product/u8833/CA* .
