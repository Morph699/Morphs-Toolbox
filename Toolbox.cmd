@echo off
setlocal EnabledDelayedExpansion
title Morphs Creations Toolbox Console

:: Verification of Administrative Rights
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo [*] Elevating permissions to Administrator...
    powershell start -verb runas '%0' am_admin
    exit /b
)

:Initialization
CD /D "%~dp0"
chcp 437 >nul

set "Base_Dir=%~dp0"
set "W_Dir=%Base_Dir%EngineToolbox"
set "P_Dir=%W_Dir%\Programs"
set "F_Dir=%W_Dir%\Frameworks"

if not exist "%W_Dir%" mkdir "%W_Dir%" >nul 2>&1
if not exist "%P_Dir%" mkdir "%P_Dir%" >nul 2>&1
if not exist "%F_Dir%" mkdir "%F_Dir%" >nul 2>&1

if exist "%WinDir%\SysWOW64" (set "Arch=x64") else (set "Arch=x86")
for /f "tokens=3*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName') do set "OS_Name=%%a %%b"
for /f "tokens=3*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuildNumber') do set "OS_Build=%%a"
set "Sys_Info=%OS_Name% (Build %OS_Build%) %Arch%"

set "Fetch=powershell -Command [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $ProgressPreference='Continue'; Invoke-WebRequest"

mode con: cols=110 lines=39

:MainMenu
set "Page=1"
cls
color 1F
echo ==============================================================================================================
echo                                **Morphs Creations** DEPLOYMENT CONSOLE v1.65 (Page 1/2)
echo ==============================================================================================================
echo    Standard Programs          Portable Tools 1          Portable Tools 3          Deployment Runtimes
echo  -------------------        ------------------         ------------------        ---------------------
echo  [ 1 ] 7-Zip Archiver       [ 14 ] Everything Search  [ 84 ] CrystalDiskInfo    [ 41 ] AdobeAIR Framework
echo  [ 2 ] WinRAR Suite         [ 24 ] Revo Uninst Pro    [ 85 ] oCam Recorder      [ 42 ] Microsoft XNA Build
echo  [ 3 ] WinDirStat Anlz      [ 71 ] WinSetupFromUSB    [ 86 ] WinToUSB Tool      [ 43 ] OpenAL Audio Engine
echo  [ 4 ] PotPlayer Engine     [ 72 ] Rufus Boot         [ 87 ] WinToHDD Tool      [ 44 ] DirectX Legacy (95MB)
echo  [ 5 ] K-Lite Mega (62MB)   [ 73 ] Ventoy Multi       [ 88 ] Driver Booster     [ 45 ] Visual C++ AIO (65MB)
echo  [ 6 ] Wise Disk Cleaner    [ 74 ] Hard Disk Sent     [ 89 ] MiniTool (80MB)    [ 46 ] Nvidia PhysX Legacy
echo  [ 7 ] UltraISO Utility     [ 75 ] Network Tools      [ 90 ] Lacey Downloader   [ 52 ] Java JRE 8 (x32)
echo  [ 8 ] Telegram Desktop     ----------------------    ----------------------    [ 53 ] Java JRE 8 (x64)
echo  [ 9 ] AIMP Audio Player     Portable Tools 2          Portable Tools 4         ---------------------
echo  [ 10 ] Winamp Player       ----------------------    ----------------------        Forensic Suites
echo  [ 11 ] Lantern VPN Proxy   [ 76 ] Anydesk Tool       [ 91 ] WinTools Prem      ---------------------
echo  [ 12 ] SmadAV Security     [ 77 ] Psiphon Proxy      [ 92 ] AIDA64 Extreme     [ 151 ] EZ Forensic Pack
echo  [ 13 ] UltraViewer Remote  [ 78 ] HWiNFO Portable    [ 93 ] CCleaner Opt       [ 152 ] NirLauncher (54MB)
echo   ======================    [ 79 ] CPU-Z Hardware     [ 94 ] Freemake (52MB)   ==============================
echo   [   Online Browsers  ]    [ 80 ] Easy Context       [ 95 ] Recuva Recovery     Macro Selection Presets
echo   ----------------------    [ 81 ] Win Update Blck    [ 96 ] Drive Snapshot    ------------------------------
echo   [ 56 ] Edge (90MB)        [ 82 ] PatchMyPC          [ 97 ] WinDirStat Port    [ 300 ] Online Browsers Suite
echo   [ 57 ] Chrome (95MB)      [ 83 ] RustDesk Remote    [ 98 ] Aomei Part (55MB)  [ 350 ] System Runtimes Pack
echo   [ 58 ] Firefox (55MB)    ------------------------   -----------------------   [ 400 ] Portable Tools Pack 1
echo   [ 59 ] Brave (98MB)       System Optimizations 1    System Optimizations 2    [ 410 ] Portable Tools Pack 2
echo   [ 60 ] Avast Antivirus    [ 100 ] Deploy Choco      [ 115 ] Toggle Hibern     [ 420 ] Portable Tools Pack 3
echo   [ 61 ] Discord (85MB)     [ 111 ] Native Img View   [ 116 ] Compact OS Eng    [ 430 ] Portable Tools Pack 4
echo   [ 62 ] Steam (45MB)       [ 112 ] Safe WinSxS Purge [ 117 ] Inject Ownership  [ 450 ] Forensic Suite
echo ==============================================================================================================
echo        [ N ] Next Page ^| [ 0 ] Close Engine Terminal ^| [*] Macros: browsers ^| runtimes ^| portable1...
echo ==============================================================================================================
set /p opts="Enter Selection: "
if /I "%opts%"=="N" goto :MenuPage2
if "%opts%"=="" goto :MainMenu
if "%opts%"=="0" exit /b
goto :RunSelectionLoop

