# install base

set -e
apt-get update -y
apt-get -y upgrade
echo "Europe/Dublin" > /etc/timezone
ln -fs /usr/share/zoneinfo/Europe/Dublin /etc/localtime
apt-get install -y tzdata
apt-get install apt-utils -y
apt-get install -y build-essential
apt-get install -y software-properties-common
apt-get install -y curl git unzip wget bzip2 python
apt-get install -y pdftk
apt-get install -qq -y cmake gcc libgetopt++-dev git
apt-get install -qq -y pkg-config libopenjpeg-dev libfontconfig1-dev libfontforge-dev poppler-data poppler-utils poppler-dbg
apt-get install -qq -y packaging-dev pkg-config python-dev libpango1.0-dev libglib2.0-dev libxml2-dev giflib-dbg
apt-get install -qq -y libjpeg-dev libtiff-dev uthash-dev libspiro-dev
apt-get install -y libopenjp2-7-dev
apt-get install -y ghostscript
apt-get install -y -f

# graphics magic

apt-get install graphicsmagick -y

# image magic

apt-get install imagemagick -y

# ffmpeg

apt-get install software-properties-common -y
add-apt-repository ppa:jonathonf/ffmpeg-4 -y
apt-get update -y
apt-get install ffmpeg -y

# poppler

cd ~/
wget https://poppler.freedesktop.org/poppler-0.79.0.tar.xz
tar -xvf poppler-0.79.0.tar.xz
cd poppler-0.79.0/
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DTESTDATADIR=$PWD/testfiles -DENABLE_UNSTABLE_API_ABI_HEADERS=ON ..
make
make install
cd ~/
wget https://poppler.freedesktop.org/poppler-data-0.4.9.tar.gz
tar -xvf poppler-data-0.4.9.tar.gz
cd poppler-data-0.4.9
make prefix=/usr install

# fontforge

apt-get install fontforge -y

#pdf to html ex

apt-get install -y pdf2htmlex

# ttf to woff

npm install -g ttf2woff

ln -sf /opt/nodejs/bin/ttf2woff /usr/bin/


# Cleanup

# Autoremove any junk
apt-get autoremove -y

# Clean out docs
rm -rf /usr/share/doc /usr/share/doc-base /usr/share/man /usr/share/locale /usr/share/zoneinfo

# Clean out package management dirs
rm -rf /var/lib/cache /var/lib/log

# Clean out /tmp
rm -rf /tmp/*

cd ~
rm -rf "poppler-0.53.0.tar.xz"
rm -rf "poppler-0.53.0"
rm -rf "fontforge"
rm -rf "pdf2htmlEX"
rm -rf "ttf2woff-0.14"
rm -rf "GraphicsMagick-1.3.19"