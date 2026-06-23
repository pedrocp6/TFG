clear
clc

% Set up matlab path
ROOT_DIR = fileparts(mfilename('fullpath'));
addpath(fullfile(ROOT_DIR, 'Parameters'));
addpath(fullfile(ROOT_DIR, 'Parameters/ART25')); % Load ART24 or ART25 data
addpath(fullfile(ROOT_DIR, 'Simulation'));
addpath(fullfile(ROOT_DIR, 'Simulation/data/a'));
addpath(fullfile(ROOT_DIR, 'Resources'));
addpath(genpath(fullfile(ROOT_DIR, 'Models')));
addpath(genpath(fullfile(ROOT_DIR, 'Functions')));
addpath("C:\TFG_Vivado\qpOASES\interfaces\matlab");

addpath(fullfile(ROOT_DIR,'..','DIN-DataAcquisition')); % Load path to data acquisition functions
% addpath(genpath(fullfile(ROOT_DIR,'..','can_logs'))); % CHANGE PATH TO YOUR LOG DIRECTORY
% addpath(fullfile(ROOT_DIR, '..', 'rosbags'));

% Load config files
param_control
param_tire_model
param_vehicle_dynamics
param_sensors

% Create Bus from Struct

Simulink.Bus.createObject(param);
paramBus = slBus1;
clear slBus1;

Simulink.Bus.createObject(pac);
pacBus = slBus1;
clear slBus1;

Simulink.Bus.createObject(state_struct);
stateBus = slBus1;
clear slBus1;

Simulink.Bus.createObject(sensor_struct);
sensorBus = slBus4;
clear slBus4;

Simulink.Bus.createObject(param_vdc);
vdcBus = slBus1;
clear slBus1;