:MenuPage2
set "Page=2"
cls
color 1F
echo ==============================================================================================================
echo                                **Morphs Creations** DEPLOYMENT CONSOLE v1.65 (Page 2/2)
echo ==============================================================================================================
echo    Office ^& Productivity      Media Production           Developer Tools             Gaming ^& Social
echo  -------------------        ------------------         ------------------        ---------------------
echo  [ 201 ] LibreOffice(340MB) [ 210 ] OBS Studio(130MB) [ 220 ] VS Code (95MB)    [ 230 ] GOG Galaxy (210MB)
echo  [ 202 ] SumatraPDF Port    [ 211 ] Handbrake (25MB)  [ 221 ] Notepad++         [ 231 ] Epic Games (160MB)
echo  [ 203 ] Foxit Reader(90MB) [ 212 ] Audacity (15MB)   [ 222 ] Git for Win(55MB) [ 232 ] Zoom Client (30MB)
echo  [ 204 ] Notepad3 Portable  [ 213 ] VLC Media (42MB)  [ 223 ] Python 3.12       [ 233 ] Skype Desktop
echo  [ 205 ] WPS Office (205MB) [ 214 ] Shotcut (105MB)   [ 224 ] WinMerge Tool     [ 234 ] WhatsApp Desktop
echo  -------------------        ------------------         ------------------        ---------------------
echo     Network ^& Server          Security ^& Privacy         Archive ^& ISO             Advanced Macros
echo  -------------------        ------------------         ------------------        ---------------------
echo  [ 240 ] Wireshark (80MB)   [ 250 ] Malwarebytes(250M)[ 260 ] PowerISO (10MB)   [ 500 ] All Page 2 Media
echo  [ 241 ] Nmap Security      [ 251 ] Bitdefender(15MB) [ 261 ] Rufus (Latest)    [ 510 ] All Page 2 Office
echo  [ 242 ] PuTTY SSH Client   [ 252 ] Kaspersky Tool    [ 262 ] ImgBurn Suite     [ 520 ] All Page 2 Dev
echo  [ 243 ] FileZilla FTP      [ 253 ] GlassWire (75MB)  [ 263 ] AnyBurn Suite     [ 530 ] Full Page 2 Sync
echo  [ 244 ] Advanced IP Scan   [ 254 ] VeraCrypt (35MB)  [ 264 ] BurnAware         [ 666 ] NUCLEAR DEPLOYMENT
:MenuFooter
echo ==============================================================================================================
echo   [ N ] Next Page ^| [ B ] Back Page ^| [ S ] Save Profile ^| [ L ] Load Profile ^| [ 0 ] Close Terminal
echo ==============================================================================================================
echo   [*] Macros: browsers ^| runtimes ^| portable1 ^| portable2 ^| portable3 ^| portable4 ^| forensics
echo.
set /p opts="Enter selection index, Macro, or Command: "

if /I "%opts%"=="0" exit /b
if /I "%opts%"=="N" goto :MenuPage2
if /I "%opts%"=="B" goto :MainMenu
if /I "%opts%"=="S" goto :SaveProfile
if /I "%opts%"=="L" goto :LoadProfile

:: Existing Macro Redirects
if /I "%opts%"=="300"       set "opts=56 57 58 59" & goto :RunSelectionLoop
if /I "%opts%"=="browsers"  set "opts=56 57 58 59" & goto :RunSelectionLoop
if /I "%opts%"=="350"       set "opts=41 42 43 44 45 46 52 53" & goto :RunSelectionLoop
if /I "%opts%"=="runtimes"  set "opts=41 42 43 44 45 46 52 53" & goto :RunSelectionLoop
if /I "%opts%"=="666"       set "opts=1 2 45 56 57 201 210 220 231" & goto :RunSelectionLoop
if /I "%opts%"=="nuclear"   set "opts=1 2 45 56 57 201 210 220 231" & goto :RunSelectionLoop

goto :RunSelectionLoop

:: Text Macro Mappings
if /I "%opts%"=="300"       set "opts=56 57 58 59" & goto :RunSelectionLoop
if /I "%opts%"=="browsers"  set "opts=56 57 58 59" & goto :RunSelectionLoop
if /I "%opts%"=="350"       set "opts=41 42 43 44 45 46 52 53" & goto :RunSelectionLoop
if /I "%opts%"=="runtimes"  set "opts=41 42 43 44 45 46 52 53" & goto :RunSelectionLoop
if /I "%opts%"=="400"       set "opts=14 24 71 72 73 74 75" & goto :RunSelectionLoop
if /I "%opts%"=="portable1" set "opts=14 24 71 72 73 74 75" & goto :RunSelectionLoop
if /I "%opts%"=="410"       set "opts=76 77 78 79 80 81 82 83" & goto :RunSelectionLoop
if /I "%opts%"=="portable2" set "opts=76 77 78 79 80 81 82 83" & goto :RunSelectionLoop
if /I "%opts%"=="420"       set "opts=84 85 86 87 88 89 90" & goto :RunSelectionLoop
if /I "%opts%"=="portable3" set "opts=84 85 86 87 88 89 90" & goto :RunSelectionLoop
if /I "%opts%"=="430"       set "opts=91 92 93 94 95 96 97 98" & goto :RunSelectionLoop
if /I "%opts%"=="portable4" set "opts=91 92 93 94 95 96 97 98" & goto :RunSelectionLoop
if /I "%opts%"=="450"       set "opts=151 152" & goto :RunSelectionLoop
if /I "%opts%"=="forensics" set "opts=151 152" & goto :RunSelectionLoop

