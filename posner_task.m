%% ------------------- Set Workspace ---------------------

close all;
clear;
sca;

%ID
group = input('Group (C / MA / MO): ', 's');
id = input('Unique id (in CAPS): ', 's');
blockNum = input('Block number: ', 's');

% Set-Up Screen Parematers
ScreenSetUp;

%% ------------- Fixation Cross Parameters ---------------
% fc: fixation cross

% Set arms length
fcArms = 6; % 6; 10

% Set cross coordinates
xCoords_fc = [-fcArms fcArms 0 0];
yCoords_fc = [0 0 -fcArms fcArms];
CrossCoords = [xCoords_fc; yCoords_fc];

% Set cross width
fcWidth = 2; % 2; 4

% Draw the fixation cross in black, set it to the center of our screen and
% set good quality antialiasing
% Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter], 2);


%% --------------- Spatial Cue Parameters ----------------
% x = xCenter;
% y = yCenter;

polyWidth = 65; % 65; 125
polyHeight = 65; % 65; 125
penWidth = 5; % 5; 50

% Abbr. for the cues below:
    % FD: Fixation Diamond
    % L: Left
    % R: Right
    % NC: Neutral Cue
    % NA: No Attention Cue

%% ------------------ Fixation Diamond -------------------

xCoordFD = [xCenter, xCenter - (polyWidth/2), xCenter, xCenter + (polyWidth/2)]';
yCoordFD = [yCenter*.95 + (polyHeight /2), yCenter*.95, yCenter*.95 - (polyHeight /2), yCenter*.95]';
pointListFD = [xCoordFD yCoordFD];

colourFD = blue;

% Screen('FramePoly', window, colourFD, pointListFD, penWidth);

%% ---------------------- Left Cue -----------------------

xCoordL = [xCenter, xCenter - (polyWidth/2), xCenter, xCenter - (polyWidth/2)]';
yCoordL = [yCenter*.95 + (polyHeight /2), yCenter*.95, yCenter*.95 - (polyHeight /2), yCenter*.95]';
pointListL = [xCoordL yCoordL];

colourL = green;

% % Must have FC + SC
% Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter], 2);
% Screen('FramePoly', window, colourFD, pointListFD, penWidth);
% Screen('FramePoly', window, colourL, pointListL, penWidth);


%% ---------------------- Right Cue -----------------------

xCoordR = [xCenter, xCenter + (polyWidth/2), xCenter, xCenter + (polyWidth/2)]';
yCoordR = [yCenter*.95 + (polyHeight /2), yCenter*.95, yCenter*.95 - (polyHeight /2), yCenter*.95]';
pointListR = [xCoordR yCoordR];

colourR = green;

% % Must have FC + SC
% Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter], 2);
% Screen('FramePoly', window, colourFD, pointListFD, penWidth);
% Screen('FramePoly', window, colourR, pointListR, penWidth);


%% --------------------- Neutral Cue ----------------------

xCoordNC = [xCenter, xCenter - (polyWidth/2), xCenter, xCenter + (polyWidth/2)]';
yCoordNC = [yCenter*.95 + (polyHeight /2), yCenter*.95, yCenter*.95 - (polyHeight /2), yCenter*.95]';
pointListNC = [xCoordNC yCoordNC];

colourNC = green;

% % Must have FC + SC
% Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter], 2);
% Screen('FramePoly', window, colourNC, pointListNC, penWidth);

%% ----------------------- NA Cue ------------------------

% xCoordNA = [xCenter, xCenter + (polyWidth/2), xCenter, xCenter - (polyWidth/2)]';
% yCoordNA = [yCenter*.95 + (polyHeight /2), yCenter*.95, yCenter*.95 - (polyHeight /2), yCenter*.95]';
% pointListNA = [xCoordNA yCoordNA];
% 
% colourNA = red;

% % Must have FC + SC
% Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter], 2);
% Screen('FramePoly', window, colourNA, pointListNA, penWidth);


%% ------------- Bilateral Target Parameters --------------

% Set the parameters for the Landolt C + Gratings
innerRadius = 125; % Radius of the ring 125; 250
ringThickness = 10; % Thickness of the ring 10; 20
totalRadius = innerRadius + ringThickness;

