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
    [.034 .125 .5 .05],'callback', {@changeVelocity});
image.displayVel = ;

%Create a slider to manipulate angle (find a way to limit angle from 0 to 90)
image.changeAngleTxt = uicontrol('style','text','units','normalized','position',...
    [.034 .06 .2 .05],'string','Launch Angle');
    %note: added limits to line of code; may fluff it up
image.changeAngle = uicontrol ('style','slider','min',0,'max',90,'units','normalized','position',...
    [.034 .007 .33 .05],'callback', {@changeAngle, 1});
image.displayAngle = ;

%Create UIControl to initiate calculation after said parameters are reached
image.calc = uicontrol ('style','pushbutton','units','normalized','position',...
    [.75 .007 .25 .15],'string','calculate','callback', {@calcEquation, image.distance, image.time});

%Create Output text boxes displaying the final distance 'x' and the final
%time 't'. Maybe use pop-ups?
end

function [] = changeVelocity (source,event,velocity)

end

function [] = changeAngle (source,event,angle)

end

function [] = calcEquation (source,event, velocity, angle)

end