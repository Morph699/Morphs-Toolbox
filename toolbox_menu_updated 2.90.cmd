@echo off
setlocal EnableDelayedExpansion
:: ============================================
:: ADMIN & INIT
:: ============================================
fltmc >nul 2>&1 || (powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs" & exit /b)
title Morphs Creations Toolbox Console v2.90
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
echo    		 **Morphs Creations** DEPLOYMENT CONSOLE v2.90    [^] MODE: %NetState%    [^] ARCH: %Arch%
echo  =========================================================================================================
echo   --------------------       -------------------       -------------------         ------------------
echo    Standard Programs          Portable Tools 1          Portable Tools 3            Forensic Suites
echo   --------------------       -------------------       -------------------         ------------------
echo  [ 1 ] 7-Zip Archiver       [ 30 ] Everything         [ 50 ] Driver Booster       [ 80 ] EZ Forensic Pack
echo  [ 2 ] WinRAR Suite         [ 31 ] Revo Uninst Free   [ 51 ] MiniTool (80MB)      [ 81 ] NirLauncher 
echo  [ 3 ] WinDirStat Anlz      [ 32 ] WinSetupFromUSB    [ 52 ] Lacey Downloader     
echo  [ 4 ] PotPlayer Engine     [ 33 ] Rufus Boot         [ 53 ] WinTools Prem        ----------------------
echo  [ 5 ] K-Lite Mega          [ 34 ] Ventoy Multi       [ 54 ] AIDA64 Extreme         System Optimizations
echo  [ 7 ] UltraISO Utility     [ 35 ] Hard Disk Sent     [ 55 ] CCleaner Old         ----------------------
echo  [ 8 ] Telegram Desktop     [ 36 ] Network Tools      [ 56 ] Freemake (52MB)      [ 90 ] Win Update Blck
echo  [ 9 ] AIMP Audio Player    [ 37 ] Anydesk Tool       [ 57 ] Recuva Recovery      [ 91 ] Safe WinSxS Purge
echo  [ 10 ] Winamp Player       [ 38 ] Psiphon Proxy      [ 58 ] Drive Snapshot       [ 92 ] Toggle Hibern
echo  [ 11 ] Lantern VPN Proxy   [ 39 ] HWiNFO Portable    [ 59 ] Aomei Part (55MB)    [ 93 ] Compact OS Eng
echo  [ 12 ] SmadAV Security     [ 40 ] CPU-Z Hardware                                 [ 94 ] Inject Ownership
echo  [ 13 ] UltraViewer Remote  ------------------        --------------------        [ 95 ] Toggle Resrv Stor
echo     -----------------        Portable Tools 2          Deployment Runtimes        [ 96 ] Defender Control
echo      Online Browsers        --------------------      --------------------         ---------------
echo     -----------------       [ 41 ] Easy Context       [ 70 ] AdobeAIR Framework     Macro Presets
echo   [ 20 ] Edge (90MB)        [ 42 ] PatchMyPC          [ 71 ] Microsoft XNA Build   ---------------
echo   [ 21 ] Chrome Standalone  [ 43 ] RustDesk Remote    [ 72 ] OpenAL Audio Engine  [ 100 ] Browsers Suite
echo   [ 22 ] Firefox (55MB)     [ 44 ] CrystalDiskInfo    [ 73 ] DirectX Legacy (95M) [ 150 ] Runtimes Pack
echo   [ 23 ] Brave (98MB)       [ 45 ] oCam Recorder      [ 74 ] Visual C++ AIO (65M) [ 200 ] Portable Pack 1
echo   [ 24 ] Avast Antivirus    [ 46 ] WinToUSB Tool      [ 75 ] Nvidia PhysX Legacy  [ 250 ] Portable Pack 2
echo   [ 25 ] Discord (85MB)     [ 47 ] WinToHDD Tool      [ 76 ] Java JRE 8 (x32)     [ 300 ] Portable Pack 3
echo   [ 26 ] Steam (45MB)       [ 48 ] Deploy Choco       [ 77 ] Java JRE 8 (x64)     [ 666 ] NUCLEAR DEPLOY
echo  			    [ 49 ] Native Img View    
goto :MenuFooter

:MenuPage2
set "Page=2"
mode con: cols=106 lines=26
set "uinput=" & set "sel=" & cls & color %StateCol%
echo  =========================================================================================================
echo     			**Morphs Creations** DEPLOYMENT CONSOLE v2.90 (Page 2/2)
echo  =========================================================================================================
echo.
echo    Office ^& Productivity     Media Production           Developer Tools               Gaming 
echo   ------------------------   -------------------       -------------------           ----------
echo  [ 701 ] Cent Browser Port  [ 710 ] VLC Media Mirror  [ 720 ] VS Code (95MB)    [ 730 ] GOG Galaxy (210MB)
echo  [ 702 ] SumatraPDF Port    [ 711 ] Handbrake         [ 721 ] Notepad++ Port    [ 731 ] Epic Games (160MB)
echo  [ 703 ] Notepad3 Portable  [ 712 ] qBittorrent 5.2   [ 722 ] Git for Win(55MB)
echo  [ 704 ] WPS Office Suite   [ 713 ] Shotcut (105MB)   [ 723 ] Python 3.14             Social
echo   -------------------                                 [ 724 ] WinMerge Tool          --------
echo    Network ^& Server          ---------------------     ----------------          [ 732 ] Zoom Client
echo   -------------------          Security ^& Privacy       Archive ^& ISO            [ 733 ] WhatsApp Desktop
echo  [ 740 ] Wireshark (80MB)     ---------------------     ----------------    
echo  [ 741 ] Nmap Security      [ 750 ] Malwarebytes(250M)[ 760 ] PowerISO 9.0
echo  [ 742 ] PuTTY SSH Client   [ 751 ] PrivaZer Utility  [ 761 ] Rufus 4.15 (New)
echo  [ 743 ] FileZilla FTP      [ 752 ] Glary Utilities   [ 762 ] ImgBurn Suite
echo  [ 744 ] Advanced IP Scan   [ 753 ] Internet DwnldMgr [ 763 ] AnyBurn Suite
echo                             [ 754 ] VeraCrypt         [ 764 ] Format Factory
goto :MenuFooter

:MenuFooter
echo  =========================================================================================================
echo     [ 0 ] Exit  [ N ] Next Page  [ B ] Back Page  [ S ] Save Profile  [ L ] Load Profile
echo  =========================================================================================================
set /p "uinput=Selection: "
if not defined uinput (if "%Page%"=="2" (goto :MenuPage2) else (goto :MainMenu))
if "%uinput%"=="0" exit /b
if /I "%uinput%"=="N" goto :MenuPage2
if /I "%uinput%"=="B" goto :MainMenu
if /I "%uinput%"=="S" (set /p "cq=Enter IDs: " & echo !cq! > "%F_Dir%\Profile.txt" & goto :MainMenu)
if /I "%uinput%"=="L" (if exist "%F_Dir%\Profile.txt" (set /p sel=<"%F_Dir%\Profile.txt" & goto :PrepQueue))
set "sel=%uinput%"

:: Macros
if "%sel%"=="100" set "sel=20 21 22 23"
if "%sel%"=="150" set "sel=70 71 72 73 74 75 76 77"
if "%sel%"=="200" set "sel=30 31 32 33 34 35 36 37 38 39 40"
if "%sel%"=="250" set "sel=41 42 43 44 45 46 47 48 49"
if "%sel%"=="300" set "sel=50 51 52 53 54 55 56 57 58 59"
if "%sel%"=="666" set "sel=1 2 20 21 74 701 712 721 752 90 92 93"

:PrepQueue
set "TotalItems=0" & for %%a in (%sel%) do set /a "TotalItems+=1"
set "CurrentIndex=0"

:ProcessQueue
set /a "CurrentIndex+=1"
for /f "tokens=1*" %%a in ("!sel!") do (set "cid=%%a" & set "sel=%%b")
if not defined cid (if "%Page%"=="2" (goto :MenuPage2) else (goto :MainMenu))
cls & echo ==========================================================
echo  PROCESSING: [!CurrentIndex!/!TotalItems!] - ID: %cid%
echo ==========================================================
findstr /i /b /c:":Opt_%cid% " "%~f0" >nul 2>&1
if !errorlevel! EQU 0 (goto Opt_%cid%) else (echo [-] ID [%cid%] missing. & timeout /t 2 >nul)

:PostOpt
if defined sel goto :ProcessQueue
echo. & echo [+] Queue complete. Returning... & timeout /t 2 >nul
if "%Page%"=="2" (goto :MenuPage2) else (goto :MainMenu)

:: ============================================
:: SUBROUTINES
:: ============================================
:Opt_1 (call :DirectDL "https://github.com/ip7z/7zip/releases/download/26.02/7z2602-x64.exe" "%P_Dir%\7z2602-x64.exe" & goto PostOpt)
:Opt_2 (call :DirectDL "https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-723.exe" "%P_Dir%\winrar-x64-723.exe" & goto PostOpt)
:Opt_3 (call :DirectDL "https://github.com/windirstat/windirstat/releases/latest/download/WinDirStat.zip" "%P_Dir%\WinDirStat.zip" & goto PostOpt)
:Opt_4 (call :DirectDL "https://t1.kakaocdn.net/potplayer/PotPlayer/Version/Latest/PotPlayerSetup64.exe" "%P_Dir%\PotPlayerSetup64.exe" & goto PostOpt)
:Opt_5 (call :DirectDL "https://files2.codecguide.com/K-Lite_Codec_Pack_1982_Mega.exe" "%P_Dir%\K-Lite_Mega.exe" & goto PostOpt)
:Opt_7 
set "tUrl=https://dw.ezbsystems.com/uiso9_pe.exe"
call :DirectDL "!tUrl!" "%P_Dir%\UltraISO_Setup.exe"
goto PostOpt
:Opt_8 (call :DirectDL "https://github.com/telegramdesktop/tdesktop/releases/download/v7.0.1/tsetup-x64.7.0.1.exe" "%P_Dir%\Telegram_Setup.exe" & goto PostOpt)
:Opt_9 
set "tUrl=https://www.aimp.ru/?do=download.file^&id=3"
call :DirectDL "!tUrl!" "%P_Dir%\AIMP_Setup.exe"
goto PostOpt
:Opt_10 (call :DirectDL "http://download.nullsoft.com/winamp/client/winamp_latest_full.exe" "%P_Dir%\Winamp_Setup.exe" & goto PostOpt)
:Opt_11 (call :DirectDL "https://media.githubusercontent.com/media/getlantern/lantern-binaries/main/lantern-installer.exe" "%P_Dir%\Lantern_Setup.exe" & goto PostOpt)
:Opt_12 (call :DirectDL "http://download.findmysoft.com/2017/11/17/smadav_2017-Rev.-11.7.exe" "%P_Dir%\SmadAV_Setup.exe" & goto PostOpt)
:Opt_13 (call :DirectDL "https://www.ultraviewer.net/en/UltraViewer_setup_6.6_en.exe" "%P_Dir%\UltraViewer_Setup.exe" & goto PostOpt)
:Opt_20 (call :DirectDL "https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0870b5f5-cf08-4f24-8383-f362a669fcd8/MicrosoftEdgeEnterpriseX64.msi" "%P_Dir%\Edge_Enterprise_x64.msi" & goto PostOpt)
:Opt_21 (call :DirectDL "https://www.upload.ee/download/14842798/6931506c0fe922daf459/Chrome_Portable_MultiVersion_32-64-bit_Multilingual_Online.exe" "%P_Dir%\Chrome_Portable_Online.exe" & goto PostOpt)
:Opt_22 (call :DirectDL "https://download.mozilla.org/?product=firefox-latest-ssl^&os=win64^&lang=en-US" "%P_Dir%\Firefox_Latest_x64.exe" & goto PostOpt)
:Opt_23 (call :DirectDL "https://github.com/brave/brave-browser/releases/download/v1.92.139/brave-v1.92.139-win32-x64.zip" "%P_Dir%\Brave_Portable_x64.zip" & goto PostOpt)
:Opt_24 (call :DirectDL "https://bits.avcdn.net/productfamily_ANTIVIRUS/insttype_FREE/platform_WIN/installertype_ONLINE/build_RELEASE" "%P_Dir%\Avast_Free_Online.exe" & goto PostOpt)
:Opt_25 (call :DirectDL "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable^&platform=win^&arch=x64" "%P_Dir%\Discord_Setup.exe" & goto PostOpt)
:Opt_26 (call :DirectDL "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe" "%P_Dir%\Steam_Setup.exe" & goto PostOpt)
:Opt_30 (call :DirectDL "https://www.voidtools.com/Everything-1.4.1.1032.x64.zip" "%T_Dir%\Everything_x64.zip" & goto PostOpt)
:Opt_31 (call :DirectDL "https://revouninstaller.b-cdn.net/ruf270/RevoUninstaller_Portable.zip" "%T_Dir%\Revo_Portable.zip" & goto PostOpt)
:Opt_32 (call :DirectDL "http://www.winsetupfromusb.com/files/download-info/winsetupfromusb-1-10-exe/" "%T_Dir%\WinSetupFromUSB.exe" & goto PostOpt)
:Opt_33 (call :DirectDL "https://github.com/pbatard/rufus/releases/download/v4.15/rufus-4.15p.exe" "%T_Dir%\Rufus_4.15.exe" & goto PostOpt)
:Opt_34 (call :DirectDL "https://github.com/ventoy/Ventoy/releases/download/v1.1.16/ventoy-1.1.16-windows.zip" "%T_Dir%\Ventoy_x64.zip" & goto PostOpt)
:Opt_35 (call :DirectDL "https://sourceforge.net/projects/hard-disk-sentinel/files/hdsentinel_setup.zip/download" "%T_Dir%\HardDiskSentinel.zip" & goto PostOpt)
:Opt_36 (call :DirectDL "https://www.nirsoft.net/packages/networktools.zip" "%T_Dir%\NirSoft_Network_Tools.zip" & goto PostOpt)
:Opt_37 (call :DirectDL "https://download.anydesk.com/AnyDesk.exe" "%T_Dir%\AnyDesk.exe" & goto PostOpt)
:Opt_38 (call :DirectDL "https://psiphon.ca/psiphon3.exe" "%T_Dir%\Psiphon3.exe" & goto PostOpt)
:Opt_39 (call :DirectDL "https://sourceforge.net/projects/hwinfo/files/Windows_Portable/hwi_834.zip/download" "%T_Dir%\HWiNFO_Portable.zip" & goto PostOpt)
:Opt_40 (call :DirectDL "https://www.cpuid.com/downloads/cpu-z/cpu-z_2.20.2-en.zip" "%T_Dir%\CPU-Z_Portable.zip" & goto PostOpt)
:Opt_41 (call :DirectDL "https://www.sordum.org/files/downloads.php?easy-context-menu" "%T_Dir%\EasyContextMenu.zip" & goto PostOpt)
:Opt_42 (call :DirectDL "https://homeupdater.patchmypc.com/public/PatchMyPC-HomeUpdater-Portable.exe" "%T_Dir%\PatchMyPC_Portable.exe" & goto PostOpt)
:Opt_43 (call :DirectDL "https://sourceforge.net/projects/rustdesk.mirror/files/1.4.9/rustdesk-1.4.9-x86_64.exe/download" "%T_Dir%\RustDesk_Setup.exe" & goto PostOpt)
:Opt_44 (call :DirectDL "https://sourceforge.net/projects/crystaldiskinfo/files/9.9.1/CrystalDiskInfo9_9_1.zip/download" "%T_Dir%\CrystalDiskInfo_9.9.1.zip" & goto PostOpt)
:Opt_45 (call :DirectDL "https://raw.githubusercontent.com/ohsoft/archive/master/ocam/2023121501/oCam_v550.0.exe" "%T_Dir%\oCam_Setup.exe" & goto PostOpt)
:Opt_46 (call :DirectDL "https://www.easyuefi.com/wintousb/downloads/WinToUSB_Free.exe" "%T_Dir%\WinToUSB_Free.exe" & goto PostOpt)
:Opt_47 (call :DirectDL "https://www.easyuefi.com/wintohdd/downloads/WinToHDD_Free.exe" "%T_Dir%\WinToHDD_Free.exe" & goto PostOpt)
:Opt_48 (powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" & goto PostOpt)
:Opt_49 (call :DirectDL "https://github.com/deminimis/minimalimageviewer/releases/download/v2.0.3/MinimalImageViewer.exe" "%T_Dir%\NativeImageViewer.exe" & goto PostOpt)
:Opt_50 (call :DirectDL "https://www.iobit.com/downloadcenter.php?product=driver-booster" "%P_Dir%\Driver_Booster_Setup.exe" & goto PostOpt)
:Opt_51 (call :DirectDL "https://cdn2.minitool.com/?p=pw^&e=pw-free" "%P_Dir%\MiniTool_PartitionFree.exe" & goto PostOpt)
:Opt_52 (call :DirectDL "https://www.the-sz.com/common/get.php?product=lacey" "%T_Dir%\Lacey_Downloader.zip" & goto PostOpt)
:Opt_53 (call :DirectDL "https://www.wintools.net/wintools.zip" "%T_Dir%\WinTools_Premium.zip" & goto PostOpt)
:Opt_54 (call :DirectDL "https://download2.aida64.com/aida64extreme830.exe" "%T_Dir%\AIDA64_Extreme.exe" & goto PostOpt)
:Opt_55 (call :DirectDL "https://www.filepuma.com/download/ccleaner_6.25.11093-39597/download/" "%P_Dir%\CCleaner_v6.exe" & goto PostOpt)
:Opt_56 (call :DirectDL "https://www.freemake.com/download?id=FreemakeVideoDownloader.exe" "%P_Dir%\FreemakeDownloader.exe" & goto PostOpt)
:Opt_57 (call :DirectDL "https://download.ccleaner.com/rcsetup155.exe" "%P_Dir%\Recuva_Setup.exe" & goto PostOpt)
:Opt_58 (call :DirectDL "http://www.drivesnapshot.de/download/snapshot64.exe" "%T_Dir%\DriveSnapshot_x64.exe" & goto PostOpt)
:Opt_59 (call :DirectDL "https://go.aomeitech.com/dl/pa/PAssist_Std.exe" "%P_Dir%\AOMEI_PartitionAssistant.exe" & goto PostOpt)
:Opt_70 (call :DirectDL "https://airsdk.harman.com/assets/downloads/51.3.3.1/AdobeAIR.exe" "%F_Dir%\AdobeAIR.exe" & goto PostOpt)
:Opt_71 (call :DirectDL "https://download.microsoft.com/download/a/c/2/ac2c903b-e6e8-42c2-9fd7-bebac362a930/xnafx40_redist.msi" "%F_Dir%\XNA_Framework_4.0.msi" & goto PostOpt)
:Opt_72 (call :DirectDL "https://www.openal.org/downloads/oalinst.zip" "%F_Dir%\OpenAL_Runtime.zip" & goto PostOpt)
:Opt_73 (call :DirectDL "https://download.microsoft.com/download/8/4/a/84a35bf1-dafe-4ae8-82af-ad2ae20b6b14/directx_Jun2010_redist.exe" "%F_Dir%\DirectX_Jun2010.exe" & goto PostOpt)
:Opt_74 (call :DirectDL "https://kutt.to/vcppredist" "%F_Dir%\VC_Redist_AIO.exe" & goto PostOpt)
:Opt_75 (call :DirectDL "https://us.download.nvidia.com/Windows/9.13.0604/PhysX-9.13.0604-SystemSoftware-Legacy.msi" "%F_Dir%\PhysX_Legacy.msi" & goto PostOpt)
:Opt_76 (call :DirectDL "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=253194_f7fe8e644f724108bdb54139381e29a7" "%F_Dir%\Java8_x32.exe" & goto PostOpt)
:Opt_77 (call :DirectDL "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=253195_f7fe8e644f724108bdb54139381e29a7" "%F_Dir%\Java8_x64.exe" & goto PostOpt)
:Opt_80 (call :DirectDL "https://www.mediafire.com/file_premium/xt9r3l0v6ed4f0y/EZTools-R1122.3.5.1%%28IN%%29.zip/file" "%T_Dir%\EZTools_Forensic.zip" & goto PostOpt)
:Opt_81 (call :DirectDL "https://archive.org/download/nirsoft_package_1.30.34/nirsoft_package_1.30.34.zip" "%T_Dir%\NirLauncher.zip" & goto PostOpt)

:: ============================================
:: SPECIAL HANDLERS (90-96)
:: ============================================
:Opt_90 
echo [SPECIAL] Handling Windows Update Blocker...
set "tUrl=https://www.sordum.org/files/downloads.php?st-windows-update-blocker"
call :DirectDL "!tUrl!" "%T_Dir%\Wub_DL.zip"
if exist "%T_Dir%\Wub_DL.zip" (
    if not exist "%T_Dir%\Wub" mkdir "%T_Dir%\Wub"
    powershell -NoProfile -ExecutionPolicy Bypass -Command "try { Expand-Archive -Path '%T_Dir%\Wub_DL.zip' -DestinationPath '%T_Dir%\Wub' -Force } catch { exit 1 }"
    for /r "%T_Dir%\Wub" %%f in (Wub_x64.exe) do if exist "%%f" start "" "%%f"
)
goto PostOpt

:Opt_91 
dism.exe /online /cleanup-image /startcomponentcleanup
goto PostOpt

:Opt_92 
powercfg /h off
goto PostOpt

:Opt_93 
compact.exe /CompactOS:always
goto PostOpt

:Opt_94 
reg add "HKCR\*\shell\runas" /ve /t REG_SZ /d "Take Ownership" /f
goto PostOpt

:Opt_95 
dism /Online /Set-ReservedStorageState /State:Disabled
goto PostOpt

:Opt_96 
echo [SPECIAL] Handling Defender Control (Direct GitHub Source)...
set "tUrl=https://github.com/azurejoga/Defender-control-download/raw/master/dControl.exe"
call :DirectDL "!tUrl!" "%T_Dir%\dControl.exe"
if exist "%T_Dir%\dControl.exe" (
    start "" "%T_Dir%\dControl.exe"
)
goto PostOpt

:: ============================================
:: SUBROUTINES (PAGE 2)
:: ============================================
:Opt_701 (call :DirectDL "https://static.centbrowser.com/win_stable/5.2.1168.83/centbrowser_5.2.1168.83_x64.exe" "%P_Dir%\CentBrowser_Setup.exe" & goto PostOpt)
:Opt_702 (call :DirectDL "https://www.sumatrapdfreader.org/dl/rel/3.6.1/SumatraPDF-3.6.1-64.zip" "%P_Dir%\SumatraPDF.zip" & goto PostOpt)
:Opt_703 (call :DirectDL "https://github.com/rizonesoft/Notepad3/releases/download/RELEASE_7.26.602.1/Notepad3_7.26.602.1_x64_Portable.zip" "%P_Dir%\Notepad3.zip" & goto PostOpt)
:Opt_704 (call :DirectDL "https://wdl1.pccore.com/wps/download/WPS_Office_setup.exe" "%P_Dir%\WPS_Office_Setup.exe" & goto PostOpt)
:Opt_710 (call :DirectDL "https://mirror.aptus.co.tz/pub/videolan/vlc/3.0.23/win64/vlc-3.0.23-win64.exe" "%P_Dir%\VLC_x64.exe" & goto PostOpt)
:Opt_711 (call :DirectDL "https://handbrake.fr/rotation.php?file=HandBrake-1.11.2-x86_64-Win_GUI.zip" "%P_Dir%\Handbrake_Portable.zip" & goto PostOpt)
:Opt_712 (call :DirectDL "https://sourceforge.net/projects/qbittorrent/files/qbittorrent-win32/qbittorrent-5.2.3/qbittorrent_5.2.3_x64_setup.exe/download" "%P_Dir%\qBittorrent_5.2.3_x64.exe" & goto PostOpt)
:Opt_713 (call :DirectDL "https://sourceforge.net/projects/shotcut/files/v26.6.25/shotcut-win64-26.6.25.zip/download" "%P_Dir%\Shotcut_Portable.zip" & goto PostOpt)
:Opt_720 (call :DirectDL "https://code.visualstudio.com/sha/download?build=stable^&os=win32-x64-archive" "%P_Dir%\VSCode_x64.zip" & goto PostOpt)
:Opt_721 (call :DirectDL "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.9.7/npp.8.9.7.portable.x64.7z" "%P_Dir%\NotepadPP_Portable.7z" & goto PostOpt)
:Opt_722 (call :DirectDL "https://github.com/git-for-windows/git/releases/download/v2.55.0.windows.3/Git-2.55.0.3-64-bit.exe" "%P_Dir%\Git_Setup.exe" & goto PostOpt)
:Opt_723 (call :DirectDL "https://www.python.org/ftp/python/3.14.6/python-3.14.6-amd64.exe" "%P_Dir%\Python_3.14.exe" & goto PostOpt)
:Opt_724 (call :DirectDL "https://downloads.sourceforge.net/winmerge/winmerge-2.16.56.2-x64-exe.zip" "%P_Dir%\WinMerge_Portable.zip" & goto PostOpt)
:Opt_730 (call :DirectDL "https://webinstallers.gog-statics.com/download/GOG_Galaxy_2.0.exe" "%P_Dir%\GOG_Galaxy_Setup.exe" & goto PostOpt)
:Opt_731 (call :DirectDL "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.exe" "%P_Dir%\EpicGames_Setup.exe" & goto PostOpt)
:Opt_732 (call :DirectDL "https://zoom.us/client/7.1.0.41345/ZoomInstallerFull.msi?archType=x64" "%P_Dir%\Zoom_Setup.msi" & goto PostOpt)
:Opt_733 (call :DirectDL "https://get.microsoft.com/installer/download/9NKSQGP7F2NH?cid=website_cta_psi" "%P_Dir%\WhatsApp_Setup.exe" & goto PostOpt)
:Opt_740 (call :DirectDL "https://www.wireshark.org/download/win64/Wireshark-latest-x64.exe" "%P_Dir%\Wireshark_Setup.exe" & goto PostOpt)
:Opt_741 (call :DirectDL "https://nmap.org/dist/nmap-7.99-setup.exe" "%P_Dir%\Nmap_Setup.exe" & goto PostOpt)
:Opt_742 (call :DirectDL "https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.84-installer.msi" "%P_Dir%\PuTTY_Setup.msi" & goto PostOpt)
:Opt_743 (call :DirectDL "https://download.filezilla-project.org/client/FileZilla_3.70.6_win64_sponsored2-setup.exe" "%P_Dir%\FileZilla_Setup.exe" & goto PostOpt)
:Opt_744 (call :DirectDL "https://download.advanced-ip-scanner.com/download/files/Advanced_IP_Scanner_2.5.4594.1.exe" "%P_Dir%\Advanced_IP_Scanner.exe" & goto PostOpt)
:Opt_750 (call :DirectDL "https://downloads.malwarebytes.com/file/mb-windows?filename=MBSetup-3.3.exe" "%P_Dir%\Malwarebytes_Setup.exe" & goto PostOpt)
:Opt_751 (call :DirectDL "https://privazer.com/en/PrivaZer.exe" "%P_Dir%\PrivaZer.exe" & goto PostOpt)
:Opt_752 (call :DirectDL "https://www.glarysoft.com/aff/download2.php?s=GU" "%P_Dir%\GlaryUtilities_Setup.exe" & goto PostOpt)
:Opt_753 (call :DirectDL "https://download.internetdownloadmanager.com/idman643build5.exe" "%P_Dir%\IDM_Setup.exe" & goto PostOpt)
:Opt_754 (call :DirectDL "https://launchpad.net/veracrypt/trunk/1.26.29/+download/VeraCrypt%%20Portable%%201.26.29.exe" "%P_Dir%\VeraCrypt_Portable.exe" & goto PostOpt)
:Opt_760 (call :DirectDL "https://www.poweriso.com/PowerISO9-x64.exe" "%P_Dir%\PowerISO_x64.exe" & goto PostOpt)
:Opt_761 (call :DirectDL "https://github.com/pbatard/rufus/releases/download/v4.15/rufus-4.15p.exe" "%P_Dir%\Rufus_4.15.exe" & goto PostOpt)
:Opt_762 (call :DirectDL "https://download.imgburn.com/SetupImgBurn_2.5.8.0.exe" "%P_Dir%\ImgBurn_Setup.exe" & goto PostOpt)
:Opt_763 (call :DirectDL "https://www.anyburn.com/anyburn_setup.exe" "%P_Dir%\AnyBurn_Setup.exe" & goto PostOpt)
:Opt_764 (call :DirectDL "http://download.pcfreetime.com/FFSetup5.22.0.0.exe" "%P_Dir%\FormatFactory_Setup.exe" & goto PostOpt)

:: ============================================
:: DOWNLOAD ENGINE (PS-NATIVE COMPRESSED)
:: ============================================
:DirectDL
set "dUrl=%~1" & set "dOut=%~2"
if "%dUrl:~0,4%" NEQ "http" set "dUrl=https://%dUrl%"
echo [SYNC] Source: %dUrl%
echo [DEST] Target: %dOut%

powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='Continue'; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 -bor [Net.SecurityProtocolType]::Tls13; try { Invoke-WebRequest -Uri '%dUrl%' -OutFile '%dOut%' -UserAgent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)' -MaximumRedirection 10; if (Test-Path '%dOut%') { exit 0 } else { exit 1 } } catch { exit 1 }"

if %errorlevel% EQU 0 (
    if exist "%dOut%" (
        for %%A in ("%dOut%") do (
            if %%~zA LSS 10240 (
                echo [!] Error: Target is a landing page or dead. Deleting.
                del /f /q "%dOut%"
                timeout /t 3 >nul & exit /b 1
            )
        )
        echo. & echo [OK] Download Successful: %dOut%
        timeout /t 2 >nul & exit /b 0
    )
)
echo. & echo [-] Error: Engine failed to fetch the file. Link likely Dead.
pause & exit /b 1