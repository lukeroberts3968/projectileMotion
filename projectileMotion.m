function [] = projectileMotion ()
close all;
%create a global variable in order to denote overall change
global image;
%individual variables for outputs generated from function
image.distance = 0;
image.time = 0;

%Create a user interface with the title 'Projectile Motion Graph'
image.fig = figure('numbertitle','off','name','Projectile Motion Graph');

%Create a slider to manipulate starting velocity
image.changeVelTxt = uicontrol('style','text','units','normalized','position',...
    [.034 .16 .2 .05],'string','Initial Velocity');
%Find a way to set bounds for the slider
image.changeVel = uicontrol ('style','slider','min',0,'max',500,'units','normalized','position',...
    [.034 .125 .5 .05],'callback', {@calcChangeVelocity});
%image.sliderVel = ;

%Create a slider to manipulate angle (find a way to limit angle from 0 to 90)
image.changeAngleTxt = uicontrol('style','text','units','normalized','position',...
    [.034 .06 .2 .05],'string','Launch Angle');
    %note: added limits to line of code; may fluff it up
image.changeAngle = uicontrol ('style','slider','min',0,'max',90,'units','normalized','position',...
    [.034 .007 .33 .05],'callback', {@calcChangeAngle});

%image.sliderAngle = ;

%Create UIControl to initiate calculation after said parameters are reached
image.calc = uicontrol ('style','pushbutton','units','normalized','position',...
    [.75 .007 .25 .15],'string','calculate','callback', {@calcEquation});

%Create Output text boxes displaying the final distance 'x' and the final
%time 't'. Maybe use pop-ups?
end

function [velocity] = calcChangeVelocity (source,event,velocity)

end

function [angle] = calcChangeAngle (source,event,angle)

end
%Note: May need to Merge functions CalcEquation with plotGraph
function [] = calcEquation (source,event, velocity, angle)
global image;
t = (2*velocity*sind(angle)/9.8);
image.distance = (velocity * cosd(angle) *t);
image.time = t;
plotGraph
end

%This is the function from plotGraph that does exactly what it says...
%plots a graph
function [] = plotGraph (velocity, angle)
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