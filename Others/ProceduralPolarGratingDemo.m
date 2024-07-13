%function ProceduralPolarGratingDemo(color1,color2,baseColor)
% ProceduralPolarGratingDemo() -- demo polar grating procedural shader
% stimuli, the shader is based on the colour grating shader, see
% ProceduralColorGratingDemo for details.
%
% History:
% 20/05/2021 initial version (Junxiang Luo)

if ~exist('color1','var') || isempty(color1)
	color1 = [1 1 1];
end

if ~exist('color2','var') || isempty(color2)
	color2 = [0 0 0];
end

if ~exist('baseColor','var') || isempty(baseColor)
	baseColor = [0.5 0.5 0.5 1];
end

% Setup defaults and unit color range:
PsychDefaultSetup(2);

% Disable synctests for this quick demo:
oldSyncLevel = Screen('Preference', 'SkipSyncTests', 2);

% Select screen with maximum id for output windowdow:
screenNumber = max(Screen('Screens'));

% Open a fullscreen, onscreen windowdow with gray background. Enable 32bpc
% floating point framebuffer via imaging pipeline on it, if this is possible
% on your hardware while alpha-blending is enabled. Otherwise use a 16bpc
% precision framebuffer together with alpha-blending. 
PsychImaging('PrepareConfiguration');
PsychImaging('AddTask', 'General', 'FloatingPoint32BitIfPossible');
[window, windowRect] = PsychImaging('Openwindow', screenNumber, baseColor);
[width, height] = RectSize(windowRect);
% Query frame duration: We use it later on to time 'Flips' properly for an
% animation with constant framerate:
ifi = Screen('GetFlipInterval', window);

% Enable alpha-blending
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

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

% Define Left & Right
left = [xCenter/2 - totalRadius, yCenter/0.75 - totalRadius, ...
    xCenter/2 + totalRadius, yCenter/0.75 + totalRadius]
right = [xCenter*1.5 - totalRadius, yCenter/0.75 - totalRadius, ...
    xCenter*1.5 + totalRadius, yCenter/0.75 + totalRadius]

while vbl < tstart + showTime
	Screen('DrawTexture', window, texture, [], left, angle, [], [], baseColor, [], [], [phase, radialFrequency, contrast, sigma, circularFrequency, 0, 0, 0]);
    Screen('DrawTexture', window, texture, [], right, angle, [], [], baseColor, [], [], [phase, radialFrequency, contrast, sigma, circularFrequency, 0, 0, 0]);
	phase = phase + phaseJump;
	vbl = Screen('Flip', window, vbl + 0.5 * ifi);
end

% WaitSecs(0);
% Close onscreen windowdow, release all resources:
sca;

% Restore old settings for sync-tests:
Screen('Preference', 'SkipSyncTests', oldSyncLevel);
