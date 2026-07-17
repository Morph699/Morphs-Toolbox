:: ===========================================================================
:: NAME:	reset-settings.bat
:: AUTHOR:	Manuel Gil.
:: ===========================================================================

echo off
cls

if not defined ProgramFiles(x86) (
	set architecture=32
) else (
	set architecture=64
)

cd "%~dp0"
cd ..
cd ..

echo.# .\wureset\ Reset Windows Update Tool>"settings.ini"
echo.# settings.ini>>"settings.ini"
echo.>>"settings.ini"
echo.[system]>>"settings.ini"
echo.architecture=^%architecture%>>"settings.ini"
echo.>>"settings.ini"
echo.[program]>>"settings.ini"
echo.language=>>"settings.ini"
echo.
echo.# Font color:>>"settings.ini"
echo.#    2 = Green       9 = Light Blue>>"settings.ini"
echo.#    3 = Aqua       10 = Light Green>>"settings.ini"
echo.#    4 = Red        11 = Light Aqua>>"settings.ini"
echo.#    5 = Purple     12 = Light Red>>"settings.ini"
echo.#    6 = Yellow     13 = Light Purple>>"settings.ini"
echo.#    7 = White      14 = Light Yellow>>"settings.ini"
echo.#    8 = Gray       15 = Bright White>>"settings.ini"
echo.font=^7>>"settings.ini"
echo.>>"settings.ini"
echo.[pass]>>"settings.ini"
echo.terms=false>>"settings.ini"

goto :eof
