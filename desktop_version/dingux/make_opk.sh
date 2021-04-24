#!/bin/sh

OPK_NAME=vvvvvv.opk

echo ${OPK_NAME}

# create default.gcw0.desktop
cat > default.gcw0.desktop <<EOF
[Desktop Entry]
Name=VVVVVV
Comment=2D puzzle platformer created by Terry Cavanagh
Exec=VVVVVV -assets /usr/local/home/.local/share/VVVVVV/data.zip
Terminal=false
Type=Application
StartupNotify=true
Icon=vvvvvv
Categories=games;
EOF

# create opk
FLIST="../flibitBuild/VVVVVV"
FLIST="${FLIST} default.gcw0.desktop"
FLIST="${FLIST} vvvvvv.png"

rm -f ${OPK_NAME}
/opt/gcw0-toolchain/usr/bin/mksquashfs ${FLIST} ${OPK_NAME} -all-root -no-xattrs -noappend -no-exports

cat default.gcw0.desktop
rm -f default.gcw0.desktop