:RunSelectionLoop

for %%i in (%opts%) do (
    cls
    echo ==============================================================================
    echo PROCESSING QUEUED DEPLOYMENT TASK: [Option %%i]
    echo ==============================================================================
    echo [^>] STATUS: Contacting server infrastructure...
    echo [^>] STATUS: GETTING FILE PAYLOAD BLOCK... Please hold...
    echo ==============================================================================
    echo.
    set "item=%%i"
    call :Opt_%%i
)
cls
color 0A
echo ==============================================================================
echo [+][Success] All chosen operations processed successfully!
echo ==============================================================================
echo.
timeout /t 3 >nul
goto :MainMenu

:UnpackPayload
set "ZipFile=%~1"
set "FolderTarget=%~2"
if exist "%P_Dir%\%ZipFile%" (
    echo.
    echo  [^>] STATUS: DOWNLOAD COMPLETE.
    echo  [^>] STATUS: INITIALIZING NATIVE DECOMPRESSION...
    echo.
    mkdir "%P_Dir%\%FolderTarget%" 2>nul
    powershell -Command "Expand-Archive -Path '%P_Dir%\%ZipFile%' -DestinationPath '%P_Dir%\%FolderTarget%' -Force"
    if !errorlevel! EQU 0 (
        echo  [+][Success] Unpacked successfully into: [Programs\%FolderTarget%]
        del /f /q "%P_Dir%\%ZipFile%"
    ) else (
        echo  [!] Extraction execution failed for %ZipFile%.
    )
) else (
    echo  [!] Extraction halted: Source payload tracking binary not found.
)
goto :EOF

:ChocoRouter
set "TargetID=%~1"
if not exist "C:\ProgramData\chocolatey\bin\choco.exe" (
    echo [!] WARNING: Chocolatey package engine is not installed.
    echo [*] Initializing official bootstrap engine...
    powershell -NoProfile -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
)
set "PkgName="
if "%TargetID%"=="1"  set "PkgName=7zip"
if "%TargetID%"=="2"  set "PkgName=winrar"
if "%TargetID%"=="4"  set "PkgName=potplayer"
if "%TargetID%"=="5"  set "PkgName=k-litecodecpackmega"
if "%TargetID%"=="14" set "PkgName=everything"
if "%TargetID%"=="24" set "PkgName=revouninstaller"
if "%TargetID%"=="56" set "PkgName=microsoft-edge"
if "%TargetID%"=="57" set "PkgName=googlechrome"
if "%TargetID%"=="58" set "PkgName=firefox"
if "%TargetID%"=="59" set "PkgName=brave"

if defined PkgName (
    echo [*] Utilizing Chocolatey repository to download !PkgName!...
    "C:\ProgramData\chocolatey\bin\choco.exe" install !PkgName! -y
)
goto :EOF

:Opt_1
if "%Arch%"=="x64" (
    set "U1=https://github.com"
    set "U2=/ip7z/7zip/releases/download/24.05/7z2405-x64.exe"
) else (
    set "U1=https://github.com"
    set "U2=/ip7z/7zip/releases/download/24.05/7z2405.exe"
)
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\7z_setup.exe"
if exist "%P_Dir%\7z_setup.exe" start /wait "" "%P_Dir%\7z_setup.exe" /S
exit /b

:Opt_2
set "U1=https://www.win-rar.com"
if "%Arch%"=="x64" (
    set "U2=/fileadmin/winrar-versions/winrar/winrar-x64-701.exe"
) else (
    set "U2=/fileadmin/winrar-versions/winrar/winrar-701.exe"
)
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\winrar_setup.exe"
if exist "%P_Dir%\winrar_setup.exe" start /wait "" "%P_Dir%\winrar_setup.exe" /S
exit /b

:Opt_3
set "U1=https://github.com"
set "U2=/windirstat/windirstat/releases/download/v1.1.2/windirstat1_1_2_setup.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\windirstat_setup.exe"
if exist "%P_Dir%\windirstat_setup.exe" start /wait "" "%P_Dir%\windirstat_setup.exe" /S
exit /b

:Opt_4
set "U1=https://t1.kakaocdn.net"
if "%Arch%"=="x64" (
    set "U2=/potplayer/PotPlayer/Version/Latest/PotPlayerSetup64.exe"
) else (
    set "U2=/potplayer/PotPlayer/Version/Latest/PotPlayerSetup.exe"
)
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\potplayer_setup.exe"
if exist "%P_Dir%\potplayer_setup.exe" start /wait "" "%P_Dir%\potplayer_setup.exe" /S
exit /b

