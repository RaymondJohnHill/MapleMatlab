% RJ Hill

%     NN (A)  kJ/Mol  eV/atom 	Ep    Sg
% Ne  3.13    1.88    0.020   	50    2.74
% Ar  3.76    7.74    0.080   	167   3.40
% Kr  4.01    11.2    0.116   	225   3.65
% Xe  4.35    16.0    0.170     320   3.98

clear;
clc;

% Experimental Constants:
NNe = 3.76;             % known nn value for Argon
Ue = 0.080;             % known ce value for Argon

% constants:
Ep = 167e-16;           % value for Argon (in ergs)
Sg = 3.40;              % value for Argon (in A)
Pij6 = 14.45;           % Pij^-6 for FCC
Pij12 = 12.13;          % Pij^-12 for FCC
R = 1.11;               % R value for Argon

U = 2*Ep*(((1/R)^12)*Pij12-((1/R)^6)*Pij6);
Uj = U*1e-7;
Ua = Uj*-6.24150974e18;

NNa = R*Sg;

PEU = ((Ua-Ue)/Ue)*100;
PER = ((NNa-NNe)/NNe)*100;

PEU
PER