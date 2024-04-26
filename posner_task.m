

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

polyWidth = 125;
polyHeight = 125;
penWidth = 50;

% Abbr. for the cues below:
    % FD: Fixation Diamond
    % L: Left
    % R: Right
    % NC: Neutral Cue
    % NA: No Attention Cue

%% ------------------ Fixation Diamond -------------------

xCoordFD = [xCenter, xCenter - (polyWidth/2), xCenter, xCenter + (polyWidth/2)]';
yCoordFD = [yCenter + (polyHeight /2), yCenter, yCenter - (polyHeight /2), y]';
pointListFD = [xCoordFD yCoordFD];

colorFD = blue;

Screen('FramePoly', window, colorFD, pointListFD, penWidth);
% Screen('Flip', window);

%% ---------------------- Left Cue -----------------------

xCoordL = [xCenter, xCenter - (polyWidth/2), xCenter, xCenter - (polyWidth/2)]';
yCoordL = [yCenter + (polyHeight /2), yCenter, yCenter - (polyHeight /2), yCenter]';
pointListL = [xCoordL yCoordL];

colorL = green;

Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter], 2);
Screen('FramePoly', window, colorFD, pointListFD, penWidth);
Screen('FramePoly', window, colorL, pointListL, penWidth);

% Screen('Flip', window);

%% ---------------------- Right Cue -----------------------

xCoordR = [xCenter, xCenter + (polyWidth/2), xCenter, xCenter + (polyWidth/2)]';
yCoordR = [yCenter + (polyHeight /2), yCenter, yCenter - (polyHeight /2), yCenter]';
pointListR = [xCoordR yCoordR];

colorR = green;

Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter], 2);
Screen('FramePoly', window, colorFD, pointListFD, penWidth);
Screen('FramePoly', window, colorR, pointListR, penWidth);

% Screen('Flip', window);

%% --------------------- Neutral Cue ----------------------

xCoordNC = [xCenter, xCenter + (polyWidth/2), xCenter, xCenter + (polyWidth/2)]';
yCoordNC = [yCenter + (polyHeight /2), yCenter, yCenter - (polyHeight /2), yCenter]';
pointListNC = [xCoordNC yCoordNC];

colorNC = green;

Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter], 2);
Screen('FramePoly', window, colorNC, pointListNC, penWidth);

% Screen('Flip', window);

%% ----------------------- NA Cue ------------------------

% xCoordNA = [xCenter, xCenter + (polyWidth/2), xCenter, xCenter - (polyWidth/2)]';
% yCoordNA = [yCenter + (polyHeight /2), yCenter, yCenter - (polyHeight /2), yCenter]';
% pointListNA = [xCoordNA yCoordNA];
% 
% colorNA = red;
% 
% Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter], 2);
% Screen('FramePoly', window, colorNA, pointListNA, penWidth);

% Screen('Flip', window);

%% ------------- Bilateral Rings Parameters ---------------

% Set the parameters for the Landolt C + Gratings
innerRadius = 250; % Radius of the ring
ringThickness = 30; % Thickness of the ring
totalRadius = innerRadius + ringThickness;

% Define Left & Right Positioning of Stimuli
left = [xCenter/2 - totalRadius, yCenter/0.75 - totalRadius, ...
    xCenter/2 + totalRadius, yCenter/0.75 + totalRadius]
right = [xCenter*1.5 - totalRadius, yCenter/0.75 - totalRadius, ...
    xCenter*1.5 + totalRadius, yCenter/0.75 + totalRadius]

% Display Rings (W/O Gap)
% Left
Screen('FrameOval', window, black, left, ringThickness, [], []);
% Right
Screen('FrameOval', window, black, right, ringThickness, [], []);

% Screen('Flip', window);

%% --------------- Target Gap Parameters -----------------

% % Gap Initial Loc (angle) <<<<<<<<<<<<<<<<<<<<<<<<< This is my own calc
% % Left
% loc1 = 200;
% loc2 = 240;
% loc3 = 280;
% loc4 = 320;
% % Right
% loc5 = 20;
% loc6 = 40;
% loc7 = 80;
% loc8 = 120;
% 
% % Gap Initial Loc (angle) <<<<<<<<<<<<<<<<<<<<<<<<< From MSc
% % Left
% loc1 = 225;
% loc2 = 255;
% loc3 = 285;
% loc4 = 315;
% % Right
% loc5 = 45;
% loc6 = 75;
% loc7 = 105;
% loc8 = 135;

% Gap Distance from Initial Loc (Clockwise)
gapDist = 30;

% Display the Gap to the Rings
% Left
% loc1
Screen('FillArc', window, grey, left, loc1, gapDist);
% loc2
Screen('FillArc', window, grey, left, loc2, gapDist);
% loc3
Screen('FillArc', window, grey, left, loc3, gapDist);
% loc4
Screen('FillArc', window, grey, left, loc4, gapDist);