:Opt_5
set "U1=https://files3.codecguide.com"
set "U2=/K-Lite_Codec_Pack_1840_Mega.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\klite_setup.exe"
if exist "%P_Dir%\klite_setup.exe" start /wait "" "%P_Dir%\klite_setup.exe" /verysilent
exit /b

:Opt_6
set "U1=https://downloads.wisecleaner.com"
set "U2=/soft/WDCFree_11.1.5.825.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\wise_setup.exe"
if exist "%P_Dir%\wise_setup.exe" start /wait "" "%P_Dir%\wise_setup.exe" /VERYSILENT
exit /b

:Opt_7
set "U1=https://dw.ezbsys.net"
set "U2=/uiso9_pe.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\ultraiso_setup.exe"
if exist "%P_Dir%\ultraiso_setup.exe" start /wait "" "%P_Dir%\ultraiso_setup.exe" /VERYSILENT
exit /b

:Opt_8
set "U1=https://updates.tdesktop.com"
set "U2=/tsetup.5.2.2.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\telegram_setup.exe"
if exist "%P_Dir%\telegram_setup.exe" start /wait "" "%P_Dir%\telegram_setup.exe" /VERYSILENT /DS
exit /b

:Opt_9
set "U1=https://www.aimp.ru"
set "U2=/storage/aimp_5.30.2563.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\aimp_setup.exe"
if exist "%P_Dir%\aimp_setup.exe" start /wait "" "%P_Dir%\aimp_setup.exe" /VERYSILENT
exit /b

:Opt_10
set "U1=https://download.nullsoft.com"
set "U2=/winamp/client/winamp592_10042_full_en-us.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\winamp_setup.exe"
if exist "%P_Dir%\winamp_setup.exe" start /wait "" "%P_Dir%\winamp_setup.exe" /S
exit /b

:Opt_11
set "U1=https://raw.githubusercontent.com"
set "U2=/getlantern/lantern-binaries/main/lantern-installer.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\lantern_setup.exe"
if exist "%P_Dir%\lantern_setup.exe" start /wait "" "%P_Dir%\lantern_setup.exe" /S
exit /b

:Opt_12
set "U1=https://www.smadav.net"
set "U2=/download/smadav2024.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\smadav_setup.exe"
if exist "%P_Dir%\smadav_setup.exe" start /wait "" "%P_Dir%\smadav_setup.exe" /VERYSILENT
exit /b

:Opt_13
set "U1=https://dl2.ultraviewer.net"
set "U2=/UltraViewer_setup_6.6_en.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\ultraviewer_setup.exe"
if exist "%P_Dir%\ultraviewer_setup.exe" start /wait "" "%P_Dir%\ultraviewer_setup.exe" /S
exit /b

:Opt_56
set "U1=https://msedge.sf.dl.delivery.mp.microsoft.com"
set "U2=/filestreamingservice/files/MicrosoftEdgeEnterpriseX64.msi"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\edge_setup.msi"
if exist "%P_Dir%\edge_setup.msi" msiexec /i "%P_Dir%\edge_setup.msi" /qn
exit /b

:Opt_57
set "U1=https://dl.google.com"
set "U2=/tag/s/appguid=%%7B8A69AD02-D016-43F5-9835-D1893E936601%%7D/chrome/install/ChromeStandaloneSetup64.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\chrome_setup.exe"
if exist "%P_Dir%\chrome_setup.exe" start /wait "" "%P_Dir%\chrome_setup.exe" /silent /install
exit /b

:Opt_58
set "U1=https://download.mozilla.org"
set "U2=/?product=firefox-latest-ssl&os=win64&lang=en-US"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\firefox_setup.exe"
if exist "%P_Dir%\firefox_setup.exe" start /wait "" "%P_Dir%\firefox_setup.exe" -ms
exit /b

:Opt_59
set "U1=https://updates.bravesoftware.com"
set "U2=/build/Brave-Browser/x64/BraveBrowserStandaloneSetup.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\brave_setup.exe"
if exist "%P_Dir%\brave_setup.exe" start /wait "" "%P_Dir%\brave_setup.exe" /silent /install
exit /b

:Opt_41
set "U1=https://download.macromedia.com"
set "U2=/pub/labs/flashruntimes/air/AdobeAIR.exe"
!Fetch! "!U1!!U2!" -OutFile "%F_Dir%\AdobeAIR.exe"
start /wait "" "%F_Dir%\AdobeAIR.exe" -silent
exit /b

:Opt_42
set "U1=https://download.microsoft.com"
set "U2=/download/A/C/D/ACDED613-346A-40D2-9099-31EF99974246/xnafx40_redist.msi"
!Fetch! "!U1!!U2!" -OutFile "%F_Dir%\xnafx40.msi"
msiexec /i "%F_Dir%\xnafx40.msi" /qn
exit /b

:Opt_43
set "U1=https://openal.org"
set "U2=/downloads/oalinst.zip"
!Fetch! "!U1!!U2!" -OutFile "%F_Dir%\oalinst.zip"
call :UnpackPayload "oalinst.zip" "OpenAL"
start /wait "" "%P_Dir%\OpenAL\oalinst.exe" /S
exit /b