% Define Left & Right Positioning of Stimuli (+ 2 ring overlap perfectly
% with gratings
left2 = [xCenter/2 - totalRadius - 2, yCenter/0.75 - totalRadius - 2, ...
    xCenter/2 + totalRadius + 2, yCenter/0.75 + totalRadius + 2];
right2 = [xCenter*1.5 - totalRadius - 2, yCenter/0.75 - totalRadius - 2, ...
    xCenter*1.5 + totalRadius + 2, yCenter/0.75 + totalRadius + 2];

% Define Contrast
ringContrast = 0;

% Display Rings (W/O Gap)
% % Left
% Screen('FrameOval', window, black, left, ringThickness, [], []);
% % Right
% Screen('FrameOval', window, black, right, ringThickness, [], []);

%% --------------- Target Gap Parameters -----------------

% Gap Initial Loc (angle) <<<<<<<<<<<<<<<<<<<<<<<<< This is my own calc
% Left
loc1 = 200;
loc2 = 240;
loc3 = 280;
loc4 = 320;
% Right
loc5 = 20;
loc6 = 60;
loc7 = 100;
loc8 = 140;

% % % Gap Initial Loc (angle) <<<<<<<<<<<<<<<<<<<<<<<<< From MSc
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
% % loc1
% Screen('FrameArc', window, grey, left, loc1, gapDist, ringThickness, ringThickness);
% % loc2
% Screen('FrameArc', window, grey, left, loc2, gapDist, ringThickness, ringThickness);
% % loc3
% Screen('FrameArc', window, grey, left, loc3, gapDist, ringThickness, ringThickness);
% % loc4
% Screen('FrameArc', window, grey, left, loc4, gapDist, ringThickness, ringThickness);

% Right
% % loc5
% Screen('FrameArc', window, grey, right, loc5, gapDist, ringThickness, ringThickness);
% % loc6
% Screen('FrameArc', window, grey, right, loc6, gapDist, ringThickness, ringThickness);
% % loc7
% Screen('FrameArc', window, grey, right, loc7, gapDist, ringThickness, ringThickness);
% % loc8
% Screen('FrameArc', window, grey, right, loc8, gapDist, ringThickness, ringThickness);

%% ---------------- Gratings Parameters ------------------

% if ~exist('colour1','var') || isempty(colour1)
% 	colour1 = [1 1 1];
% end
% 
% if ~exist('colour2','var') || isempty(colour2)
% 	colour2 = [0 0 0];
% end
% 
% if ~exist('basecolour','var') || isempty(basecolour)
% 	basecolour = [0.5 0.5 0.5 1];
% end

% oldSyncLevel = Screen('Preference', 'SkipSyncTests', 2);

% Circle width (before defining position = actual width; after = becomes
% spatial freq (?)
circleSize = totalRadius;

% radius of the disc edge
radius = floor(circleSize / 2);

% Build a procedural texture, 
texture = CreateProceduralPolarGrating(window, circleSize, circleSize,...
	 [1 1 1], [0 0 0], radius);

% These settings are the parameters passed in directly to DrawTexture
% angle
angle = 0;

% phase
phase = 0;

% spatial frequency
frequency = 0.08; % cycles/pixel % 0.08; 0.04

% calculate frequency of both radial and circular gratings
% 2*pi = 360 degrees

middleRadius = circleSize/2;
middlePerimeter = 2*pi*middleRadius; % pixels
radialFrequency = frequency*middlePerimeter / (2*pi); % cycles/degree, must be integral to avoid clip effect, corrected in the frag file
circularFrequency = 0;
% sigma < 0 is a sinusoid.
sigma = 1;

% Preperatory flip
phaseJump = 7; % Speed of rings
vbl = Screen('Flip', window);

% sigma = -1; % sigma < 0 = sinusoidal grating; > 0 = square grating
cpd = radialFrequency; % save the radialFrequency
radialFrequency = 0;
circularFrequency = frequency;

% Grating Contrast
gratContrast = 0;

% Define Left & Right Positioning of Stimuli
left = [xCenter/2 - totalRadius, yCenter/0.75 - totalRadius, ...
    xCenter/2 + totalRadius, yCenter/0.75 + totalRadius];
right = [xCenter*1.5 - totalRadius, yCenter/0.75 - totalRadius, ...
    xCenter*1.5 + totalRadius, yCenter/0.75 + totalRadius];
%% ----------------------- Timing ------------------------

% 1. Fix (T) > 2. Cue (T) > 3. Gap (T) > 4. Gap Identification (R) > 5. Screen - Gap Location? (R)
    % Reaction Time (RT)
        % Valid vs invalid
        % When the gap appear (4), ask participants gap location (L/R)
    % Accuracy (Valid)
        % Gap (L/R) accuracy
        % Gap (location) accuracy

% Any Jitter
J = 0.1 + ((0.5 - 0.1).* (rand));

% Fixation (Baseline) point time in seconds and frames (2-3 secs)
fixTimeSecs1 = 1.5;
fixTimeFrames1 = fixTimeSecs1/ifi;
% fixTimeSecs2 = 1 + J;
% fixTimeFrames2 = fixTimeSecs2/ifi;
% % fixTimeSecs3 = 3;
% % fixTimeFrames3 = fixTimeSecs3/ifi;
% % For 96 trials = 2 Time Jitter * 48
% baseMatFixTimeSecs = [0 1];
% numRepsFixTimeSecs = 48; 
% fixTimeFramesMat = repmat(baseMatFixTimeSecs, 1, numRepsFixTimeSecs);
% % Randomise
% cols1 = size(fixTimeFramesMat, 2);
% randCol1 = randperm(cols1);
% fixTimeFramesJitter = fixTimeFramesMat(:, randCol1);

% Spatial Cue (Attention Deployment) point time in seconds and frames (1-1.5 secs)
cueTimeSecs1 = 2;
cueTimeFrames1 = cueTimeSecs1/ifi;
% cueTimeSecs2 = 2 + J; 
% cueTimeFrames2 = cueTimeSecs2/ifi;
% cueTimeSecs3 = 1.5;
% cueTimeFrames3 = cueTimeSecs3/ifi;
% For 96 trials = 2 Time Jitter * 48
% baseMatCueTimeSecs = [0 1];
% numRepsCueTimeSecs = 48; 
% cueTimeFramesMat = repmat(baseMatCueTimeSecs, 1, numRepsCueTimeSecs);
% % Randomise
% cols2 = size(cueTimeFramesMat, 2);
% randCol2 = randperm(cols2);
% cueTimeFramesJitter = cueTimeFramesMat(:, randCol2);

% Target (On/offset) point time in seconds and frames (0.1 secs)
tOnOffsetTimeSecs = 0.1;
tOnOffsetTimeFrames = tOnOffsetTimeSecs/ifi;

% Target (Detection) point time in seconds and frames (1-1.5 secs - lapse time if no response)
tDetectionTimeSecs = 0.1;
tDetectionTimeFrames = tDetectionTimeSecs/ifi;

% Target (Detection Question) point time in seconds and frames
tAccTimeSecs = 0.5;
tAccTimeFrames = tAccTimeSecs/ifi;

% Target (Precision Gap) point time in seconds and frames (0.1 secs);
% Wait for Gap location Response, then cont. to next trial

% % Intertrial interval time
% isiTimeSecs = 1;
% isiTimeFrames = isiTimeSecs/ifi;
% 
% % Time between the cue and the target
% cueTargetTimeSecs = 3;
% cueTargetTimeFrames = isiTimeSecs/ifi;

% Intertrial Interval
interTrialTimeSecs = 1;
interTrialTimeFrames = interTrialTimeSecs/ifi;

% Frames to wait before redrawing
waitframes = 1;

%% ------------------ Keyboard Response ------------------

% Define the keyboard press

% Exit/reset key
    esc = KbName('ESCAPE');

% Detection Response L/R Circle (Valid vs Invalid)
    % Circle appear left/right?
    locL = KbName('f');
    locR = KbName('j');

% Precision Response Gap Location
    % Left circle gap locations
    loc1Res = KbName('a');
    loc2Res = KbName('w');
    loc3Res = KbName('e');
    loc4Res = KbName('f');
    % Right circle gap locations
    loc5Res = KbName('j');
    loc6Res = KbName('i');
    loc7Res = KbName('o');
    loc8Res = KbName(';');

% Hide the mouse cursor
HideCursor;

%% ---------------------- Procedure ----------------------

% Validity Setup

% Spatial cue will either be left (0) or right (1) and can be "valid - 0/0 or 1/1" 
% or "invalid - 0/1 or 1/0". Create 2 matrices (valid and invalid) each with 8 
% possible combination of cue and target/gap positions. Then combine to
% achieve 80% validity.

% Valid
baseMatVal = [0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1; ... % Spatial Cue
              0 1 2 3 4 5 6 7 0 1 2 3 4 5 6 7; ... % Gap Loc
              0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1];    % Stim Condition

% For 64 valid trials (80% of Spatial Cue Condition) = 16 valid combination * 4
numRepsVal = 4; 
cueTargetMatVal = repmat(baseMatVal, 1, numRepsVal);

% Invalid
baseMatInv = [0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1; ... % Spatial Cue
              4 5 6 7 0 1 2 3 4 5 6 7 0 1 2 3; ... % Gap Loc
              0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1];    % Stim Condition
% For 16 invalid trials (20% of Spatial Cue Condition) = 16 invalid combination * 1
numRepsInv = 1;
cueTargetMatInv = repmat(baseMatInv, 1, numRepsInv);

% Neutral
baseMatNeutral = [2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2; ... % Neutral Cue
                  0 1 2 3 4 5 6 7 0 1 2 3 4 5 6 7; ... % Gap Loc
                  0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1];    % Stim Condition
% For 16 Neutral trials (16.6% of Total Trials) = 16 invalid combination * 1
numRepsNeutral = 1;
cueTargetMatNeutral = repmat(baseMatNeutral, 1, numRepsNeutral);

% Combine Valid (64) + Invalid (16) + Neutral (16) = 96 trials total
combinedTrials = [cueTargetMatVal cueTargetMatInv cueTargetMatNeutral];

% Randomise the trials
% combinedTrialsShuff = Shuffle(combinedTrials, 2); < shuffle not working (?)
cols = size(combinedTrials, 2);
randCol = randperm(cols);
combinedTrialsShuff = combinedTrials(:, randCol);


% Total number of trials
numTrials = size(combinedTrialsShuff, 2); % for for loops

% Create blank (at this point) response matrix to save trial type (validity), RT, detection
% correction, and accuracy
dataMatPrimary = nan(numTrials, 11);

%% ------------------- Trigger Start ---------------------

% % Set up the parallel port (Trigger)
% port=serialportlist;
% com = IOPort('OpenSerialPort', char(port(2)), 'DTR=1');
% % Start labelling triggers
% IOPort('Write', com, uint8(254));
% WaitSecs(0.004);
% IOPort('Write', com, uint8(0));

%% ------------------------ Loop -------------------------

% Get time info
startBlock = GetSecs;

% Animation loop: we loop for the total number of trials
for trial = 1:numTrials
    
    % Reset Jitter every loop
    J = 0.1 + ((0.5 - 0.1).* (rand));
    
    % Fixation (Baseline) point time in seconds and frames (JITTER)
    fixTimeSecs2 = fixTimeSecs1 + J;
    fixTimeFrames2 = fixTimeSecs2/ifi;
    % For 96 trials = 2 Time Jitter * 48
    baseMatFixTimeSecs = [0 1];
    numRepsFixTimeSecs = 48; 
    fixTimeFramesMat = repmat(baseMatFixTimeSecs, 1, numRepsFixTimeSecs);
    % Randomise
    cols1 = size(fixTimeFramesMat, 2);
    randCol1 = randperm(cols1);
    fixTimeFramesJitter = fixTimeFramesMat(:, randCol1);
    
    % Spatial Cue (Attention Deployment) point time in seconds and frames (JITTER)
    cueTimeSecs2 = cueTimeSecs1 + J; 
    cueTimeFrames2 = cueTimeSecs2/ifi;
    % For 96 trials = 2 Time Jitter * 48
    baseMatCueTimeSecs = [0 1];
    numRepsCueTimeSecs = 48; 
    cueTimeFramesMat = repmat(baseMatCueTimeSecs, 1, numRepsCueTimeSecs);
    % Randomise
    cols2 = size(cueTimeFramesMat, 2);
    randCol2 = randperm(cols2);
    cueTimeFramesJitter = cueTimeFramesMat(:, randCol2);
    
    % Timing Jitter (Retrieve Matrix)
    fixJit = fixTimeFramesJitter(1, trial);
    cueJit = cueTimeFramesJitter(1, trial);

    % Assign timing jitter
    if fixJit == 0
        fixTimeFrames = fixTimeFrames1;
        fixJitData = 0;
    elseif fixJit == 1
        fixTimeFrames = fixTimeFrames2;
        fixJitData = 1;
    end

    if cueJit == 0
        cueTimeFrames = cueTimeFrames1;
        cueJitData = 0;
    elseif cueJit == 1
        cueTimeFrames = cueTimeFrames2;
        cueJitData = 1;
    end

    % Cue and target position (Retrieve Matrix)
    cuePos = combinedTrialsShuff(1, trial);
    gapLoc = combinedTrialsShuff(2, trial);
    trialType = combinedTrialsShuff(3, trial);

    % Assign the correct cue position (left vs right)
    if cuePos == 0 % left
        colour = colourL;
        pointList = pointListL;
    elseif cuePos == 1 % right
        colour = colourR;
        pointList = pointListR;
    elseif cuePos == 2 % neutral
        colour = colourNC;
        pointList = pointListNC;
    end

    % Assign the correct gap location
    if gapLoc == 0
        loc = loc1; % change loc in loop accordaing to locX (e.g. if gapLoc = 0; loc = loc1
        leftright = left2; % where should the gap appear according to gap (e.g. if loc1 = always left)
        targetLR = 0; % 0 = left; 1 = right; setting every gap on the left/right as 0/1
    elseif gapLoc == 1
        loc = loc2;
        leftright = left2;
        targetLR = 0;
    elseif gapLoc == 2
        loc = loc3;
        leftright = left2;
        targetLR = 0;
    elseif gapLoc == 3
        loc = loc4;
        leftright = left2;
        targetLR = 0;
    elseif gapLoc == 4
        loc = loc5;
        leftright = right2;
        targetLR = 1;
    elseif gapLoc == 5
        loc = loc6;
        leftright = right2;
        targetLR = 1;
    elseif gapLoc == 6
        loc = loc7;
        leftright = right2;
        targetLR = 1;
    elseif gapLoc == 7
        loc = loc8;
        leftright = right2;
        targetLR = 1;
    end

    % Assign Trial Condition (NoGratings vs Gratings)
    if trialType == 0 % NoGratings trial
        gratContrast = 0; % Set gratings contrast accordingly
        ringContrast = 1; % also set the contrast (value must be the same for rings)
    elseif trialType == 1 % Gratings trial
        gratContrast = 0.7; 
        ringContrast = 1;
    end

    % Response (V/I/N - which validity was it)
    if cuePos == 2
        validity = 2; % neutral
    elseif targetLR == cuePos
        validity = 1; % valid
    elseif targetLR ~= cuePos
        validity = 0; % inval
    end 
    
    % Pause Screen
    if trial == 1

        % Draw the instructions        
        openingLine1 = 'Ready to start the experiment?';
        openingLine2 = '\n\n Press any key to start!';
        DrawFormattedText(window, [openingLine1 openingLine2], 'center', 'center', black);
        % Flip to the screen
        Screen('Flip', window);
        % Wait for a key press
        KbStrokeWait(-1);
        % Flip the screen grey
        Screen('FillRect', window, grey);
        vbl = Screen('Flip', window);
        % WaitSecs(2);
    end
    
    % Set the blend funciton for a nice antialiasing
    Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);



    % <<<<<<<<<<<<<<<<<<< TASK FOR-LOOPS START HERE >>>>>>>>>>>>>>>>>>>

    % Between trial interval
    for i = 1:interTrialTimeFrames
        % Set alpha blending
        Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        % Flip screen
        Screen('FillRect', window, grey);
        vbl = Screen('Flip', window);
    end

    % Present FC + FD -----> Fixation Time Window
    for i = 1:fixTimeFrames
        % Set alpha blending
        Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        % Set FC and FD
        Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter*.95], 2); % Cross
        Screen('FramePoly', window, colourFD, pointListFD, penWidth); % FD
        % Set gratings
        Screen('DrawTexture', window, texture, [], left, angle, [], [], grey, [], [], [phase, radialFrequency, gratContrast, sigma, circularFrequency, 0, 0, 0]);
        Screen('DrawTexture', window, texture, [], right, angle, [], [], grey, [], [], [phase, radialFrequency, gratContrast, sigma, circularFrequency, 0, 0, 0]);
        phase = phase + phaseJump;
        % Flip to screen
        vbl = Screen('Flip', window);
        % % Trigger (trial type + fixation label)
        % if i==1
        %     if trialType == 0 % NoGrat
        %         IOPort('Write', com, uint8(1)); % No Gratings
        %         WaitSecs(0.004);
        %         IOPort('Write', com, uint8(0));
        %     elseif trialType == 1 % Grat
        %         IOPort('Write', com, uint8(2)); % Gratings
        %         WaitSecs(0.004);
        %         IOPort('Write', com, uint8(0));
        %     end
        % end
    end

    % Present the FC + Spatial Cue (SC) -----> Attention Time Window
    for i = 1:cueTimeFrames
        % Set alpha blending
        Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        % Set FC, FD, & SC
        Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter*.95], 2); % Cross
        Screen('FramePoly', window, colourFD, pointListFD, penWidth); % FD
        Screen('FramePoly', window, colour, pointList, penWidth); % Spatial Cue
        % Set gratings
        Screen('DrawTexture', window, texture, [], left, angle, [], [], grey, [], [], [phase, radialFrequency, gratContrast, sigma, circularFrequency, 0, 0, 0]);
        Screen('DrawTexture', window, texture, [], right, angle, [], [], grey, [], [], [phase, radialFrequency, gratContrast, sigma, circularFrequency, 0, 0, 0]);
        phase = phase + phaseJump;
        % Flip to screen       
        vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
        % % Trigger (cue appearing label)
        % if i==1
        %     if cuePos == 0 % Left
        %        IOPort('Write', com, uint8(3)); % Left Cue
        %        WaitSecs(0.004);
        %        IOPort('Write', com, uint8(0));
        %     elseif cuePos == 1 % Right
        %        IOPort('Write', com, uint8(4)); % Right Cue
        %        WaitSecs(0.004);
        %        IOPort('Write', com, uint8(0));   
        %     elseif cuePos == 2 % Neutral
        %        IOPort('Write', com, uint8(5)); % Neutral Cue
        %        WaitSecs(0.004);
        %        IOPort('Write', com, uint8(0));
        %     end
        % end
    end

    % Present the FC + SC + Target Onset -----> Target On/Offset Time Window
    for i = 1:tOnOffsetTimeFrames
        % Set alpha blending
        Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        % Set FC, FD, & SC
        Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter*.95], 2); % Cross
        Screen('FramePoly', window, colourFD, pointListFD, penWidth); % FD
        Screen('FramePoly', window, colour, pointList, penWidth); % Spatial Cue
        % Set gratings
        Screen('DrawTexture', window, texture, [], left, angle, [], [], grey, [], [], [phase, radialFrequency, gratContrast, sigma, circularFrequency, 0, 0, 0]);
        Screen('DrawTexture', window, texture, [], right, angle, [], [], grey, [], [], [phase, radialFrequency, gratContrast, sigma, circularFrequency, 0, 0, 0]);
        phase = phase + phaseJump;
        % Set target
        Screen('FrameOval', window, [0 0 0 ringContrast], left2, ringThickness, [], []); % ring
        Screen('FrameOval', window, [0 0 0 ringContrast], right2, ringThickness, [], []); % ring
        Screen('FrameArc', window, grey, leftright, loc, gapDist, ringThickness, ringThickness); % gap
        % Flip to screen       
        vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);        
        % % Trigger (Gap appearance label)
        % if i==1
        %     if gapLoc == 0 %(loc1)
        %         IOPort('Write', com, uint8(6))
        %         WaitSecs(0.004);
        %         IOPort('Write', com, uint8(0));
        %     elseif gapLoc == 1 %(loc2)
        %         IOPort('Write', com, uint8(7));
        %         WaitSecs(0.004);
        %         IOPort('Write', com, uint8(0));
        %     elseif gapLoc == 2 %(loc3)
        %         IOPort('Write', com, uint8(8));
        %         WaitSecs(0.004);
        %         IOPort('Write', com, uint8(0));
        %     elseif gapLoc == 3 %(loc4)
        %         IOPort('Write', com, uint8(9));
        %         WaitSecs(0.004);
        %         IOPort('Write', com, uint8(0));
        %     elseif gapLoc == 4 %(loc5)
        %         IOPort('Write', com, uint8(10));
        %         WaitSecs(0.004);
        %         IOPort('Write', com, uint8(0));
        %     elseif gapLoc == 5 %(loc6)
        %         IOPort('Write', com, uint8(11));
        %         WaitSecs(0.004);
        %         IOPort('Write', com, uint8(0));
        %     elseif gapLoc == 6 %(loc7)
        %         IOPort('Write', com, uint8(12));
        %         WaitSecs(0.004);
        %         IOPort('Write', com, uint8(0));
        %     elseif gapLoc == 7 %(loc8)
        %         IOPort('Write', com, uint8(13));
        %         WaitSecs(0.004);
        %         IOPort('Write', com, uint8(0));
        %     end
        % end
    end


    % Present the FC + SC + Target Detection -----> Target Detection Wait Time Window
    for i = 1:tDetectionTimeFrames
        % Set alpha blending
        Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        % Set FC, FD, & SC
        Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter*.95], 2); % Cross
        Screen('FramePoly', window, colourFD, pointListFD, penWidth); % FD
        Screen('FramePoly', window, colour, pointList, penWidth); % Spatial Cue
        % Set gratings
        Screen('DrawTexture', window, texture, [], left, angle, [], [], grey, [], [], [phase, radialFrequency, gratContrast, sigma, circularFrequency, 0, 0, 0]);
        Screen('DrawTexture', window, texture, [], right, angle, [], [], grey, [], [], [phase, radialFrequency, gratContrast, sigma, circularFrequency, 0, 0, 0]);
        phase = phase + phaseJump;
        % Set rings
        Screen('FrameOval', window, [0 0 0 ringContrast], left2, ringThickness, [], []); % ring
        Screen('FrameOval', window, [0 0 0 ringContrast], right2, ringThickness, [], []); % ring
        % Flip to screen       
        vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);

    end
 
    % Response (Detection)
    respToBeMade = true;
    startResp = GetSecs;
    while respToBeMade
        [keyIsDown,secs, keyCode] = KbCheck(-1);
        if keyCode(esc)
            ShowCursor;
            sca;
            return
        elseif keyCode(locL)
            respDet = 0; % left
            respToBeMade = false;
            % % Trigger (detection response);
            % IOPort('Write', com, uint8(14)); % Detection Key pressed
            % WaitSecs(0.004);
            % IOPort('Write', com, uint8(0));
        elseif keyCode(locR)
            respDet = 1; % right
            respToBeMade = false;
            % % Trigger (detection response);
            % IOPort('Write', com, uint8(14));  % Detection Key pressed
            % WaitSecs(0.004);
            % IOPort('Write', com, uint8(0));
        end
    end
    endResp = GetSecs;
    % Get detection reaction time
    rtDet = endResp - startResp;

    % Response correctness
    if respDet == targetLR
        correctDet = 1; % correct detection
        % % Trigger (correct side response)
        % WaitSecs(0.1);
        % IOPort('Write', com, uint8(15)); % Correct Det
        % WaitSecs(0.004);
        % IOPort('Write', com, uint8(0));
    elseif respDet ~= targetLR
        correctDet = 0; % incorrect detection
        % % Trigger (incorrect side response)
        % WaitSecs(0.1);
        % IOPort('Write', com, uint8(16)); % Incorrect Det
        % WaitSecs(0.004);
        % IOPort('Write', com, uint8(0));
    end

    % In case keyboardpress not released, wait until released to cont.
    % if not, may affect RT
    KbReleaseWait;

    % "Where is the gap" frame
    for i = 1:tAccTimeFrames
        % Set alpha blending
        Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        % Set FC, FD, & SC
        Screen('DrawLines', window, CrossCoords, fcWidth, grey, [xCenter yCenter*.95], 2); % Cross
        Screen('FramePoly', window, grey, pointListFD, penWidth); % FD
        Screen('FramePoly', window, grey, pointList, penWidth); % Spatial Cue
        % Set gratings
        Screen('DrawTexture', window, texture, [], left, angle, [], [], grey, [], [], [phase, radialFrequency, 0, sigma, circularFrequency, 0, 0, 0]);
        Screen('DrawTexture', window, texture, [], right, angle, [], [], grey, [], [], [phase, radialFrequency, 0, sigma, circularFrequency, 0, 0, 0]);
        phase = phase + phaseJump;
        % Ask target detection
        question = 'Where is the gap?';
        Screen('TextSize', window, 60);
        DrawFormattedText(window, question, 'center', 'center', black);
        % Flip to screen
        vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    end

    % Response (Location Accuracy)
    respToBeMade = true;
    startResp2 = GetSecs;
    while respToBeMade
        [keyIsDown,secs, keyCode] = KbCheck(-1);
        if keyCode(esc)
            ShowCursor;
            sca;
            return
        elseif keyCode(loc1Res)
            respAcc = 0;
            respToBeMade = false;
            % % Trigger (accuracy press response)
            % IOPort('Write', com, uint8(17)); % Gap Key pressed
            % WaitSecs(0.004);
            % IOPort('Write', com, uint8(0));
        elseif keyCode(loc2Res)
            respAcc = 1;
            respToBeMade = false;
            % % Trigger (accuracy press response)
            % IOPort('Write', com, uint8(18)); % Gap Key pressed
            % WaitSecs(0.004);
            % IOPort('Write', com, uint8(0));
        elseif keyCode(loc3Res)
            respAcc = 2;
            respToBeMade = false;
            % % Trigger (accuracy press response)
            % IOPort('Write', com, uint8(19)); % Gap Key pressed
            % WaitSecs(0.004);
            % IOPort('Write', com, uint8(0));
        elseif keyCode(loc4Res)
            respAcc = 3;
            respToBeMade = false;
            % % Trigger (accuracy press response)
            % IOPort('Write', com, uint8(20)); % Gap Key pressed
            % WaitSecs(0.004);
            % IOPort('Write', com, uint8(0));
        elseif keyCode(loc5Res)
            respAcc = 4;
            respToBeMade = false;
            % % Trigger (accuracy press response)
            % IOPort('Write', com, uint8(21)); % Gap Key pressed
            % WaitSecs(0.004);
            % IOPort('Write', com, uint8(0));
        elseif keyCode(loc6Res)
            respAcc = 5;
            respToBeMade = false;
            % % Trigger (accuracy press response)
            % IOPort('Write', com, uint8(22)); % Gap Key pressed
            % WaitSecs(0.004);
            % IOPort('Write', com, uint8(0));
        elseif keyCode(loc7Res)
            respAcc = 6;
            respToBeMade = false;
            % % Trigger (accuracy press response)
            % IOPort('Write', com, uint8(23)); % Gap Key pressed
            % WaitSecs(0.004);
            % IOPort('Write', com, uint8(0));
        elseif keyCode(loc8Res)
            respAcc = 7;
            respToBeMade = false;
            % % Trigger (accuracy press response)
            % IOPort('Write', com, uint8(24)); % Gap Key pressed
            % WaitSecs(0.004);
            % IOPort('Write', com, uint8(0));
        end
    end
    endResp2 = GetSecs;
    rtAcc = endResp2 - startResp2;

    if gapLoc == respAcc
        correctAcc = 1; % 1 = correct response
            % % Trigger (Correct gap location)
            % WaitSecs(0.1);
            % IOPort('Write', com, uint8(25)); % Correct Loc
            % WaitSecs(0.004);
            % IOPort('Write', com, uint8(0));
    elseif gapLoc ~= respAcc
        correctAcc = 0; % 0 = incorrect response
            % % Trigger (incorrect gap location)
            % WaitSecs(0.1);
            % IOPort('Write', com, uint8(26));  % Incorrect Loc
            % WaitSecs(0.004);
            % IOPort('Write', com, uint8(0));
    end

    % In case keyboardpress not released, wait until released to cont.
    % if not, may affect RT
    KbReleaseWait;

    % Clear the screen
    Screen('FillRect', window, grey);
    vbl = Screen('Flip', window, vbl + (1 - 0.5) * ifi);

