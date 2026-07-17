@echo off
setlocal EnabledDelayedExpansion

:: ==============================================================================
:: GLOBAL CONFIGURATION
:: ==============================================================================
set "Version=1.69"
set "Src_Dir=%SystemRoot%\Setup\FilesU"
:: ==============================================================================

set "FileName=%~nx0"
title Morphs Creations Toolbox Console %Version% [%FileName%]

:: Verification of Administrative Rights
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo [*] Elevating permissions to Administrator...
    powershell start -verb runas '%0' am_admin
    exit /b
)

cls
color 0A
chcp 65001 >nul
mode con:cols=80 lines=22
powershell -ExecutionPolicy Bypass -Command "$colors=@('Cyan','Green','Magenta','Yellow','White','DarkCyan'); $logo=@('        ßßß    ßßß   ßßßßßß   ßßßßßß   ßßßßßß   ßß   ßß  ßßßßßßß','        ßßßß  ßßßß  ßß    ßß  ßß   ßß  ßß   ßß  ßß   ßß  ßß     ','        ßß ßßßß ßß  ßß    ßß  ßßßßßß   ßßßßßß   ßßßßßßß  ßßßßßßß','        ßß  ßß  ßß  ßß    ßß  ßß   ßß  ßß       ßß   ßß       ßß','        ßß      ßß   ßßßßßß   ßß   ßß  ßß       ßß   ßß  ßßßßßßß',' ','   ßßßßßß  ßßßßßß  ßßßßßßß   ßßßßß  ßßßßßßßß  ßß  ßßßßßß  ßßß    ßß  ßßßßßßß','  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßßßß   ßß  ßß     ','  ßß       ßßßßßß  ßßßßßßß  ßßßßßßß    ßß     ßß ßß    ßß ßß ßß  ßß  ßßßßßßß','  ßß       ßß   ßß ßß       ßß   ßß    ßß     ßß ßß    ßß ßß  ßß ßß       ßß','   ßßßßßß  ßß   ßß ßßßßßßß  ßß   ßß    ßß     ßß  ßßßßßß  ßß   ßßßß  ßßßßßßß'); foreach ($line in $logo) { if ($line.Trim().Length -eq 0) { Write-Host ''; continue }; [char[]]$chars = $line.ToCharArray(); foreach ($c in $chars) { if ($c -eq 'ß') { $color = Get-Random -InputObject $colors; Write-Host $c -ForegroundColor $color -NoNewline } else { Write-Host $c -NoNewline } }; Write-Host '' }"
echo.
ping localhost -n 2 >nul

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

:: Connectivity Check
ping -n 1 8.8.8.8 >nul 2>&1 && (set "NetState=ONLINE" & set "StateCol=1F") || (set "NetState=OFFLINE" & set "StateCol=4F")

if exist "%WinDir%\SysWOW64" (set "Arch=x64") else (set "Arch=x86")
for /f "tokens=3*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName') do set "OS_Name=%%a %%b"
for /f "tokens=3*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuildNumber') do set "OS_Build=%%a"
set "Sys_Info=%OS_Name% (Build %OS_Build%) %Arch%"

set "Fetch=powershell -Command [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $ProgressPreference='Continue'; Invoke-WebRequest"

mode con: cols=110 lines=39

:MainMenu
set "Page=1"
cls
color %StateCol%
echo ==============================================================================================================
echo      		**Morphs Creations** DEPLOYMENT CONSOLE v%Version%  [^>] MODE: %NetState%
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
goto :MenuFooter

:MenuPage2
set "Page=2"
cls
color %StateCol%
echo ==============================================================================================================
echo      	**Morphs Creations** DEPLOYMENT CONSOLE v%Version% (Page 2/2) [^>] MODE: %NetState%
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
goto :MenuFooter

:MenuFooter
echo ==============================================================================================================
echo   [ N ] Next Page ^| [ B ] Back Page ^| [ S ] Save Profile ^| [ L ] Load Profile ^| [ U ] Update Console
echo ==============================================================================================================
echo   [*] SOURCE DIR: %Src_Dir%
echo   [*] DEV CMD: [ PUSH ] to Sync GitHub ^| [ 0 ] Close Terminal
echo.
set /p opts="Selection: "