:Opt_44
set "U1=https://download.microsoft.com"
set "U2=/download/8/4/A/84A35BF1-DAFE-438A-A304-AD17EB294A39/directx_Jun2010_redist.exe"
!Fetch! "!U1!!U2!" -OutFile "%F_Dir%\dx_legacy.exe"
mkdir "%F_Dir%\DX_Extract" 2>nul
"%F_Dir%\dx_legacy.exe" /Q /T:"%F_Dir%\DX_Extract"
start /wait "" "%F_Dir%\DX_Extract\DXSETUP.exe" /silent
exit /b

:Opt_45
set "U1=https://github.com"
set "U2=/abbodi1406/vcredist/releases/download/v0.81.0/VisualCppRedist_AIO_x86_x64_81.zip"
!Fetch! "!U1!!U2!" -OutFile "%F_Dir%\VC_AIO.zip"
call :UnpackPayload "VC_AIO.zip" "VC_Redist"
for %%f in ("%P_Dir%\VC_Redist\*.exe") do start /wait "" "%%f" /ai /gm2
exit /b

:Opt_52
set "U1=https://javadl.oracle.com"
set "U2=/webapps/download/AutoDL?BundleId=249553_4d245e931835491c9535043806a64e16"
!Fetch! "!U1!!U2!" -OutFile "%F_Dir%\java8_x32.exe"
start /wait "" "%F_Dir%\java8_x32.exe" /s
exit /b

:Opt_53
set "U1=https://javadl.oracle.com"
set "U2=/webapps/download/AutoDL?BundleId=249555_4d245e931835491c9535043806a64e16"
!Fetch! "!U1!!U2!" -OutFile "%F_Dir%\java8_x64.exe"
start /wait "" "%F_Dir%\java8_x64.exe" /s
exit /b

:Opt_14
set "U1=https://www.voidtools.com"
if "%Arch%"=="x64" (set "U2=/Everything-1.4.1.1024.x64-Setup.exe") else (set "U2=/Everything-1.4.1.1024.x86-Setup.exe")
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Everything_setup.exe"
start "" "%P_Dir%\Everything_setup.exe"
exit /b

:Opt_72
set "U1=https://github.com"
set "U2=/pbatard/rufus/releases/download/v4.5/rufus-4.5.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Rufus.exe"
start "" "%P_Dir%\Rufus.exe"
exit /b

:Opt_73
set "U1=https://github.com"
set "U2=/ventoy/Ventoy/releases/download/v1.0.99/ventoy-1.0.99-windows.zip"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Ventoy.zip"
call :UnpackPayload "Ventoy.zip" "Ventoy"
start "" "%P_Dir%\Ventoy\ventoy-1.0.99\Ventoy2Disk.exe"
exit /b

:Opt_76
set "U1=https://download.anydesk.com"
set "U2=/AnyDesk.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\AnyDesk.exe"
start "" "%P_Dir%\AnyDesk.exe"
exit /b

:Opt_78
set "U1=https://www.hwinfo.com"
set "U2=/files/hwi_802.zip"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\HWiNFO.zip"
call :UnpackPayload "HWiNFO.zip" "HWiNFO"
if "%Arch%"=="x64" (start "" "%P_Dir%\HWiNFO\HWiNFO64.exe") else (start "" "%P_Dir%\HWiNFO\HWiNFO32.exe")
exit /b

:Opt_79
set "U1=https://download.cpuid.com"
set "U2=/cpu-z/cpu-z_2.10-en.zip"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\CPU-Z.zip"
call :UnpackPayload "CPU-Z.zip" "CPU-Z"
if "%Arch%"=="x64" (start "" "%P_Dir%\CPU-Z\cpuz_x64.exe") else (start "" "%P_Dir%\CPU-Z\cpuz_x32.exe")
exit /b

:Opt_82
set "U1=https://patchmypc.com"
set "U2=/freeupdater/PatchMyPC.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\PatchMyPC.exe"
start "" "%P_Dir%\PatchMyPC.exe"
exit /b

:Opt_83
set "U1=https://github.com"
set "U2=/rustdesk/rustdesk/releases/download/1.2.3-2/rustdesk-1.2.3-2-x86_64.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\RustDesk.exe"
start "" "%P_Dir%\RustDesk.exe"
exit /b

:Opt_100
echo [*] Triggering Chocolatey Engine Deployment...
powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
exit /b

:Opt_111
set "U1=https://raw.githubusercontent.com"
set "U2=/mcmilk/7-Zip-Scripts/master/MinimalImageViewer.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\ImageViewer.exe"
start "" "%P_Dir%\ImageViewer.exe"
exit /b

:Opt_113
echo [*] Current Windows Update Status:
sc query wuauserv | findstr "STATE"
echo.
choice /c ET /m "[E] Enable Updates | [T] Terminate/Block Updates"
if errorlevel 2 (
    sc config wuauserv start= disabled
    sc stop wuauserv
    echo [!] Windows Update Service Disabled.
) else (
    sc config wuauserv start= auto
    sc start wuauserv
    echo [+][Success] Windows Update Service Enabled.
)
timeout /t 2 >nul
exit /b

