clc; clear; close all;

%% ===========================
% Traffic Light Fuzzy Controller
%% ===========================

timeSteps = 50; % Number of steps for multi-step simulations

%% === Random Traffic Simulation ===
%% Option 1: Random traffic simulation
%trafficDensity = randi([0 20], 1, timeSteps);
%waitingTime = randi([5 50], 1, timeSteps);
%simulateTraffic(timeSteps, trafficDensity, waitingTime);

%% === Manual Traffic Simulation ===
%trafficDensity = [10 15 20 25 40];
%waitingTime = [19 50 20 30 55];
%simulateTraffic(timeSteps, trafficDensity, waitingTime);

%% === Single Input Green Light Calculation ===
singleTrafficDensity = 50;  % number of vehicles
singleWaitingTime = 141;     % waiting time in seconds
simulateTraffic(1, singleTrafficDensity, singleWaitingTime);
