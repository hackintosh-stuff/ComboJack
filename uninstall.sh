#!/bin/bash

if [[ $EUID -ne 0 ]];
then
    exec sudo /bin/bash "$0" "$@"
fi

cd "$( dirname "${BASH_SOURCE[0]}" )"

# uninstall
sudo launchctl unload /Library/LaunchDaemons/com.XPS.ComboJack.plist
sudo rm /Library/LaunchDaemons/com.XPS.ComboJack.plist
sudo rm /usr/local/share/ComboJack/l10n.json
sudo rm /usr/local/share/ComboJack/Headphone.icns
sudo rm -r /usr/local/share/ComboJack
sudo rm /usr/local/sbin/hda-verb
sudo spctl --remove /usr/local/sbin/ComboJack
sudo rm /usr/local/sbin/ComboJack
echo
echo "Please reboot! Remember to remove VerbStub.kext as well."
echo
exit 0
