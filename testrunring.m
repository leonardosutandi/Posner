% Clear the workspace and close any open Psychtoolbox windows
sca;
close all;

ScreenSetUp;

% Set the parameters for the Landolt C
innerRadius = 250; % Radius of the ring
ringThickness = 30; % Thickness of the ring
%gapThickness = 180; % Thickness of the gap


% Define the size of outer circle
totalRadius = innerRadius + ringThickness / 2;

% Define Left & Right
left = [xCenter/2 - totalRadius, yCenter/0.75 - totalRadius, ...
    xCenter/2 + totalRadius, yCenter/0.75 + totalRadius]
right = [xCenter*1.5 - totalRadius, yCenter/0.75 - totalRadius, ...
    xCenter*1.5 + totalRadius, yCenter/0.75 + totalRadius]

%% Gap locations (angle)
gapDist = 30;

loc1 = 200;


%% Gratings
if ~exist('color1','var') || isempty(color1)
	color1 = [1 1 1];
end

if ~exist('color2','var') || isempty(color2)
	color2 = [0 0 0];
end

if ~exist('baseColor','var') || isempty(baseColor)
	baseColor = [0.5 0.5 0.5 1];
end

oldSyncLevel = Screen('Preference', 'SkipSyncTests', 2);

ScreenSetUp;
% default x + y size
virtualSize = 350;

% radius of the disc edge
radius = floor(virtualSize / 2);

% Build a procedural texture, 
texture = CreateProceduralPolarGrating(window, virtualSize, virtualSize,...
	 color1, color2, radius);

% These settings are the parameters passed in directly to DrawTexture
% angle
angle = 0;

% phase
phase = 0;

% spatial frequency
frequency = 0.03; % cycles/pixel

% calculate frequency of both radial and circular gratings
middleRadius = virtualSize/2;
middlePerimeter = 2*pi*middleRadius; % pixels
radialFrequency = frequency*middlePerimeter / (2*pi); % cycles/degree, must be integral to avoid clip effect, corrected in the frag file
circularFrequency = 0;

% contrast
contrast = 1;

% sigma < 0 is a sinusoid.
sigma = 1;

% Preperatory flip
showTime = 5;
phaseJump = 15; % Speed of rings
vbl = Screen('Flip', window);
tstart = vbl + ifi; %start is on the next frame

% sigma = -1; % sigma < 0 = sinusoidal grating; > 0 = square grating
tmp = radialFrequency; % save the radialFrequency
radialFrequency = 0;
circularFrequency = frequency;
%% Draw Everything

while vbl < tstart + showTime

    % bilateral rings
    Screen('FrameOval', window, black, left, ringThickness, [], []);
    Screen('FrameOval', window, black, right, ringThickness, [], []);
    % Left gap
    Screen('FillArc', window, grey, left, loc1, gapDist);
    Screen('Flip', window);
    
    % Grating
    Screen('DrawTexture', window, texture, [], left, angle, [], [], baseColor, [], [], [phase, radialFrequency, contrast, sigma, circularFrequency, 0, 0, 0]);
    Screen('DrawTexture', window, texture, [], right, angle, [], [], baseColor, [], [], [phase, radialFrequency, contrast, sigma, circularFrequency, 0, 0, 0]);
	phase = phase + phaseJump;
	vbl = Screen('Flip', window, vbl + 0.5 * ifi);	

end



%% Wait for a key press to exit
KbStrokeWait;

% Close the Psychtoolbox window
sca;
