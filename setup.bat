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
If %verthash%==False (
	echo Verthash.dat 
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

set /P walletAdress=What is your wallet adress?:
    echo Verthashminer -u %walletAdress% -p c=VTC,mc=VTC -o stratum+tcp://verthash.mine.zergpool.com:4534 --verthash-data verthash.dat all-cl-devices --all-cu-devices>work.bat
    start work.bat
	
ECHO.
ECHO Verthashminer configured successfully.
ECHO.
GOTO ENDFILE

:HASHALOT

set /P walletAdress=What is your wallet adress?:
    echo VtcZerg -u %walletAdress% -p x -o s>work.bat
	start work.bat

ECHO.
ECHO Verthashminer configured successfully.
ECHO.
GOTO ENDFILE

:SUPRNOVA

set /P walletAdress=What is your wallet adress?:
    echo VtcSupr -u %walletAdress% -p x -o s>work.bat
	start work.bat

ECHO.
ECHO Verthashminer_Automated configured successfully.
ECHO.
GOTO ENDFILE

:INVALID
ECHO Invalid option
ECHO.
GOTO README


:ENDFILE
ECHO.
PAUSE