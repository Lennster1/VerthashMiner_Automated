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
    echo "Verthash.dat does not Exist!"
    start generate_vtc_dat.bat
) else (
    start work.bat
)   
pause
exit
