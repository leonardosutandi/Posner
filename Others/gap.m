% Clear the workspace and close any open Psychtoolbox windows
sca;
close all;

ScreenSetUp;

%% Define Left & Right
left = [xCenter/2 - totalRadius, yCenter/0.75 - totalRadius, ...
    xCenter/2 + totalRadius, yCenter/0.75 + totalRadius]
right = [xCenter*1.5 - totalRadius, yCenter/0.75 - totalRadius, ...
    xCenter*1.5 + totalRadius, yCenter/0.75 + totalRadius]

%% Ring Parameter

% Set the parameters for the Landolt C
innerRadius = 250; % Radius of the ring
ringThickness = 30; % Thickness of the ring

% Define the size of outer circle
totalRadius = innerRadius + ringThickness / 2;

%% Bilateral outer rings

% Left
Screen('FrameOval', window, black, left, ringThickness, [], []);
% Right
Screen('FrameOval', window, black, right, ringThickness, [], []);

%% Gap locations (angle)
gapDist = 30;

% loc1 = 200; 225
% loc2 = 240; 255
% loc3 = 280; 285
% loc4 = 320; 315
% 
% loc5 = 20; 45
% loc6 = 40; 75
% loc7 = 80; 105
% loc8 = 120; 135

%% Draw the gap in one of the outer ring (Landolt C)

% Left
% loc1
Screen('FillArc', window, grey, left, 200, gapDist);
% % loc2
% Screen('FillArc', window, grey, left, loc2, gapDist);
% % loc3
% Screen('FillArc', window, grey, left, loc3, gapDist);
% % loc4
% Screen('FillArc', window, grey, left, loc4, gapDist);
% 
% % Right
% % loc5
% Screen('FillArc', window, grey, right, loc5, gapDist);
% % loc6
% Screen('FillArc', window, grey, right, loc6, gapDist);
% % loc7
% Screen('FillArc', window, grey, right, loc7, gapDist);
% % loc8
% Screen('FillArc', window, grey, right, loc8, gapDist);

% Flip the drawn buffer to the screen
Screen('Flip', window);

%% Wait for a key press to exit
KbStrokeWait;

% Close the Psychtoolbox window
sca;
