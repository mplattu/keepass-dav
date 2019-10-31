#!/bin/sh

VERSION=1.1.2

if [ -d deb-root ]; then
	rm -fR deb-root
fi

mkdir deb-root

mkdir -p deb-root/usr/local/bin/
cp keepass-dav deb-root/usr/local/bin/
chmod 755 deb-root/usr/local/bin/

mkdir -p deb-root/usr/share/applications/
cp keepass-dav.desktop deb-root/usr/share/applications/

mkdir -p deb-root/etc/
cp keepass-dav.etc deb-root/etc/keepass-dav

fpm -C deb-root/ -s dir --name keepass-dav --architecture all -t deb \
	--version "$VERSION" --depends zenity --depends keepassx --depends curl \
	.
