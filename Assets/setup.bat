@ECHO OFF
cls
@setlocal enableextensions
@cd /d "%~dp0"

REM Checks whether verthash.dat exists in AppData\Vertcoin (if the user already have Vertcoin Core) or in current path.
If exist "%AppData%\Vertcoin\verthash.dat" (
    set Verthashdat=True
    set VerthashPath="%AppData%\Vertcoin\verthash.dat"
    echo Verthash file exists! %VerthashPath%
 ) else if exist "verthash.dat" (
    set Verthashdat=True
    set VerthashPath="verthash.dat"
    echo Verthash file exists!
 ) else (
    set Verthashdat=False
 )

If exist "work.bat" (
    set batExists=True
) else (
    set batExists=False
    )

If %batExists%==True (
    start work.bat
    EXIT /B
    )

:README
	cls
	ECHO.
	ECHO ******************************************************************************
	ECHO       ****        ****  ************     *********
	ECHO        ****      ****       ****       ****     ****   
	ECHO         ****    ****        ****      ****  
	ECHO          ****  ****         ****      **** 
	ECHO           ********          ****       ****     ****  
	ECHO            ******           ****         *********   
	ECHO ******************************************************************************
	ECHO.
	ECHO		Verthashminer_Automated Setup Wizard
	ECHO.
	ECHO This script will configure and run Verthashminer in the computer.
	ECHO.
	ECHO ******************************************************************************
	ECHO.
	ECHO. Please select desired pool:
	:GETINPUT
	ECHO  1 - Zergpool
	ECHO.
	ECHO  2 - Hashalot
	ECHO.
	ECHO  3 - Suprnova
	ECHO.
	ECHO  4 - Exit
	ECHO.
	set INPUT=
	set /P INPUT=Enter the option: %=%
	IF "%INPUT%" == "1" GOTO ZERGPOOL
	IF "%INPUT%" == "2" GOTO HASHALOT
	IF "%INPUT%" == "3" GOTO SUPRNOVA
	IF "%INPUT%" == "4" GOTO :EOF

GOTO INVALID

:ZERGPOOL

set /P walletAddress=Please type, or paste your Vertcoin wallet address:
    echo VerthashMiner -u %walletAddress% -p c=VTC,mc=VTC -o stratum+tcp://verthash.mine.zergpool.com:4534 --verthash-data %VerthashPath% --all-cl-devices --all-cu-devices>work.bat
	
ECHO.
ECHO Verthashminer configured successfully.
ECHO.
timeout /t 5 /nobreak > nul
start work.bat
GOTO ENDFILE

:HASHALOT

set /P walletAddress=Please type, or paste your Vertcoin wallet address:
    echo VerthashMiner -u %walletAddress% -p x -o stratum+tcp://mining.hashalot.net: --verthash-data %VerthashPath% --all-cl-devices --all-cu-devices>work.bat

ECHO.
ECHO Verthashminer configured successfully.
ECHO.
timeout /t 5 /nobreak > nul
start work.bat
GOTO ENDFILE

:SUPRNOVA

set /P walletAddress=Please type, or paste your Vertcoin wallet address:
    echo VerthashMiner -o stratum+tcp://vtc.suprnova.cc:1777 -u %walletAddress% -p x --verthash-data %VerthashPath% --all-cu-devices --all-cl-devices>work.bat

ECHO.
ECHO Verthashminer_Automated configured successfully.
ECHO.
timeout /t 5 /nobreak > nul
start work.bat
GOTO ENDFILE

:INVALID
ECHO Invalid option
ECHO.
GOTO README


:ENDFILE
ECHO.
PAUSE
