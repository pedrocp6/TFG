# vdc-ART25
Vehicle dynamics simulation platform for embedded controls validation and development.

## How to run simulations
The main file `ART25_full_car.slx` contains the car model `ART25.slx` and the control unit. To programmatically run the simulation first run `simulation_setup.m` from the main folder. Then you will have everything on your matlab path and you simply need to type `launch_simulation` on your command window.

Input data is configurable from the script `launch_simulation.m` in the folder **Simulation**.

You can select the car model between ART24 and ART25 in the simulations changing the line `Parameters/ART25` to `Parameters/ART24` in `simulation_setup.m`.