if /I "%opts%"=="0"    exit /b
if /I "%opts%"=="N"    goto :MenuPage2
if /I "%opts%"=="B"    goto :MainMenu
if /I "%opts%"=="S"    goto :SaveProfile
if /I "%opts%"=="L"    goto :LoadProfile
if /I "%opts%"=="U"    goto :CheckForUpdates
if /I "%opts%"=="PUSH" goto :GitPushUpdate
if "%opts%"=="" (
    if "%Page%"=="1" goto :MainMenu
    if "%Page%"=="2" goto :MenuPage2
)

:: Macro Redirection
if /I "%opts%"=="300"       set "opts=56 57 58 59"
if /I "%opts%"=="browsers"  set "opts=56 57 58 59"
if /I "%opts%"=="350"       set "opts=41 42 43 44 45 46 52 53"
if /I "%opts%"=="runtimes"  set "opts=41 42 43 44 45 46 52 53"
if /I "%opts%"=="400"       set "opts=14 24 71 72 73 74 75"
if /I "%opts%"=="666"       set "opts=1 2 45 56 57 201 210 220 231"

:RunSelectionLoop
for %%i in (%opts%) do (
    cls
    echo ==============================================================================
    echo PROCESSING QUEUED DEPLOYMENT TASK: [Option %%i]
    echo ==============================================================================
    set "item=%%i"
    findstr /i ":Opt_%%i" "%~f0" >nul
    if !errorlevel! EQU 0 (call :Opt_%%i) else (echo [!] Error: Subroutine :Opt_%%i not defined. & timeout /t 2 >nul)
)
cls
color 0A
echo ==============================================================================
echo [+][Success] Queue finished.
echo ==============================================================================
timeout /t 3 >nul
if "%Page%"=="1" goto :MainMenu
goto :MenuPage2

:: Logic: Uses %Src_Dir% global variable for all offline calls.
:Opt_1
set "W=03_7z-x64.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd) else (
    if "%NetState%"=="ONLINE" (
        set "U1=https://github.com"
        set "U2=/ip7z/7zip/releases/download/24.05/7z2405-x64.exe"
        !Fetch! "!U1!!U2!" -OutFile "%P_Dir%\7z_setup.exe"
        start /wait "" "%P_Dir%\7z_setup.exe" /S
    )
)
exit /b

:Opt_2
set "W=31_winrar.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd) else (
    if "%NetState%"=="ONLINE" (
        set "U1=https://www.win-rar.com"
        set "U2=/fileadmin/winrar-versions/winrar/winrar-x64-701.exe"
        !Fetch! "!U1!!U2!" -OutFile "%P_Dir%\winrar_setup.exe"
        start /wait "" "%P_Dir%\winrar_setup.exe" /S
    )
)
exit /b

:Opt_5
set "W=11_K-Lite_Codec_Pack_Mega.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd) else (
    if "%NetState%"=="ONLINE" (
        set "U1=https://files3.codecguide.com"
        set "U2=/K-Lite_Codec_Pack_1840_Mega.exe"
        !Fetch! "!U1!!U2!" -OutFile "%P_Dir%\klite_setup.exe"
        start /wait "" "%P_Dir%\klite_setup.exe" /verysilent
    )
)
exit /b

:Opt_41
set "W=04_AdobeAIR.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd) else (
    set "U1=https://download.macromedia.com"
    set "U2=/pub/labs/flashruntimes/air/AdobeAIR.exe"
    !Fetch! "!U1!!U2!" -OutFile "%F_Dir%\AdobeAIR.exe"
    start /wait "" "%F_Dir%\AdobeAIR.exe" -silent
)
exit /b

:Opt_44
set "W=06_DirectX.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd) else (
    set "U1=https://download.microsoft.com"
    set "U2=/download/8/4/A/84A35BF1-DAFE-438A-A304-AD17EB294A39/directx_Jun2010_redist.exe"
    !Fetch! "!U1!!U2!" -OutFile "%F_Dir%\dx_legacy.exe"
    mkdir "%F_Dir%\DX_Extract" 2>nul
    "%F_Dir%\dx_legacy.exe" /Q /T:"%F_Dir%\DX_Extract"
    start /wait "" "%F_Dir%\DX_Extract\DXSETUP.exe" /silent
)
exit /b

