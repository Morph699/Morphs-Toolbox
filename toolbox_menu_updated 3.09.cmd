@echo off
setlocal EnableDelayedExpansion
:: ============================================
:: ADMIN & INIT
:: ============================================
fltmc >nul 2>&1 || (powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs" & exit /b)
title Morphs Creations Toolbox Console v3.09
color 0A & CD /D "%~dp0"

:: ============================================
:: BASE DIRECTORY SETUP
:: ============================================
set "Base_Dir=%~dp0"
set "W_Dir=%Base_Dir%EngineToolbox"
set "P_Dir=%Base_Dir%EngineToolbox\Programs"
set "F_Dir=%Base_Dir%EngineToolbox\Frameworks"
set "T_Dir=%Base_Dir%EngineToolbox\Tools"
for %%d in ("%W_Dir%" "%P_Dir%" "%F_Dir%" "%T_Dir%") do if not exist "%%~d" mkdir "%%~d" >nul 2>&1

:: ============================================
:: NETWORK DETECTION
:: ============================================
powershell -NoProfile -ExecutionPolicy Bypass -Command "if(Test-Connection -ComputerName 8.8.8.8 -Count 1 -Quiet){exit 0}else{exit 1}" >nul 2>&1
if %errorlevel% EQU 0 (set "NetState=ONLINE" & set "StateCol=0B") else (set "NetState=OFFLINE" & set "StateCol=0C")
set "Arch=x86" & if exist "%WinDir%\SysWOW64" set "Arch=x64"

:: ============================================
:: MAIN MENU (PAGE 1)
:: ============================================
:MainMenu
set "Page=1"
mode con: cols=106 lines=33
set "uinput=" & set "sel=" & cls & color %StateCol%
echo  =========================================================================================================
echo    		 **Morphs Creations** DEPLOYMENT CONSOLE v3.09    [^] MODE: %NetState%    [^] ARCH: %Arch%
echo  =========================================================================================================
echo   --------------------       -------------------       -------------------         ------------------
echo    Standard Programs          Portable Tools 1          Portable Tools 3            Forensic Suites
echo   --------------------       -------------------       -------------------         ------------------
echo  [ 1 ] 7-Zip Archiver       [ 30 ] Everything         [ 50 ] Driver Booster       [ 80 ] EZ Forensic (76M)
echo  [ 2 ] WinRAR Suite         [ 31 ] Revo Uninst Free   [ 51 ] MiniTool (80MB)      [ 81 ] NirLauncher 
echo  [ 3 ] WinDirStat Anlz      [ 32 ] WinSetupFromUSB    [ 52 ] Lacey Dwnld (79M)    
echo  [ 4 ] PotPlayer (51M)      [ 33 ] Rufus Boot         [ 53 ] WinTools Prem        ----------------------
echo  [ 5 ] K-Lite Mega (64M)    [ 34 ] Ventoy Multi       [ 54 ] AIDA64 Extr (59M)      System Optimizations
echo  [ 7 ] UltraISO Utility     [ 35 ] Hard Disk Sent     [ 55 ] CCleaner Old         ----------------------
echo  [ 8 ] Telegram (51M)       [ 36 ] Network Tools      [ 56 ] Freemake (52MB)      [ 91 ] Safe WinSxS Purge
echo  [ 9 ] AIMP Audio Player    [ 37 ] Anydesk Tool       [ 57 ] Recuva Recovery      [ 92 ] Toggle Hibern
echo  [ 10 ] Winamp Player       [ 38 ] Psiphon Proxy      [ 58 ] Drive Snapshot       [ 93 ] Compact OS Eng
echo  [ 11 ] Lantern VPN Proxy   [ 39 ] HWiNFO Portable    [ 59 ] Aomei Part (83M)     [ 94 ] Inject Ownership
echo  [ 12 ] SmadAV Security     [ 40 ] CPU-Z Hardware                                 [ 95 ] Toggle Resrv Stor
echo  [ 13 ] UltraViewer Remote  ------------------        --------------------        ---------------
echo     -----------------        Portable Tools 2          Deployment Runtimes         Macro Presets
echo      Online Browsers        --------------------      --------------------        ---------------
echo     -----------------       [ 41 ] Easy Context       [ 70 ] AdobeAIR Framework   [ 100 ] Browsers Suite
echo   [ 20 ] Edge (194M)        [ 42 ] PatchMyPC (61M)    [ 71 ] Microsoft XNA Build  [ 150 ] Runtimes Pack
echo   [ 21 ] Chrome (148M)      [ 43 ] RustDesk Remote    [ 72 ] OpenAL Audio Engine  [ 200 ] Portable Pack 1
echo   [ 22 ] Firefox (84M)      [ 44 ] CrystalDiskInfo    [ 73 ] DirectX Leg (95M)    [ 250 ] Portable Pack 2
echo   [ 23 ] Brave (223M)       [ 45 ] oCam Recorder      [ 74 ] VC++ AIO (Tiny)      [ 300 ] Portable Pack 3
echo   [ 24 ] Avast Antivirus    [ 46 ] WinToUSB (61M)     [ 75 ] Nvidia PhysX Legacy  [ 666 ] NUCLEAR DEPLOY
echo   [ 25 ] Discord (102M)     [ 47 ] WinToHDD Tool      [ 76 ] Java JRE 8 (x32)     
echo   [ 26 ] Steam (45MB)       [ 49 ] Native Img View    [ 77 ] Java JRE 8 (x64)     
goto :MenuFooter

:: ============================================
:: MAIN MENU (PAGE 2)
:: ============================================
:MenuPage2
set "Page=2"
mode con: cols=106 lines=28
set "uinput=" & set "sel=" & cls & color %StateCol%
echo  =========================================================================================================
echo     			**Morphs Creations** DEPLOYMENT CONSOLE v3.09 (Page 2/3)
echo  =========================================================================================================
echo.
echo    Office ^& Productivity     Media Production           Developer Tools            Morphs System Tweaks
echo   ------------------------   -------------------       -------------------       -----------------------
echo  [ 701 ] CentBrowser (108M) [ 710 ] VLC Media Mirror  [ 720 ] VS Code (296M)    [ 800 ] Defender Control
echo  [ 702 ] SumatraPDF Port    [ 711 ] Handbrake         [ 721 ] Notepad++ Port    [ 801 ] Hide From Uninst
echo  [ 703 ] Notepad3 Portable  [ 712 ] qBittorrent 5.2   [ 722 ] Git for Win (62M) [ 802 ] Net Profile Name
echo  [ 704 ] (Removed)          [ 713 ] Shotcut (113M)    [ 723 ] Python 3.14       [ 803 ] NewFileTime Port
echo   -------------------                                 [ 724 ] WinMerge Tool     [ 804 ] Optimizer 
echo    Network ^& Server          ---------------------     ----------------         [ 805 ] RegConverter
echo   -------------------          Security ^& Privacy       Archive ^& ISO           [ 806 ] Service Manager
echo  [ 740 ] Wireshark (92M)      ---------------------     ----------------        [ 807 ] Win Update Block
echo  [ 741 ] Nmap Security      [ 750 ] Malwarebytes(250M)[ 760 ] PowerISO 9.0      -------------------------
echo  [ 742 ] PuTTY SSH Client   [ 751 ] PrivaZer Utility  [ 761 ] Rufus 4.15 (New) 
echo  [ 743 ] FileZilla FTP      [ 752 ] Glary Utilities   [ 762 ] ImgBurn Suite      
echo  [ 744 ] Advanced IP Scan   [ 753 ] Internet DwnldMgr [ 763 ] AnyBurn Suite     
echo                             [ 754 ] VeraCrypt         [ 764 ] Format Factory      
goto :MenuFooter

:: ============================================
:: MAIN MENU (PAGE 3)
:: ============================================
:MenuPage3
set "Page=3"
mode con: cols=106 lines=24
set "uinput=" & set "sel=" & cls & color %StateCol%
echo  =========================================================================================================
echo     			**Morphs Creations** DEPLOYMENT CONSOLE v3.09 (Page 3/3)
echo  =========================================================================================================
echo.
echo   		Context Menu Additions (ENABLE)           Context Menu Removal (DISABLE)
echo  	      -----------------------------------       ----------------------------------
echo  		[ 120 ] Enable CP Desktop Menu             [ 130 ] Disable CP Desktop Menu
echo  		[ 121 ] Enable Personalize Classic         [ 131 ] Disable Personalize Classic
echo  		[ 122 ] Enable Restart Explorer            [ 132 ] Disable Restart Explorer
echo  		[ 123 ] Enable System Shortcuts            [ 133 ] Disable System Shortcuts
echo  		[ 124 ] Enable System Tools                [ 134 ] Disable System Tools
echo  		[ 125 ] Enable Take Ownership              [ 135 ] Disable Take Ownership
echo.
echo  =========================================================================================================
echo     			Registry Integration Suite
echo  =========================================================================================================
echo        Note: These changes take effect immediately after clicking.
echo  =========================================================================================================
goto :MenuFooter

:: ============================================
:: FOOTER NAVIGATION
:: ============================================
:MenuFooter
echo  =========================================================================================================
echo     [ 0 ] Exit  [ N ] Next Page  [ B ] Back Page  [ S ] Save Profile  [ L ] Load Profile
echo  =========================================================================================================
set /p "uinput=Selection: "

if not defined uinput goto RefreshPage
if "%uinput%"=="0" exit /b

if /I "!uinput!"=="N" (
    if "!Page!"=="1" goto MenuPage2
    if "!Page!"=="2" goto MenuPage3
    if "!Page!"=="3" goto MainMenu
)
if /I "!uinput!"=="B" (
    if "!Page!"=="1" goto MenuPage3
    if "!Page!"=="2" goto MainMenu
    if "!Page!"=="3" goto MenuPage2
)

if /I "!uinput!"=="S" (set /p "cq=Enter IDs: " & echo !cq! > "%F_Dir%\Profile.txt" & goto RefreshPage)
if /I "!uinput!"=="L" (if exist "%F_Dir%\Profile.txt" (set /p sel=<"%F_Dir%\Profile.txt" & goto PrepQueue) else (goto RefreshPage))

set "sel=%uinput%"
if "%sel%"=="100" set "sel=20 21 22 23"
if "%sel%"=="150" set "sel=70 71 72 73 74 75 76 77"
if "%sel%"=="200" set "sel=30 31 32 33 34 35 36 37 38 39 40"
if "%sel%"=="250" set "sel=41 42 43 44 45 46 47 48 49"
if "%sel%"=="300" set "sel=50 51 52 53 54 55 56 57 58 59"
if "%sel%"=="666" set "sel=1 2 20 21 74 701 712 721 752 92 93 800 807"

:PrepQueue
set "TotalItems=0" & for %%a in (%sel%) do set /a "TotalItems+=1"
set "CurrentIndex=0"

:ProcessQueue
set /a "CurrentIndex+=1"
for /f "tokens=1*" %%a in ("!sel!") do (set "cid=%%a" & set "sel=%%b")
if not defined cid goto RefreshPage

cls & echo ==========================================================
echo  PROCESSING: [!CurrentIndex!/!TotalItems!] - ID: %cid%
echo ==========================================================
findstr /i /b /c:":Opt_%cid% " "%~f0" >nul 2>&1
if !errorlevel! EQU 0 (call :Opt_%cid%) else (echo [-] ID [%cid%] missing. & timeout /t 2 >nul)

if defined sel goto :ProcessQueue
echo. & echo [+] Queue complete. & timeout /t 2 >nul

:RefreshPage
if "%Page%"=="1" goto MainMenu
if "%Page%"=="2" goto MenuPage2
if "%Page%"=="3" goto MenuPage3
goto MainMenu

:: ============================================
:: SUBROUTINES (PAGE 1)
:: ============================================
:Opt_1 
call :DirectDL "https://github.com/ip7z/7zip/releases/download/26.02/7z2602-x64.exe" "%P_Dir%\7z2602-x64.exe"
exit /b
:Opt_2 
call :DirectDL "https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-723.exe" "%P_Dir%\winrar-x64-723.exe"
exit /b
:Opt_3 
call :DirectDL "https://github.com/windirstat/windirstat/releases/latest/download/WinDirStat.zip" "%P_Dir%\WinDirStat.zip"
exit /b
:Opt_4 
call :DirectDL "https://t1.kakaocdn.net/potplayer/PotPlayer/Version/Latest/PotPlayerSetup64.exe" "%P_Dir%\PotPlayerSetup64.exe"
exit /b
:Opt_5 
call :DirectDL "https://files2.codecguide.com/K-Lite_Codec_Pack_1982_Mega.exe" "%P_Dir%\K-Lite_Mega.exe"
exit /b
:Opt_7 
set "tUrl=https://dw.ezbsystems.com/uiso9_pe.exe"
call :DirectDL "!tUrl!" "%P_Dir%\UltraISO_Setup.exe"
exit /b
:Opt_8 
call :DirectDL "https://github.com/telegramdesktop/tdesktop/releases/download/v7.0.1/tsetup-x64.7.0.1.exe" "%P_Dir%\Telegram_Setup.exe"
exit /b
:Opt_9 
set "vUrl=https://aimp.ru/?do=download.file&id=3"
call :DirectDL "!vUrl!" "%P_Dir%\AIMP_Setup.exe"
exit /b
:Opt_10 
call :DirectDL "http://download.nullsoft.com/winamp/client/winamp_latest_full.exe" "%P_Dir%\Winamp_Setup.exe"
exit /b
:Opt_11 
call :DirectDL "https://media.githubusercontent.com/media/getlantern/lantern-binaries/main/lantern-installer.exe" "%P_Dir%\Lantern_Setup.exe"
exit /b
:Opt_12 
call :DirectDL "https://downloads.sourceforge.net/project/smadav-antivirus/SmadAV.exe" "%P_Dir%\SmadAV_Setup.exe"
exit /b
:Opt_13 
call :DirectDL "https://www.ultraviewer.net/en/UltraViewer_setup_6.6_en.exe" "%P_Dir%\UltraViewer_Setup.exe"
exit /b
:Opt_20 
call :DirectDL "https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0870b5f5-cf08-4f24-8383-f362a669fcd8/MicrosoftEdgeEnterpriseX64.msi" "%P_Dir%\Edge_Enterprise_x64.msi"
exit /b
:Opt_21 
call :DirectDL "https://dl.google.com/chrome/install/ChromeStandaloneSetup64.exe" "%P_Dir%\Chrome_Setup.exe"
exit /b
:Opt_22 
set "vUrl=https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US"
call :DirectDL "!vUrl!" "%P_Dir%\Firefox_Latest_x64.exe"
exit /b
:Opt_23 
call :DirectDL "https://github.com/brave/brave-browser/releases/download/v1.92.139/brave-v1.92.139-win32-x64.zip" "%P_Dir%\Brave_Portable_x64.zip"
exit /b
:Opt_24 
call :DirectDL "https://bits.avcdn.net/productfamily_ANTIVIRUS/insttype_FREE/platform_WIN/installertype_ONLINE/build_RELEASE" "%P_Dir%\Avast_Free_Online.exe"
exit /b
:Opt_25 
call :DirectDL "https://discord.com/api/download?platform=win" "%P_Dir%\Discord_Setup.exe"
exit /b
:Opt_26 
call :DirectDL "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe" "%P_Dir%\Steam_Setup.exe"
exit /b
:Opt_30 
call :DirectDL "https://www.voidtools.com/Everything-1.4.1.1032.x64.zip" "%T_Dir%\Everything_x64.zip"
exit /b
:Opt_31 
call :DirectDL "https://revouninstaller.b-cdn.net/ruf270/RevoUninstaller_Portable.zip" "%T_Dir%\Revo_Portable.zip"
exit /b
:Opt_32 
call :DirectDL "https://downloads.sourceforge.net/project/winsetupfromusb/WinSetupFromUSB-1-10.exe" "%T_Dir%\WinSetupFromUSB.exe"
exit /b
:Opt_33 
call :DirectDL "https://github.com/pbatard/rufus/releases/download/v4.15/rufus-4.15p.exe" "%T_Dir%\Rufus_4.15.exe"
exit /b
:Opt_34 
call :DirectDL "https://github.com/ventoy/Ventoy/releases/download/v1.1.16/ventoy-1.1.16-windows.zip" "%T_Dir%\Ventoy_x64.zip"
exit /b
:Opt_35 
call :DirectDL "https://www.harddisksentinel.com/hdsentinel_setup.zip" "%T_Dir%\HardDiskSentinel.zip"
exit /b
:Opt_36 
call :DirectDL "https://www.nirsoft.net/packages/networktools.zip" "%T_Dir%\NetworkTools.zip"
exit /b
:Opt_37 
call :DirectDL "https://download.anydesk.com/AnyDesk.exe" "%T_Dir%\AnyDesk.exe"
exit /b
:Opt_38 
call :DirectDL "https://psiphon.ca/psiphon3.exe" "%T_Dir%\Psiphon3.exe"
exit /b
:Opt_39 
call :DirectDL "https://www.hwinfo.com/files/hwi_816.zip" "%T_Dir%\HWiNFO_Portable.zip"
exit /b
:Opt_40 
call :DirectDL "https://download.cpuid.com/cpu-z/cpu-z_2.10-en.zip" "%T_Dir%\CPU-Z_Portable.zip"
exit /b
:Opt_41 
call :DirectDL "https://www.sordum.org/files/downloads.php?easy-context-menu" "%T_Dir%\EasyContextMenu.zip"
exit /b
:Opt_42 
call :DirectDL "https://homeupdater.patchmypc.com/public/PatchMyPC-HomeUpdater-Portable.exe" "%T_Dir%\PatchMyPC_Portable.exe"
exit /b
:Opt_43 
call :DirectDL "https://github.com/rustdesk/rustdesk/releases/download/1.3.1/rustdesk-1.3.1-x86_64.exe" "%T_Dir%\RustDesk_Setup.exe"
exit /b
:Opt_44 
call :DirectDL "https://github.com/v0lt/CrystalDiskInfo/releases/download/9.4.4/CrystalDiskInfo9_4_4.zip" "%T_Dir%\CrystalDiskInfo.zip"
exit /b
:Opt_45 
call :DirectDL "https://raw.githubusercontent.com/ohsoft/archive/master/ocam/2023121501/oCam_v550.0.exe" "%T_Dir%\oCam_Setup.exe"
exit /b
:Opt_46 
call :DirectDL "https://www.easyuefi.com/wintousb/downloads/WinToUSB_Free.exe" "%T_Dir%\WinToUSB_Free.exe"
exit /b
:Opt_47 
call :DirectDL "https://www.easyuefi.com/wintohdd/downloads/WinToHDD_Free.exe" "%T_Dir%\WinToHDD_Free.exe"
exit /b
:Opt_49 
call :DirectDL "https://github.com/deminimis/minimalimageviewer/releases/download/v2.0.3/MinimalImageViewer.exe" "%T_Dir%\NativeImageViewer.exe"
exit /b
:Opt_50 
call :DirectDL "https://www.iobit.com/downloadcenter.php?product=driver-booster" "%P_Dir%\Driver_Booster_Setup.exe"
exit /b
:Opt_51 
call :DirectDL "https://cdn2.minitool.com/download-center/release/products/pw/current-release/pw-free.exe" "%P_Dir%\MiniTool_PartitionFree.exe"
exit /b
:Opt_52 
call :DirectDL "https://www.the-sz.com/common/get.php?product=lacey" "%T_Dir%\Lacey_Downloader.zip"
exit /b
:Opt_53 
call :DirectDL "https://www.wintools.net/wintools.zip" "%T_Dir%\WinTools_Premium.zip"
exit /b
:Opt_54 
call :DirectDL "https://download2.aida64.com/aida64extreme830.exe" "%T_Dir%\AIDA64_Extreme.exe"
exit /b
:Opt_55 
call :DirectDL "https://download.ccleaner.com/ccsetup563.exe" "%P_Dir%\CCleaner_v563_Classic.exe"
exit /b
:Opt_56 
call :DirectDL "https://files.majorgeeks.com/d5727f7f329972352b2203/FreemakeVideoDownloaderSetup.exe" "%P_Dir%\FreemakeDownloader.exe"
exit /b
:Opt_57 
call :DirectDL "https://download.ccleaner.com/rcsetup155.exe" "%P_Dir%\Recuva_Setup.exe"
exit /b
:Opt_58 
call :DirectDL "http://www.drivesnapshot.de/download/snapshot64.exe" "%T_Dir%\DriveSnapshot_x64.exe"
exit /b
:Opt_59 
call :DirectDL "https://go.aomeitech.com/dl/pa/PAssist_Std.exe" "%P_Dir%\AOMEI_PartitionAssistant.exe"
exit /b
:Opt_70 
call :DirectDL "https://airsdk.harman.com/assets/downloads/51.3.3.1/AdobeAIR.exe" "%F_Dir%\AdobeAIR.exe"
exit /b
:Opt_71 
call :DirectDL "https://download.microsoft.com/download/a/c/2/ac2c903b-e6e8-42c2-9fd7-bebac362a930/xnafx40_redist.msi" "%F_Dir%\XNA_Framework_4.0.msi"
exit /b
:Opt_72 
call :DirectDL "https://www.openal.org/downloads/oalinst.zip" "%F_Dir%\OpenAL_Runtime.zip"
exit /b
:Opt_73 
call :DirectDL "https://download.microsoft.com/download/8/4/a/84a35bf1-dafe-4ae8-82af-ad2ae20b6b14/directx_Jun2010_redist.exe" "%F_Dir%\DirectX_Jun2010.exe"
exit /b
:Opt_74 
call :DirectDL "https://www.tinyplease.com/vcpp" "%F_Dir%\VC_Redist_AIO.exe"
exit /b
:Opt_75 
call :DirectDL "https://us.download.nvidia.com/Windows/9.13.0604/PhysX-9.13.0604-SystemSoftware-Legacy.msi" "%F_Dir%\PhysX_Legacy.msi"
exit /b
:Opt_76 
call :DirectDL "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=253194_f7fe8e644f724108bdb54139381e29a7" "%F_Dir%\Java8_x32.exe"
exit /b
:Opt_77 
call :DirectDL "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=253195_f7fe8e644f724108bdb54139381e29a7" "%F_Dir%\Java8_x64.exe"
exit /b
:Opt_80 
call :DirectDL "https://www.mediafire.com/file_premium/xt9r3l0v6ed4f0y/EZTools-R1122.3.5.1%%28IN%%29.zip/file" "%T_Dir%\EZTools_Forensic.zip"
exit /b
:Opt_81 
call :DirectDL "https://archive.org/download/nirsoft_package_1.30.34/nirsoft_package_1.30.34.zip" "%T_Dir%\NirLauncher.zip"
exit /b

:: ============================================
:: SUBROUTINES (PAGE 2)
:: ============================================
:Opt_701 
call :DirectDL "https://static.centbrowser.com/win_stable/5.2.1168.83/centbrowser_5.2.1168.83_x64.exe" "%P_Dir%\CentBrowser_Setup.exe"
exit /b
:Opt_702 
call :DirectDL "https://www.sumatrapdfreader.org/dl/rel/3.6.1/SumatraPDF-3.6.1-64.zip" "%P_Dir%\SumatraPDF.zip"
exit /b
:Opt_703 
call :DirectDL "https://github.com/rizonesoft/Notepad3/releases/download/RELEASE_7.26.602.1/Notepad3_7.26.602.1_x64_Portable.zip" "%P_Dir%\Notepad3.zip"
exit /b
:Opt_710 
call :DirectDL "https://mirror.aptus.co.tz/pub/videolan/vlc/3.0.23/win64/vlc-3.0.23-win64.exe" "%P_Dir%\VLC_x64.exe"
exit /b
:Opt_711 
call :DirectDL "https://github.com/HandBrake/HandBrake/releases/download/1.8.2/HandBrake-1.8.2-x86_64-Win_GUI.exe" "%P_Dir%\Handbrake_Portable.exe"
exit /b
:Opt_712 
call :DirectDL "https://github.com/qbittorrent/qBittorrent/releases/download/release-5.0.0/qbittorrent_5.0.0_x64_setup.exe" "%P_Dir%\qBittorrent.exe"
exit /b
:Opt_713 
call :DirectDL "https://github.com/mltframework/shotcut/releases/download/v24.06.26/shotcut-win64-240626.exe" "%P_Dir%\Shotcut_Portable.exe"
exit /b
:Opt_720 
call :DirectDL "https://update.code.visualstudio.com/latest/win32-x64-archive/stable" "%P_Dir%\VSCode_x64.zip"
exit /b
:Opt_721 
call :DirectDL "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.9.7/npp.8.9.7.portable.x64.7z" "%P_Dir%\NotepadPP_Portable.7z"
exit /b
:Opt_722 
call :DirectDL "https://github.com/git-for-windows/git/releases/download/v2.55.0.windows.3/Git-2.55.0.3-64-bit.exe" "%P_Dir%\Git_Setup.exe"
exit /b
:Opt_723 
call :DirectDL "https://www.python.org/ftp/python/3.14.6/python-3.14.6-amd64.exe" "%P_Dir%\Python_3.14.exe"
exit /b
:Opt_724 
call :DirectDL "https://github.com/WinMerge/winmerge/releases/download/v2.16.44/WinMerge-2.16.44-x64-Setup.exe" "%P_Dir%\WinMerge.exe"
exit /b
:Opt_740 
call :DirectDL "https://www.wireshark.org/download/win64/Wireshark-latest-x64.exe" "%P_Dir%\Wireshark_Setup.exe"
exit /b
:Opt_741 
call :DirectDL "https://nmap.org/dist/nmap-7.99-setup.exe" "%P_Dir%\Nmap_Setup.exe"
exit /b
:Opt_742 
call :DirectDL "https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.84-installer.msi" "%P_Dir%\PuTTY_Setup.msi"
exit /b
:Opt_743 
call :DirectDL "https://download2.filezilla-project.org/client/FileZilla_3.67.1_win64-setup.exe" "%P_Dir%\FileZilla_Setup.exe"
exit /b
:Opt_744 
call :DirectDL "https://download.advanced-ip-scanner.com/download/files/Advanced_IP_Scanner_2.5.4594.1.exe" "%P_Dir%\Advanced_IP_Scanner.exe"
exit /b
:Opt_750 
call :DirectDL "https://downloads.malwarebytes.com/file/mb-windows?filename=MBSetup-3.3.exe" "%P_Dir%\Malwarebytes_Setup.exe"
exit /b
:Opt_751 
call :DirectDL "https://privazer.com/en/PrivaZer.exe" "%P_Dir%\PrivaZer.exe"
exit /b
:Opt_752 
call :DirectDL "https://www.glarysoft.com/aff/download2.php?s=GU" "%P_Dir%\GlaryUtilities_Setup.exe"
exit /b
:Opt_753 
call :DirectDL "https://download.internetdownloadmanager.com/idman643build5.exe" "%P_Dir%\IDM_Setup.exe"
exit /b
:Opt_754 
call :DirectDL "https://github.com/veracrypt/VeraCrypt/releases/download/VeraCrypt_1.26.7/VeraCrypt_Setup_1.26.7.exe" "%P_Dir%\VeraCrypt_Portable.exe"
exit /b
:Opt_760 
call :DirectDL "https://www.poweriso.com/PowerISO9-x64.exe" "%P_Dir%\PowerISO_x64.exe"
exit /b
:Opt_761 
call :DirectDL "https://github.com/pbatard/rufus/releases/download/v4.15/rufus-4.15p.exe" "%P_Dir%\Rufus_4.15.exe"
exit /b
:Opt_762 
call :DirectDL "https://download.imgburn.com/SetupImgBurn_2.5.8.0.exe" "%P_Dir%\ImgBurn_Setup.exe"
exit /b
:Opt_763 
call :DirectDL "https://www.anyburn.com/anyburn_setup.exe" "%P_Dir%\AnyBurn_Setup.exe"
exit /b
:Opt_764 
call :DirectDL "http://download.pcfreetime.com/formatfactory/FFSetup_latest.exe" "%P_Dir%\FormatFactory_Setup.exe"
exit /b
:Opt_800 
call :DirectDL "https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/dControl.exe" "%T_Dir%\dControl.exe"
if exist "%T_Dir%\dControl.exe" start "" "%T_Dir%\dControl.exe"
exit /b
:Opt_801 
call :DirectDL "https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/HideUL_x64.exe" "%T_Dir%\HideUL_x64.exe"
exit /b
:Opt_802 
call :DirectDL "https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/NetPnc_x64.exe" "%T_Dir%\NetPnc_x64.exe"
exit /b
:Opt_803 
call :DirectDL "https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/NewFileTime_x64.exe" "%T_Dir%\NewFileTime_x64.exe"
exit /b
:Opt_804 
call :DirectDL "https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/Optimizer.exe" "%T_Dir%\Optimizer.exe"
exit /b
:Opt_805 
call :DirectDL "https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/RegConvert.exe" "%T_Dir%\RegConvert.exe"
exit /b
:Opt_806 
call :DirectDL "https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/srvman.exe" "%T_Dir%\srvman.exe"
exit /b
:Opt_807 
call :DirectDL "https://raw.githubusercontent.com/Morph699/Morphs-Toolbox/main/Programs/Wub_x64.exe" "%T_Dir%\Wub_x64.exe"
if exist "%T_Dir%\Wub_x64.exe" start "" "%T_Dir%\Wub_x64.exe"
exit /b
:Opt_91 (dism.exe /online /cleanup-image /startcomponentcleanup & exit /b)
:Opt_92 (powercfg /h off & exit /b)
:Opt_93 (compact.exe /CompactOS:always & exit /b)
:Opt_94 (reg add "HKCR\*\shell\runas" /ve /t REG_SZ /d "Take Ownership" /f & exit /b)
:Opt_95 (dism /Online /Set-ReservedStorageState /State:Disabled & exit /b)
:Opt_120 (reg add "HKCR\DesktopBackground\Shell\Control Panel" /v "Icon" /t REG_SZ /d "control.exe" /f & reg add "HKCR\DesktopBackground\Shell\Control Panel\command" /ve /t REG_SZ /d "control.exe" /f & exit /b)
:Opt_121 (reg add "HKCR\DesktopBackground\Shell\PersonalizeClassic" /ve /t REG_SZ /d "Personalize (Classic)" /f & reg add "HKCR\DesktopBackground\Shell\PersonalizeClassic\command" /ve /t REG_SZ /d "control.exe desk.cpl,,@personalize" /f & exit /b)
:Opt_122 (reg add "HKCR\DesktopBackground\Shell\RestartExplorer" /ve /t REG_SZ /d "Restart Explorer" /f & reg add "HKCR\DesktopBackground\Shell\RestartExplorer\command" /ve /t REG_SZ /d "cmd.exe /c taskkill /f /im explorer.exe & start explorer.exe" /f & exit /b)
:Opt_130 (reg delete "HKCR\DesktopBackground\Shell\Control Panel" /f & exit /b)
:Opt_131 (reg delete "HKCR\DesktopBackground\Shell\PersonalizeClassic" /f & exit /b)
:Opt_132 (reg delete "HKCR\DesktopBackground\Shell\RestartExplorer" /f & exit /b)

:: ============================================
:: DOWNLOAD ENGINE (v3.05 - HARDENED PS)
:: ============================================
:DirectDL
set "dUrl=%~1" & set "dOut=%~2"
if "%dUrl:~0,4%" NEQ "http" set "dUrl=https://%dUrl%"
echo [SYNC] Source: %dUrl%
echo [DEST] Target: %dOut%

:: Hardened PS One-Liner with explicit unit conversion and suppressed byte stream text
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 -bor [Net.SecurityProtocolType]::Tls13; ^
    $ProgressPreference = 'Continue'; ^
    try { ^
        $h = @{'User-Agent'='Mozilla/5.0';'Referer'='https://www.google.com/'}; ^
        Invoke-WebRequest -Uri '%dUrl%' -OutFile '%dOut%' -Headers $h -MaximumRedirection 10; ^
        if (Test-Path '%dOut%') { ^
            $s = (Get-Item '%dOut%').Length; ^
            $d = if($s -gt 1MB){'{0:N2} MB' -f ($s/1MB)}else{'{0:N2} KB' -f ($s/1KB)}; ^
            Write-Host \"`n[OK] Download Successful ($d)\" -ForegroundColor Green; ^
            exit 0; ^
        } else { exit 1 } ^
    } catch { exit 1 }"

if %errorlevel% EQU 0 (
    timeout /t 2 >nul & exit /b 0
)
echo. & echo [-] Error: Engine failed to fetch binary. Check connection or ESET.
pause & exit /b 1