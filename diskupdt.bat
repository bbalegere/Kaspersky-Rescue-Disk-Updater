@ echo off
if not exist .\tools\mkisofs.exe goto t
if not exist .\KLUpdater\Updater.exe goto v
if not exist .\KLUpdater\ss_storage.ini goto v
if not exist .\tools\7z.exe goto x
if not exist rescue.iso goto y
if exist .\kavrescue rmdir /s .\kavrescue /q
if exist .\rescueusb.iso del .\rescueusb.iso
ECHO Kaspersky Rescue Disk Updater by Bharat Balegere
echo               AgniPulse.Com
echo http://agnipulse.com/2009/12/kaspersky-rescue-disk-updater/
echo https://github.com/bbalegere/Kaspersky-Rescue-Disk-Updater
echo.
echo.
echo.
Echo Extracting the contents of Kaspersky Rescue Disk
Title Extracting Kaspersky Rescue Disk
.\tools\7z x -o"kavrescue" -y -x"![BOOT]\*.img" "rescue.iso"
if errorlevel 1 goto :ERR
echo Kaspersky Files Extracted in %~dp0kavrescue
echo.
echo.
if exist "%ALLUSERSPROFILE%\Kaspersky Lab\AVP11\Bases\*.kdc" (
echo Looks like you have a Kaspersky Product installed.
echo Copying updates from your Local Kaspersky folder

copy "%ALLUSERSPROFILE%\Kaspersky Lab\AVP11\Bases\*.kdc" .\kavrescue\rescue\bases\ /y > nul
copy "%ALLUSERSPROFILE%\Kaspersky Lab\AVP11\Bases\Stat\kdb.stt" .\kavrescue\rescue\bases\stat\kdb.stt > nul
echo Copied Updates from your Local Kaspersky folder.
echo Do you want to skip updating from the internet? y/n
set /p choc=
)
if "%choc%"=="y" goto iso
Echo Next Step:Copying Virus Definition Files from your Rescue Disk to a Temporary Location
cls

Echo Copying Virus Definition Files from your Rescue Disk to a Temporary Location
title Copying Virus Definition Files from your Rescue Disk to a Temporary Location
if not exist .\kavrescue\rescue\bases goto u
if not exist .\KLUpdater\Temp\temporaryFolder\bases\av\kdb\i386 md .\KLUpdater\Temp\temporaryFolder\bases\av\kdb\i386
echo n|copy .\kavrescue\rescue\bases\*.* .\KLUpdater\Temp\temporaryFolder\bases\av\kdb\i386\ /-y > nul
echo Successfully Copied Definition Files to a Temporary Location
echo.
echo.
Echo Next Step:Updating Virus Definition Files from Kaspersky Server
cls
Echo Updating Virus Definition Files from Kaspersky Server
title Updating Virus Definition Files from Kaspersky Server
pushd KLUpdater
Updater.exe -u -c -rpt report.txt 
popd

echo.
echo.
Echo Next Step:Copying the Updated Virus Definition Files to your Rescue Disk
cls
Echo Copying the Updated Virus Definition Files to your Rescue Disk
title Copying the Updated Virus Definition Files to your Rescue Disk
copy .\KLUpdater\Updates\bases\av\kdb\i386\*.* .\kavrescue\rescue\bases\ > nul
copy .\KLUpdater\Updates\bases\av\emu\i386\*.* .\kavrescue\rescue\bases\ > nul
copy .\KLUpdater\Updates\bases\av\kdb\i386\kdb-i386-0607g.xml .\kavrescue\rescue\bases\kdb-0607g.xml > nul
copy /y .\KLUpdater\Updates\bases\av\kdb\i386\old\kdb.stt .\kavrescue\rescue\bases\stat\kdb.stt > nul
copy .\KLUpdater\Updates\index\u0607g.xml .\kavrescue\rescue\bases\data\u0607g.xml > nul
echo Successfully Copied Updated Definition Files to your Rescue Disk
echo.
echo.
:iso
Echo Next Step:Creating the Rescue Disk ISO Image


cls
title Creating the Rescue Disk ISO Image
Echo Creating the Rescue Disk ISO Image
SET CDBOOT=
if exist .\kavrescue\boot\grub\i386-pc\eltorito.img set CDBOOT=boot/grub/i386-pc/eltorito.img 
if exist .\kavrescue\boot\grub\grub_eltorito set CDBOOT=boot/grub/grub_eltorito 
if "%CDBOOT%"=="" goto bs
.\tools\mkisofs -R -J -joliet-long -o rescue.iso -b %CDBOOT% -c boot\boot.cat -no-emul-boot -boot-info-table -V "Kaspersky Rescue Disk" -boot-load-size 4 kavrescue
if errorlevel 1 goto :ERR
echo NO ERRORS - new rescue.iso IS MADE!

cls
title Creating the Small USB Rescue Disk ISO Image
Echo Creating the Small USB Rescue Disk ISO Image

rd /S /Q .\kavrescue\rescue
del /F /S /Q  .\kavrescue\image.squashfs
del /F /S /Q  .\kavrescue\livecd
.\tools\mkisofs -R -J -joliet-long -o rescueusb.iso -b %CDBOOT% -c boot\boot.cat -no-emul-boot -boot-info-table -V "Kaspersky Rescue Disk" -boot-load-size 4 kavrescue
if errorlevel 1 goto :ERR
echo NO ERRORS - new rescueusb.iso IS MADE!
goto end

:ERR
echo ERROR! Some problem occurred!
pause
goto end

:t
echo File Missing %~dp0Tools\mkisofs.exe
goto end

:bs
echo !! Bootsector Missing !! .\kavrescue\boot\grub\i386-pc\eltorito.img - please use correct version of ISO!
goto end

:u
echo !! The Kaspersky Rescue Disk is not a valid Disk. !!
echo It does not contain the bases folder.
echo http://rescuedisk.kaspersky-labs.com/rescuedisk/updatable/kav_rescue_10.iso
echo and rename it to rescue.iso
pause
goto end
:v
echo Missing file(s) %~dp0KLUpdater\Updater.exe, %~dp0KLUpdater\ss_storage.ini
goto end
:x
echo Missing file(s)  %~dp0Tools\7z.exe, %~dp0Tools\Formats\iso.dll
goto end
:y
echo !! Kaspersky Rescue Disk Not Found !!.
echo Missing File %~dp0rescue.iso
echo Please download Rescue Disk from:
echo http://rescuedisk.kaspersky-labs.com/rescuedisk/updatable/kav_rescue_10.iso
echo and rename it to rescue.iso
goto end
:end
pause
goto :EOF





