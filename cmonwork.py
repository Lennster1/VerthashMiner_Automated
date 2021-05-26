import subprocess
import dotenv
from pathlib import Path


if Path('verthash.dat').is_file():
    Verthashdat = 'True'
else:
    Verthashdat = 'False'

if Path('work.bat').is_file():
    batExists = 'True'
else:
    batExists = 'False'

if Verthashdat == 'True':
    print("Vertash.dat exists!")
else: 
    print("Verthash.dat does not exist!")
    subprocess.call([r'generate_vtc_dat.bat'])
    print("Verthash.dat Generated!")

if batExists == 'True':
    subprocess.call([r'work.bat'])
else:
    myBat = open(r'work.bat','w+')
myBat.write('VerthashMiner -u VpEySNp1Sd9b6ghFkB1rZbmavtxJ5RjxAt.butt -p x -o stratum+tcp://mining.hashalot.net:3950 --verthash-data verthash.dat --all-cu-devices')
myBat.close()

