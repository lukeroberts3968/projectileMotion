%this function is in charge of creating a plot/parabola for the GUI.


function [] = plotGraph (source, event, velocity, angle)
close all;
%Convert time to a variable 
t = (2*velocity*sind(angle)/9.8);
%Make Variable Z to Ensure that t is an integer
Z = [0.0001:.0001:t]';
%create variable i to create arrays for x and y values
i = length(Z);
x = ones(i,1)*inf;
y = ones(i,1)*inf;
%Create a for loop to fill in the values of said arrays
for N = 1:i
 x(N) = (velocity * cosd(angle)) * Z(N);
 y(N) = (velocity * sind(angle) * Z(N)) - (1/2 * 9.8 * (Z(N))^2); 
end

plot (x, y)
title('Motion of Projectile')
xlabel('meters')
ylabel('meters')
end