% ---------------------------- SAVE DATA --------------------------------------
    % Put label and responses to a matrix
    dataMatPrimary(trial, :) = [fixJitData cueJitData trialType cuePos targetLR gapLoc validity correctDet rtDet correctAcc rtAcc];
    % Label the columns    
    labels = {'fixJitData', 'cueJitData', 'trialType', 'cuePos', 'targetLR', 'gapLoc', 'validity', 'correctDet', 'rtDet', 'correctAcc', 'rtAcc'};
    resultTable = array2table(dataMatPrimary, 'VariableNames', labels);
    % results\BEH or EEG\UNIQUE_ID\trial_X.csv
    % Set # of block
    writetable(resultTable, ['results\BEH\' num2str(group) '\' num2str(id) '\block_' num2str(blockNum) '.csv']);

end

% Get trial time & save
endBlock = GetSecs;
blockTime = endBlock - startBlock;
csvwrite(['results\BEH\' num2str(group) '\' num2str(id) '\blockTime_' num2str(blockNum) '.csv'], blockTime);

%% -------------------- Close Tigger --------------------
% % Pause recording
% IOPort('Write', com, uint8(255));
% % Close the serial port
% IOPort('Close', com);
% % Stop keyboard response
% ListenChar(0);

%% ------------------------ End -------------------------
DrawFormattedText(window, 'Finished! Press any Key to exit', 'center', 'center', black);
Screen('DrawingFinished', window); 
Screen('Flip', window);
KbStrokeWait(-1);
sca;

%% ------------- Additional Validity Check --------------
% cd(['C:\MATLAB\exp_1\results\BEH\C\' num2str(id)]);
cd(['C:\MATLAB\exp_1\results\BEH\' num2str(group) '\' num2str(id)]);

T = readtable (['block_' num2str(blockNum) '.csv']);
[V1, ID1] = findgroups(T.validity);
[V2, ID2] = findgroups(T.rtDet);

boxplot(V2, V1);
% ylim([0 100]);
title(blockTime);
xlabel('Validity');
ylabel('RT');
xticklabels({'invalid','valid', 'neutral'});

cd C:\MATLAB\exp_1\














