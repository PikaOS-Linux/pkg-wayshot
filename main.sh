#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://github.com/waycrate/wayshot.git --recurse-submodules
cd wayshot
cp -rvf ../debian ./

# Get build deps
apt-get build-dep ./ -y

make setup
# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/