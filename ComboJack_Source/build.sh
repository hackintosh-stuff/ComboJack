#!/bin/bash
cd `dirname $0`

xcodebuild -configuration Release || exit 1
rm -f ../ComboJack_Installer/ComboJack
rm -f ../ComboJack_Installer/Headphone.icns
cp -f build/Release/ComboJack ../ComboJack_Installer/
cp -f ./Headphone.icns ../ComboJack_Installer/
rm -rf ./build
exec bash ../ComboJack_Installer/install.sh
