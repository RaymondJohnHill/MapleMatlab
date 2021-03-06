% RJ Hill
% Project 1

% This program is designed to take the work function of a sample
% and use it to plot tunneling versus applied voltage.

% clear all variables and the console, set the format.
clear
clc
format long

% *** CONVERSION FACTORS ***
% 1 eV = 1.60217646E-19 J
toJoules = 1.60217646E-19;
toEV = 1/1.60217646E-19;


% *** CONSTANTS ***
% Speed of light (2.998E8 m/s)
C = 2.998E8;

% Elementary charge (1.60217646E-19 C)
e = 1.60217646E-19;

% Electron mass (9.1095E-31 kg)
Me = 9.1095E-31;

% Reduced Planck constant (h-bar in eV*s)
h = 1.055E-34 * toEV;

% Electron mass energy (~.511 MeV)
Ee = Me*C^2 * toEV;


% *** VARIABLES ***
% Work function for Vanadium (4.3 eV)
Vo = 4.3;


% *** PROGRAM FUNCTION ***
% Applied voltage, which we want to be less than Vo
Va = 0.01:0.01:Vo;
E = Va;

% Alpha calculation
alpha = sqrt((2.*Ee.*(Vo-E))./((h.*C)^2));

% Tunneling calculation
To = 16.0*E.*(Vo-E)/Vo^2;

% a is the distance from the metal tip to the sample (in angstroms)
a = 3.0e-10;

% Calculation of T
T = To.*exp(-2.*alpha.*a);

% calculation of D and T2 (the actual formula not the approximation)
D = Vo^2./(4.*E.*(Vo-E));
T2 = 1./(1+D.*sinh(alpha.*a).^2);

% Setting up the plot of E versus T
p = plot(E,T);
hold on
p2 = plot(E,T2);
title('Tunneling for Vanadium');
xlabel('E (eV)');
ylabel('T (unitless)');
set(p,'Color','red','LineWidth',2)
set(p2,'Color','green','LineWidth',2)