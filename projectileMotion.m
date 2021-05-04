function [] = projectileMotion ()
close all;
%create a global variable in order to denote overall change
global image;
%create variables to make and position a graph to be used in the UI

image.p = plot(0,0);
image.p.Parent.Position = [0.2 0.30 0.50 0.65];

%Create a slider to manipulate starting velocity
image.changeVelTxt = uicontrol('style','text','units','normalized','position',...
    [.034 .16 .2 .05],'string','Initial Velocity');
%Find a way to set bounds for the slider
image.changeVel = uicontrol ('style','slider','min',0,'max',500,'units','normalized','position',...
    [.034 .125 .5 .05],'callback', {@calcChangeVelocity});

% Gets the values onto the slider --------------------------------------
image.velocityText = uicontrol('style','text','units','normalized','string','0','position',[0.55 0.11 0.075 0.05]);
image.angleText = uicontrol('style','text','units','normalized','string','0','position',[0.4 0.002 0.05 0.05]);

%Create a slider to manipulate angle (find a way to limit angle from 0 to 90)
image.changeAngleTxt = uicontrol('style','text','units','normalized','position',...
    [.034 .06 .2 .05],'string','Launch Angle');

image.changeTheta = uicontrol ('style','slider','min',0,'max',90,'units','normalized','position',...
    [.034 .007 .33 .05],'callback', {@calcChangeTheta});

%Create UIControl to initiate calculation after said parameters are reached
image.calc = uicontrol ('style','pushbutton','units','normalized','position',...
    [.75 .007 .25 .15],'string','calculate','callback', {@calcEquation});

end
%created values for Velocity that appear on Velocity slider on GUI
function [] = calcChangeVelocity (source,event)
global image;
velocity = source.Value;
image.velocityText.String = velocity;
end
%add a text UI control element 

%created values for angle that appear on Angle slider on GUI 
function [] = calcChangeTheta (source,event)
global image; 
theta = source.Value; 
image.angleText.String = theta;
end

%Note: May need to Merge functions CalcEquation with plotGraph
function [] = calcEquation (source,event)%took out velocity and angle) 
global image;
velocity = image.changeVel.Value;
theta = image.changeTheta.Value;

plotGraph(velocity,theta);%Needed to add inputs to the plotGraph  
end

%This is the function from plotGraph that does exactly what it says...
%plots a graph
function [] = plotGraph (velocity, theta)
global image; 
%Convert time to a variable 
t = (2*velocity*sind(theta)/9.8);
%Make Variable Z to Ensure that t is an integer
Z = [0.0001:.0001:t]';
%create variable i to create arrays for x and y values
i = length(Z);
x = ones(i,1)*inf;
y = ones(i,1)*inf;
%Create a for loop to fill in the values of said arrays
for N = 1:i
 x(N) = (velocity * cosd(theta)) * Z(N);
 y(N) = (velocity * sind(theta) * Z(N)) - (1/2 * 9.8 * (Z(N))^2); 
end
% Make a way to change the graph in the GUI
image.p = plot (x, y);
title('Motion of Projectile')
xlabel('meters')
ylabel('meters')
end