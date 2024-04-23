

%% ------------------- Set Workspace ---------------------

close all;
clear;
sca;

% Set-Up Screen Parematers
ScreenSetUp;

%% ------------- Fixation Cross Parameters ---------------
% fc: fixation cross

% Set arms length
fcArms = 10;

% Set cross coordinates
xCoords_fc = [-fcArms fcArms 0 0];
yCoords_fc = [0 0 -fcArms fcArms];
CrossCoords = [xCoords_fc; yCoords_fc];

% Set cross width
fcWidth = 4; 

% Draw the fixation cross in black, set it to the center of our screen and
% set good quality antialiasing
Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter], 2);

% Flip to the screen
%Screen('Flip', window);

%% --------------- Spatial Cue Parameters ----------------
x = xCenter;
y = yCenter;

polyWidth = 100;
polyHeight = 100;
penWidth = 50;

% Abbr. for the cues below:
    % FD: Fixation Diamond
    % L: Left
    % R: Right
    % NC: Neutral Cue
    % NA: No Attention Cue

%% ------------------ Fixation Diamond -------------------

xCoordFD = [x, x - (polyWidth/2), x, x + (polyWidth/2)]';
yCoordFD = [y + (polyHeight /2), y, y - (polyHeight /2), y]';
pointListFD = [xCoordFD yCoordFD];

colorFD = blue;
penWidth = 50;

Screen('FramePoly', window, colorFD, pointListFD, penWidth);
% Screen('Flip', window);

%% ---------------------- Left Cue -----------------------

xCoordL = [x, x - (polyWidth/2), x, x - (polyWidth/2)]';
yCoordL = [y + (polyHeight /2), y, y - (polyHeight /2), y]';
pointListL = [xCoordL yCoordL];

colorL = green;

Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter], 2);
Screen('FramePoly', window, colorFD, pointListFD, penWidth);
Screen('FramePoly', window, colorL, pointListL, penWidth);

% Screen('Flip', window);

%% ---------------------- Right Cue -----------------------

xCoordR = [x, x + (polyWidth/2), x, x + (polyWidth/2)]';
yCoordR = [y + (polyHeight /2), y, y - (polyHeight /2), y]';
pointListR = [xCoordR yCoordR];

colorR = green;

Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter], 2);
Screen('FramePoly', window, colorFD, pointListFD, penWidth);
Screen('FramePoly', window, colorR, pointListR, penWidth);

Screen('Flip', window);

%% --------------------- Neutral Cue ----------------------

xCoordNC = [x, x + (polyWidth/2), x, x + (polyWidth/2)]';
yCoordNC = [y + (polyHeight /2), y, y - (polyHeight /2), y]';
pointListNC = [xCoordNC yCoordNC];

colorNC = green;

Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter], 2);
Screen('FramePoly', window, colorNC, pointListNC, penWidth);

% Screen('Flip', window);

KbWait;
sca; 

%% ----------------------- NA Cue ------------------------

% xCoordNA = [x, x + (polyWidth/2), x, x - (polyWidth/2)]';
% yCoordNA = [y + (polyHeight /2), y, y - (polyHeight /2), y]';
% pointListNA = [xCoordNA yCoordNA];
% 
% colorNA = red;
% 
% Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter], 2);
% Screen('FramePoly', window, colorNA, pointListNA, penWidth);

% Screen('Flip', window);

%% ---------------- Gratings Parameters ------------------





%% --------------- Target Gap Parameters -----------------





%% ------------------- Stim Positions --------------------



% include both valid invalid here ?

%% ----------------------- Timing ------------------------

% Concentric rings time (only stimulus trial)


% Fixation time


% Spatial cue time (colour change)


% Target gap time


% 1. Fix (T) > 2. Cue (T) > 3. Gap (T) > 4. Gap Identification (R) > 5. Screen - Gap Location? (R)
    % Reaction Time (RT)
        % Valid vs invalid
        % When the gap appear (4), ask participants gap location (L/R)
    % Accuracy (Valid)
        % Gap (L/R) accuracy
        % Gap (location) accuracy

%% ------------------ Keyboard Response ------------------

% Define the keyboard press

% Exit/reset key
esc = KbName('ESCAPE');

% Response L/R Circle
    % Which cirlce have the gap?
    locL = KbName('4$');
    locR = KbName('5%');

% Response Gap Location
    % Left circle gap locations
    loc1 = KbName('1!');
    loc2 = KbName('2@');
    loc3 = KbName('3#');
    loc4 = KbName('4$');
    % Right circle gap locations
    loc5 = KbName('5%');
    loc6 = KbName('6^');
    loc7 = KbName('7&');
    loc8 = KbName('8*');

% Hide the mouse cursor
% HideCursor;

%% ---------------------- Procedure ----------------------






%% ------------------------- Loop ------------------------