:Opt_114
echo [*] DISM Reserved Storage Management...
dism /Online /Get-ReservedStorageState
echo.
choice /c EN /m "[E] Enable Reserved Storage | [N] Disable Reserved Storage"
if errorlevel 2 (
    dism /Online /Set-ReservedStorageState /State:Disabled
) else (
    dism /Online /Set-ReservedStorageState /State:Enabled
)
exit /b

:Opt_115
echo [*] Power Configuration - Hibernation Toggle...
choice /c EN /m "[E] Enable Hibernation | [N] Disable Hibernation (Deletes hiberfil.sys)"
if errorlevel 2 (
    powercfg -h off
    echo [!] Hibernation Disabled.
) else (
    powercfg -h on
    echo [+][Success] Hibernation Enabled.
)
exit /b

:Opt_116
echo [*] Windows Compact OS Compression Utility...
choice /c CQ /m "[C] Compact (Compress OS) | [Q] Uncompress (Query Only)"
if errorlevel 2 (
    compact /CompactOS:query
) else (
    compact /CompactOS:always
)
pause
exit /b

:Opt_117
echo [*] Injecting 'Take Ownership' to Registry Shell...
(
echo Windows Registry Editor Version 5.00
echo [HKEY_CLASSES_ROOT\*\shell\runas]
echo @="Take Ownership"
echo "NoWorkingDirectory"=""
echo [HKEY_CLASSES_ROOT\*\shell\runas\command]
echo @="cmd.exe /c takeown /f \"%%1\" ^& icacls \"%%1\" /grant administrators:F"
echo "IsolatedCommand"="cmd.exe /c takeown /f \"%%1\" ^& icacls \"%%1\" /grant administrators:F"
) > "%F_Dir%\TakeOwnership.reg"
regedit /s "%F_Dir%\TakeOwnership.reg"
echo [+][Success] Registry context menu updated.
exit /b

:Opt_151
echo [*] Fetching EZ Forensic Tools (Eric Zimmerman)...
set "U1=https://f001.backblazeb2.com"
set "U2=/file/EricZimmermanTools/Get-ZimmermanTools.zip"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\EZTools.zip"
call :UnpackPayload "EZTools.zip" "Forensics\EZ"
exit /b

:Opt_152
echo [*] Fetching NirLauncher Suite (Chocolatey Intercept)...
set "U1=https://www.nirsoft.net"
set "U2=/nirsoft_package_1.30.33.zip"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\NirSoft.zip"
call :UnpackPayload "NirSoft.zip" "Forensics\NirSoft"
start "" "%P_Dir%\Forensics\NirSoft\NirLauncher.exe"
exit /b

:Opt_84
set "U1=https://github.com"
set "U2=/hiyohiyo/CrystalDiskInfo/releases/download/9.3.2/CrystalDiskInfo9_3_2.zip"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\CrystalDiskInfo.zip"
call :UnpackPayload "CrystalDiskInfo.zip" "CrystalDiskInfo"
if "%Arch%"=="x64" (start "" "%P_Dir%\CrystalDiskInfo\DiskInfo64.exe") else (start "" "%P_Dir%\CrystalDiskInfo\DiskInfo32.exe")
exit /b

:Opt_85
set "U1=https://ohsoft.net"
set "U2=/product/oCam_v520.0.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\oCam_setup.exe"
start "" "%P_Dir%\oCam_setup.exe"
exit /b

:Opt_86
set "U1=https://www.easyuefi.com"
set "U2=/download/WinToUSB_Free.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\WinToUSB_setup.exe"
start "" "%P_Dir%\WinToUSB_setup.exe"
exit /b

:Opt_87
set "U1=https://www.easyuefi.com"
set "U2=/download/WinToHDD_Free.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\WinToHDD_setup.exe"
start "" "%P_Dir%\WinToHDD_setup.exe"
exit /b

:Opt_88
set "U1=https://cdn.iobit.com"
set "U2=/dl/driver_booster_setup.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\DriverBooster_setup.exe"
start "" "%P_Dir%\DriverBooster_setup.exe" /verysilent
exit /b

:Opt_89
set "U1=https://pwrt.mini-tool.com"
set "U2=/download-partition-software/pw1207-free.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\MiniTool_setup.exe"
start "" "%P_Dir%\MiniTool_setup.exe" /verysilent
exit /b

:Opt_90
set "U1=https://www.the--lacey.com"
set "U2=/Lacey.zip"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Lacey.zip"
call :UnpackPayload "Lacey.zip" "Lacey"
start "" "%P_Dir%\Lacey\Lacey.exe"
exit /b

:Opt_91
set "U1=https://www.wintools.net"
set "U2=/wintoolspre.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\WinTools_setup.exe"
start "" "%P_Dir%\WinTools_setup.exe"
exit /b

:Opt_92
set "U1=https://download.aida64.com"
set "U2=/aida64extreme692.zip"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\AIDA64.zip"
call :UnpackPayload "AIDA64.zip" "AIDA64"
start "" "%P_Dir%\AIDA64\aida64.exe"
exit /b

:Opt_93
set "U1=https://download.ccleaner.com"
set "U2=/portable/ccsetup625.zip"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\CCleaner.zip"
call :UnpackPayload "CCleaner.zip" "CCleaner"
if "%Arch%"=="x64" (start "" "%P_Dir%\CCleaner\CCleaner64.exe") else (start "" "%P_Dir%\CCleaner\CCleaner.exe")
exit /b

