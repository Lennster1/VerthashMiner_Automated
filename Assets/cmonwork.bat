@echo off 
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
If %Verthashdat%==False (
    echo Verthash.dat does not Exist! 
    start generate_vtc_dat.bat
)
If %batExists%==True (
    start work.bat
) else (
    set /P walletAdress=What is your wallet adress?:
    (echo
VerthashMiner -u %walletAdress% -p x -o stratum+tcp://verthash.mine.zergpool.com:4534 --verthash-data verthash.dat --all-cl-devices --all-cu-devices) >work.bat
start work.bat