% Right
% loc5
Screen('FillArc', window, grey, right, loc5, gapDist);
% loc6
Screen('FillArc', window, grey, right, loc6, gapDist);
% loc7
Screen('FillArc', window, grey, right, loc7, gapDist);
% loc8
Screen('FillArc', window, grey, right, loc8, gapDist);

% Screen('Flip', window);

%% ---------------- Gratings Parameters ------------------






%% ------------------- Validity --------------------



% include both valid invalid here ?

%% ----------------------- Timing ------------------------

% 1. Fix (T) > 2. Cue (T) > 3. Gap (T) > 4. Gap Identification (R) > 5. Screen - Gap Location? (R)
    % Reaction Time (RT)
        % Valid vs invalid
        % When the gap appear (4), ask participants gap location (L/R)
    % Accuracy (Valid)
        % Gap (L/R) accuracy
        % Gap (location) accuracy

% These are pretty much random - you will need to look at the literature to
% see what is used. Also, note the use of "round" which would be
% dangerous to blindly use in an experiment.

% Fixation (Baseline) point time in seconds and frames (2-3 secs)
fixTimeSecs = 2;
fixTimeFrames = round(fixTimeSecs / ifi);

% Spatial Cue (Attention Deployment) point time in seconds and frames (1-1.5 secs)
cueTimeSecs = 1;
cueTimeFrames = round(cueTimeSecs / ifi);

% Target (Onset) point time in seconds and frames (0.1 secs)
tonsetTimeSecs = 0.1;
targetTimeFrames = round(tonsetTimeSecs / ifi);

% Target (Detection) point time in seconds and frames (1-1.5 secs - lapse time if no response)
tDetectionTimeSecs = 0.15;
targetTimeFrames = round(tDetectionTimeSecs / ifi);

% Target (Precision Gap) point time in seconds and frames (0.1 secs);
% HARUSNYA GA ADA
tPrecTimeSecs = 0.15;
targetTimeFrames = round(tPrecTimeSecs / ifi);

% Intertrial interval time
isiTimeSecs = 0.2;
isiTimeFrames = round(isiTimeSecs / ifi);

% Time between the cue and the target
cueTargetTimeSecs = 0.3;
cueTargetTimeFrames = round(isiTimeSecs / ifi);

% Frames to wait before redrawing
waitframes = 1;

%% ------------------ Keyboard Response ------------------

% Define the keyboard press

% Exit/reset key
esc = KbName('ESCAPE');

% Detection Response L/R Circle
    % Which cirlce have the gap?
    locL = KbName('4$');
    locR = KbName('5%');

% Precision Response Gap Location
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

% Gabor target and square cue will appear to the left and right of the
% fixation. Left will be signalled by '0' and right will be signalled by '1'. 
% They can be "valid" or "invalid". We create a matrix with the four possible
% cue and target positions. Upper line will be the cue position, lower line
% the target position.
% baseMat = [0 0 1 1; 0 1 0 1];

% baseMat = [0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1; ... % Spatial Cue
%            0 0 0 0 1 1 1 1 1 1 1 1 0 0 0 0; ... % Target Loc Validity (always congruent w/ gap loc)
%            0 1 2 3 4 5 6 7 4 5 6 7 0 1 2 3];    % Gap Loc

% Valid
baseMatVal = [0 0 0 0 1 1 1 1; ... % Spatial Cue
              0 0 0 0 1 1 1 1; ... % Target Loc Validity (always congruent w/ gap loc)
              0 1 2 3 4 5 6 7];    % Gap Loc

% mau brp trial anggep 96 trial valid = 8 kombinasi valid * 12
numRepsVal = 12; 
% tabel kemungkinan kombinasi buat 80% trial
cueTargetMatVal = repmat(baseMatVal, 1, numRepsVal);

% Invalid
baseMatInv = [0 0 0 0 1 1 1 1; ... % Spatial Cue
              1 1 1 1 0 0 0 0; ... % Target Loc Validity (always congruent w/ gap loc)
              4 5 6 7 0 1 2 3];    % Gap Loc
% mau brp trial anggep 24 trial invalid = 8 kombinasi invalid * 3
numRepsInv = 3;
% tabel kemungkinan kombinasi buat 20% trial
cueTargetMatInv = repmat(baseMatInv, 1, numRepsInv);

% Combine Valid + Invalid trials > 120 trials (96 valid + 24 invalid)
combinedValInvTrials = [cueTargetMatVal cueTargetMatInv];

% Randomise the trials
combinedValInvTrialsShuff = Shuffle(combinedValInvTrials, 2);

% How many trials are we doing in total
numTrials = size(combinedValInvTrialsShuff, 2); % data aja ini mah

% Make our response matrix which will save the RT and correctness of the
% location choice. We preallocate the matrix with nans.
dataMat = nan(numTrials, 2); % sama ini juga simpen


%% ------------------------ Loop -------------------------








%% ----------------------- Close -------------------------


KbWait;
sca; 




