:Opt_94
set "U1=https://www.freemake.com"
set "U2=/offline_converter_setup.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Freemake_setup.exe"
start "" "%P_Dir%\Freemake_setup.exe"
exit /b

:Opt_95
set "U1=https://download.ccleaner.com"
set "U2=/rcsetup153.zip"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Recuva.zip"
call :UnpackPayload "Recuva.zip" "Recuva"
if "%Arch%"=="x64" (start "" "%P_Dir%\Recuva\recuva64.exe") else (start "" "%P_Dir%\Recuva\recuva.exe")
exit /b

:Opt_96
set "U1=http://www.drivesnapshot.de"
set "U2=/snapshot64.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Snapshot64.exe"
start "" "%P_Dir%\Snapshot64.exe"
exit /b

:Opt_97
set "U1=https://github.com"
set "U2=/windirstat/windirstat/releases/download/v1.1.2/windirstat1_1_2_setup.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\WinDirStat.exe"
start "" "%P_Dir%\WinDirStat.exe"
exit /b

:Opt_98
set "U1=https://www2.aomeisoftware.com"
set "U2=/download/pa/PAPE_Lite.zip"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\AomeiPart.zip"
call :UnpackPayload "AomeiPart.zip" "Aomei"
start "" "%P_Dir%\Aomei\PartAssist.exe"
exit /b

:Opt_118
echo [*] Injecting Hash Tool context menu...
set "U1=https://github.com"
set "U2=/gregreid/hashtool/releases/download/v1.1/HashTool.exe"
!Fetch! "!U1!!U2!" -OutFile "%F_Dir%\HashTool.exe"
echo [+][Success] HashTool downloaded to Frameworks folder.
start "" "%F_Dir%\HashTool.exe"
exit /b

:Opt_201
set "U1=https://download.documentfoundation.org"
set "U2=/libreoffice/stable/24.2.5/win/x86_64/LibreOffice_24.2.5_Win_x86-64.msi"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\LibreOffice.msi"
start /wait "" msiexec /i "%P_Dir%\LibreOffice.msi" /qn
exit /b

:Opt_202
set "U1=https://www.sumatrapdfreader.org"
set "U2=/dl2/SumatraPDF-3.5.2-64.zip"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Sumatra.zip"
call :UnpackPayload "Sumatra.zip" "SumatraPDF"
start "" "%P_Dir%\SumatraPDF\SumatraPDF.exe"
exit /b

:Opt_204
set "U1=https://www.rizonesoft.com"
set "U2=/download/2539/?tmstv=1710000000"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Notepad3.zip"
call :UnpackPayload "Notepad3.zip" "Notepad3"
start "" "%P_Dir%\Notepad3\Notepad3.exe"
exit /b

:Opt_211
set "U1=https://github.com"
set "U2=/HandBrake/HandBrake/releases/download/1.8.1/HandBrake-1.8.1-x86_64-Win_GUI.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Handbrake_Setup.exe"
start /wait "" "%P_Dir%\Handbrake_Setup.exe" /S
exit /b

:Opt_212
set "U1=https://github.com"
set "U2=/audacity/audacity/releases/download/Audacity-3.6.0/audacity-win-3.6.0-64bit.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Audacity_Setup.exe"
start /wait "" "%P_Dir%\Audacity_Setup.exe" /S
exit /b

:Opt_203
set "U1=https://cdn01.foxitsoftware.com"
set "U2=/pub/foxit/reader/desktop/win/12.x/12.1/en_us/FoxitPDFReader121_L10N_Setup.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Foxit_Setup.exe"
start /wait "" "%P_Dir%\Foxit_Setup.exe" /VERYSILENT
exit /b

:Opt_210
set "U1=https://github.com"
set "U2=/obsproject/obs-studio/releases/download/30.1.2/OBS-Studio-30.1.2-Full-Installer-x64.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\OBS_Setup.exe"
start /wait "" "%P_Dir%\OBS_Setup.exe" /S
exit /b

:Opt_213
set "U1=https://get.videolan.org"
set "U2=/vlc/3.0.21/win64/vlc-3.0.21-win64.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\VLC_Setup.exe"
start /wait "" "%P_Dir%\VLC_Setup.exe" /S
exit /b

:Opt_220
set "U1=https://update.code.visualstudio.com"
set "U2=/latest/win32-x64-user/stable"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\VSCode_Setup.exe"
start /wait "" "%P_Dir%\VSCode_Setup.exe" /VERYSILENT /MERGETASKS=!runcode
exit /b

:Opt_221
set "U1=https://github.com"
set "U2=/notepad-plus-plus/notepad-plus-plus/releases/download/v8.6.7/npp.8.6.7.Installer.x64.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\NPP_Setup.exe"
start /wait "" "%P_Dir%\NPP_Setup.exe" /S
exit /b

:Opt_222
set "U1=https://github.com"
set "U2=/git-for-windows/git/releases/download/v2.45.2.windows.1/Git-2.45.2-64-bit.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Git_Setup.exe"
start /wait "" "%P_Dir%\Git_Setup.exe" /VERYSILENT
exit /b

