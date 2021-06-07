@ECHO OFF
cls
@setlocal enableextensions
@cd /d "%~dp0"

If exist "verthash.dat" (
	set Verthashdat=True
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
	ECHO  3 - Hashcryptos
	ECHO.
	ECHO  4 - Exit
	ECHO.
	set INPUT=
	set /P INPUT=Enter the option: %=%
	IF "%INPUT%" == "1" GOTO ZERGPOOL
	IF "%INPUT%" == "2" GOTO HASHALOT
	IF "%INPUT%" == "3" GOTO HASHCRYPTOS
	IF "%INPUT%" == "4" GOTO :EOF

GOTO INVALID

:ZERGPOOL

set /P walletAddress=Please type or paste your Vertcoin wallet address:
SET /P workerName=Please enter workername, or leave empty: || SET workerName=

if [%workerName%] == [] (
  echo VerthashMiner -u %walletAddress% -p c=VTC,mc=VTC -o stratum+tcp://verthash.mine.zergpool.com:4534 --verthash-data verthash.dat --all-cl-devices --all-cu-devices>work.bat
) else (
    echo VerthashMiner -u %walletAddress%.%workerName% -p c=VTC,mc=VTC -o stratum+tcp://verthash.mine.zergpool.com:4534 --verthash-data verthash.dat --all-cl-devices --all-cu-devices>work.bat
)

ECHO.
GOTO ENDFILE

:HASHALOT

set /P walletAddress=Copy/Type/Paste your wallet address here:
    echo Verthashminer -u %usernames% -p x -o stratum+tcp://mining.hashalot.net:3950 --verthash-data verthash.dat --all-cl-devices --all-cu-devices>work.bat
ECHO Verthashminer configured successfully.
ECHO.
start work.bat
ECHO.
GOTO ENDFILE

:HASHCRYPTOS

set /P walletAddress=Copy/Type/Paste your username here:
    echo Verthashminer -u %walletAdress% -p x -o stratum+tcp://mining.hashalot.net:3950 --verthash-data verthash.dat --all-cl-devices --all-cu-devices>work.bat
ECHO Verthashminer configured successfully.
ECHO.
start work.bat
ECHO.
GOTO ENDFILE

:INVALID
ECHO Invalid option
ECHO.
GOTO README


:ENDFILE
ECHO.
PAUSE
