% main.m
clear; clc;

xmin = -10;
xmax = 10;
Nx = 1000;
tmax = 5;
Nt = 500;
dx = (xmax - xmin) / Nx;
dt = tmax / Nt;

x = linspace(xmin, xmax, Nx);
t = linspace(0, tmax, Nt);

sigma = 1;
p0 = 1;
V0 = 1;

psi = init_gaussian(x, sigma, p0);

[free_psi] = free_evol(psi, x, dx, dt, Nt);
[travel_psi] = travel_evol(psi, x, dx, dt, Nt, V0);
[oscilator_psi] = oscilator_evol(psi, x, dx, dt, Nt);

plot_system(x, t, free_psi, 'Partícula Libre');
plot_system(x, t, travel_psi, 'Partícula Viajera');
plot_system(x, t, oscilator_psi, 'Oscilador Armónico');