:Opt_45
set "W=07_VisualCppRedist.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd) else (
    set "U1=https://github.com"
    set "U2=/abbodi1406/vcredist/releases/download/v0.81.0/VisualCppRedist_AIO_x86_x64_81.zip"
    !Fetch! "!U1!!U2!" -OutFile "%F_Dir%\VC_AIO.zip"
    powershell -Command "Expand-Archive -Path '%F_Dir%\VC_AIO.zip' -DestinationPath '%P_Dir%\VC_Redist' -Force"
    for %%f in ("%P_Dir%\VC_Redist\*.exe") do start /wait "" "%%f" /ai /gm2
)
exit /b

:Opt_57
set "W=10_Chrome.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd) else (
    set "U1=https://dl.google.com"
    set "U2=/tag/s/appguid=%%7B8A69AD02-D016-43F5-9835-D1893E936601%%7D/chrome/install/ChromeStandaloneSetup64.exe"
    !Fetch! "!U1!!U2!" -OutFile "%P_Dir%\chrome.exe"
    start /wait "" "%P_Dir%\chrome.exe" /silent /install
)
exit /b

:Opt_280
set "W=02_OldCalcWin10.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd)
exit /b

:Opt_281
set "W=32_startback.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd)
exit /b

:Opt_270
set "W=14_Net_Desktop_v5_x64.cmd"
if "%Arch%"=="x86" set "W=15_Net_Desktop_v5_x86.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd)
exit /b

:Opt_271
set "W=16_Net_Desktop_v6_x64.cmd"
if "%Arch%"=="x86" set "W=17_Net_Desktop_v6_x86.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd)
exit /b

:Opt_272
set "W=18_Net_Desktop_v7_x64.cmd"
if "%Arch%"=="x86" set "W=19_Net_Desktop_v7_x86.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd)
exit /b

:Opt_273
set "W=20_Net_Desktop_v8_x64.cmd"
if "%Arch%"=="x86" set "W=21_Net_Desktop_v8_x86.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd)
exit /b

:Opt_274
set "W=22_Net_Desktop_v9_x64.cmd"
if "%Arch%"=="x86" set "W=23_Net_Desktop_v9_x86.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd)
exit /b

:Opt_275
set "W=24_Net_Desktop_v10_x64.cmd"
if "%Arch%"=="x86" set "W=25_Net_Desktop_v10_x86.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd)
exit /b

:Opt_284
set "W=26_Desktop_Restore.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd)
exit /b

:Opt_287
set "W=27_qbittorrent.cmd"
if exist "%Src_Dir%\%W%" (pushd "%Src_Dir%" & call "%W%" & popd)
exit /b

:CheckForUpdates
cls
set "U1=https://raw.githubusercontent.com"
set "U2=/Morph699/Morphs-Toolbox/main/version.txt"
set "U3=/Morph699/Morphs-Toolbox/main/Toolbox.cmd"
!Fetch! "!U1!!U2!" -OutFile "%F_Dir%\v.txt" >nul 2>&1
set /p RV=<"%F_Dir%\v.txt"
if "%RV%"=="%Version%" (timeout /t 2 >nul & goto :MainMenu)
!Fetch! "!U1!!U3!" -OutFile "%Base_Dir%T_New.cmd"
if exist "%Base_Dir%T_New.cmd" (
    (echo @echo off
    echo timeout /t 2 ^>nul
    echo del /f /q "%~f0"
    echo ren "%Base_Dir%T_New.cmd" "%~nx0"
    echo start "" "%~f0"
    echo del "%%~f0") > "%temp%\m.bat"
    start "" "%temp%\m.bat" & exit /b
)
goto :MainMenu

:GitPushUpdate
set /p msg="Commit Msg: "
git add . & git commit -m "%msg%" & git push origin main & pause & goto :MainMenu

:SaveProfile
set /p cq="IDs: " & echo %cq% > "%F_Dir%\Profile.txt" & goto :MainMenu

:LoadProfile
if exist "%F_Dir%\Profile.txt" (set /p opts=<"%F_Dir%\Profile.txt") & goto :RunSelectionLoop