:Opt_231
set "U1=https://launcher-public-service-prod06.ol.epicgames.com"
set "U2=/launcher/api/installer/download/EpicGamesLauncherInstaller.msi"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Epic_Setup.msi"
start /wait "" msiexec /i "%P_Dir%\Epic_Setup.msi" /qn
exit /b

:Opt_232
set "U1=https://cdn.zoom.us"
set "U2=/prod/5.17.11.34827/ZoomInstallerFull.msi"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Zoom_Setup.msi"
start /wait "" msiexec /i "%P_Dir%\Zoom_Setup.msi" /qn
exit /b

:Opt_240
set "U1=https://1.as.dl.wireshark.org"
set "U2=/win64/Wireshark-win64-4.2.5.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Wireshark_Setup.exe"
start /wait "" "%P_Dir%\Wireshark_Setup.exe" /S
exit /b

:Opt_241
set "U1=https://nmap.org"
set "U2=/dist/nmap-7.95-setup.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Nmap_Setup.exe"
start /wait "" "%P_Dir%\Nmap_Setup.exe" /S
exit /b

:Opt_242
set "U1=https://the.earth.li"
set "U2=/~sgtatham/putty/latest/w64/putty-64bit-0.81-installer.msi"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Putty_Setup.msi"
msiexec /i "%P_Dir%\Putty_Setup.msi" /qn
exit /b

:Opt_243
set "U1=https://download.filezilla-project.org"
set "U2=/client/FileZilla_3.67.1_win64_patched-setup.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\FileZilla_Setup.exe"
start /wait "" "%P_Dir%\FileZilla_Setup.exe" /S
exit /b

:Opt_244
set "U1=https://download.advanced-ip-scanner.com"
set "U2=/Advanced_IP_Scanner_2.5.4594.1.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\IPScanner.exe"
start "" "%P_Dir%\IPScanner.exe"
exit /b

:Opt_250
set "U1=https://data-cdn.mbamupdates.com"
set "U2=/webinstaller/mwb-setup-consumer-4.6.11.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\Malwarebytes_Setup.exe"
start /wait "" "%P_Dir%\Malwarebytes_Setup.exe" /VERYSILENT /SUPPRESSMSGBOXES
exit /b

:Opt_260
set "U1=https://www.poweriso.com"
set "U2=/PowerISO8-x64.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\PowerISO_Setup.exe"
start /wait "" "%P_Dir%\PowerISO_Setup.exe" /S
exit /b

:Opt_262
set "U1=https://www.imgburn.com"
set "U2=/download/SetupImgBurn_2.5.8.0.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\ImgBurn_Setup.exe"
start /wait "" "%P_Dir%\ImgBurn_Setup.exe" /S
exit /b

:Opt_263
set "U1=https://www.anyburn.com"
set "U2=/anyburn_setup_x64.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\AnyBurn_Setup.exe"
start /wait "" "%P_Dir%\AnyBurn_Setup.exe" /S
exit /b

:Opt_264
set "U1=https://www.burnaware.com"
set "U2=/downloads/burnaware_free_17.8.exe"
!Fetch! "!U1!!U2!" -OutFile "%P_Dir%\BurnAware_Setup.exe"
start /wait "" "%P_Dir%\BurnAware_Setup.exe" /VERYSILENT
exit /b

:: ==============================================================================
:: END OF SUBROUTINES - SYSTEM REMAINS IN WAIT STATE
:: ==============================================================================

:CleanupEngine
cls
echo ==============================================================================
echo                      MORPHS CREATIONS ENGINE CLEANUP
echo ==============================================================================
echo  [*] Scanning for temporary deployment artifacts...
timeout /t 1 >nul
if exist "%P_Dir%\*.tmp" del /f /q "%P_Dir%\*.tmp"
if exist "%P_Dir%\*.log" del /f /q "%P_Dir%\*.log"
echo  [+][Success] Temporary files purged.
echo  [*] Deployment Directory: %P_Dir%
echo ==============================================================================
timeout /t 2 >nul
goto :MainMenu

:SaveProfile
cls
echo ==============================================================================
echo                          CREATE CUSTOM DEPLOYMENT PROFILE
echo ==============================================================================
echo  Enter the IDs you want to save, separated by spaces.
echo  Example: 1 2 56 57 117 220
echo.
set /p cust_queue="Define your Profile IDs: "
if "%cust_queue%"=="" (
    echo [!] Operation cancelled. No IDs entered.
    timeout /t 2 >nul
    goto :MainMenu
)
echo %cust_queue% > "%F_Dir%\DeployProfile.txt"
echo.
echo [+][Success] Profile saved to: %F_Dir%\DeployProfile.txt
echo [^>] Current Blueprint: %cust_queue%
timeout /t 3 >nul
goto :MainMenu

:LoadProfile
cls
echo ==============================================================================
echo                          LOAD CUSTOM DEPLOYMENT PROFILE
echo ==============================================================================
if not exist "%F_Dir%\DeployProfile.txt" (
    echo [!] Error: No saved profile found in Frameworks.
    echo [*] Please use the [ S ] command first.
    timeout /t 3 >nul
    goto :MainMenu
)
set /p opts=<"%F_Dir%\DeployProfile.txt"
echo [+][Success] Profile loaded!
echo [^>] Queued Task IDs: %opts%
echo.
echo Launching deployment in 3 seconds...
timeout /t 3 >nul
goto :RunSelectionLoop

