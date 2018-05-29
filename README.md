http://agnipulse.com/2009/12/kaspersky-rescue-disk-updater/

Download latest ISO of Kaspersky Rescue Disk 10 (updated 2018/05/28, stored on Google Drive) : <a href="https://drive.google.com/file/d/1CV-VeoiQDCzpgZS2jp-XkuuMUriVNLBC/view?usp=sharing" target="_blank">here</a>

Kaspersky Rescue Disk Updater is a tool which uses KLUpdater to update the virus definitions of the Kaspersky Rescue Disk 10 ISO.

Kaspersky Rescue Disk 10 can scan and remove viruses without booting into windows.The main disadvantage of Kaspersky Rescue Disk 10 is that it is not updated regularly.Even when it is updated there is no option to update your existing iso with the changes.You will have to download the entire iso.

So if you don't download the rescue disk regularly, the virus definitions become out of date.Even though the rescue disk has an option to update the virus definitions from the internet, it is not very useful as the updates are not saved.You have to download all the updates each and every time you use the rescue disk.

This tool fixes the above problems by updating your existing Kaspersky Rescue Disk ISO with the latest virus definitions from the Kaspersky Servers.This helps in keeping your recue disk up date without having to download a lot of files.Hence saving a lot of time and bandwidth.

1 . Download Kaspersky Rescue Disk from http://rescuedisk.kaspersky-labs.com/rescuedisk/updatable/kav_rescue_10.iso

2 . Download the above the Updater as a zip from http://github.com/bbalegere/Kaspersky-Rescue-Disk-Updater/zipball/master and extract it to directory of your choice.

3 . Rename kav_rescue_10.iso as rescue.iso and copy it to the above directory.

4 . Run diskupdt.bat

5 . After the update is done you will see two files -> rescue.iso and rescueusb.iso

6 . You can either burn rescue.iso to a CD and use it or you can boot it from a USB Drive.

 Booting the rescue disk from a USB Drive.

You can use the official tool to make your USB Drive bootable with Kasperksy Rescue Disk at http://support.kaspersky.com/faq/?qid=208286083

Or you can manually make your USB Drive bootable.

1 . Format and install grub4dos on your USB Drive using a tool like RMPrepUSB

2 . Create a folder called rescue and copy rescue.iso and rescueusb.iso into that folder.

3 . Copy liveusb and menu.lst to the root of your USB Drive.

4 . You can now boot the rescue disk from your USB Drive.




