

%% ------------------- Set Workspace ---------------------

close all;
clear;
sca;

% Set-Up Screen Parematers
ScreenSetUp;

%% ------------- Fixation Cross Parameters ---------------
% fc: fixation cross

% Set arms length
fcArms = 10; % 6

% Set cross coordinates
xCoords_fc = [-fcArms fcArms 0 0];
yCoords_fc = [0 0 -fcArms fcArms];
CrossCoords = [xCoords_fc; yCoords_fc];

% Set cross width
fcWidth = 4; % 2

% Draw the fixation cross in black, set it to the center of our screen and
% set good quality antialiasing
% Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter], 2);


%% --------------- Spatial Cue Parameters ----------------
% x = xCenter;
% y = yCenter;

polyWidth = 125; % 65
polyHeight = 125; % 65
penWidth = 50; % 5

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


%% ------------- Bilateral Rings Parameters ---------------

% Set the parameters for the Landolt C + Gratings
innerRadius = 250; % Radius of the ring 125
ringThickness = 20; % Thickness of the ring 10
totalRadius = innerRadius + ringThickness;

% Define Left & Right Positioning of Stimuli
left = [xCenter/2 - totalRadius, yCenter/0.75 - totalRadius, ...
    xCenter/2 + totalRadius, yCenter/0.75 + totalRadius]
right = [xCenter*1.5 - totalRadius, yCenter/0.75 - totalRadius, ...
    xCenter*1.5 + totalRadius, yCenter/0.75 + totalRadius]

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
frequency = 0.04; % cycles/pixel % 0.08

% calculate frequency of both radial and circular gratings
% 2*pi = 360 degrees

middleRadius = circleSize/2;
middlePerimeter = 2*pi*middleRadius; % pixels
radialFrequency = frequency*middlePerimeter / (2*pi); % cycles/degree, must be integral to avoid clip effect, corrected in the frag file
circularFrequency = 0;

% contrast
gratContrast = 1;

% sigma < 0 is a sinusoid.
sigma = 1;

% Preperatory flip
showTime = 3; % ring duration
phaseJump = 7; % Speed of rings
vbl = Screen('Flip', window);
tstart = vbl + ifi; %start is on the next frame

% sigma = -1; % sigma < 0 = sinusoidal grating; > 0 = square grating
cpd = radialFrequency; % save the radialFrequency
radialFrequency = 0;
circularFrequency = frequency;

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
fixTimeFrames = fixTimeSecs / ifi;

% Spatial Cue (Attention Deployment) point time in seconds and frames (1-1.5 secs)
cueTimeSecs = 2;
cueTimeFrames = cueTimeSecs / ifi;

% Target (On/offset) point time in seconds and frames (0.1 secs)
tOnOffsetTimeSecs = 0.1;
tOnOffsetTimeFrames = tOnOffsetTimeSecs / ifi;

% Target (Detection) point time in seconds and frames (1-1.5 secs - lapse time if no response)
tDetectionTimeSecs = 0.1;
tDetectionTimeFrames = tDetectionTimeSecs / ifi;

% Target (Detection Question) point time in seconds and frames
tAccTimeSecs = 0.5;
tAccTimeFrames = tAccTimeSecs / ifi;

% Target (Precision Gap) point time in seconds and frames (0.1 secs);
% Wait for Gap location Response, then cont. to next trial

% Intertrial interval time
isiTimeSecs = 1;
isiTimeFrames = isiTimeSecs / ifi;

% Time between the cue and the target
cueTargetTimeSecs = 3;
cueTargetTimeFrames = isiTimeSecs / ifi;

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
    loc1Res = KbName('f');
    loc2Res = KbName('e');
    loc3Res = KbName('w');
    loc4Res = KbName('a');
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
numRepsVal = 0; 
cueTargetMatVal = repmat(baseMatVal, 1, numRepsVal);

% Invalid
baseMatInv = [0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1; ... % Spatial Cue
              4 5 6 7 0 1 2 3 4 5 6 7 0 1 2 3; ... % Gap Loc
              0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1];    % Stim Condition
% For 16 invalid trials (20% of Spatial Cue Condition) = 16 invalid combination * 1
numRepsInv = 0;
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

% Make our response matrix which will save the RT and correctness of the
% location choice. We preallocate the matrix with nans.
dataMat = nan(numTrials, 4); % sama ini juga simpen

%% ------------------------ Loop -------------------------
% Draw the fixation cross in black, set it to the center of our screen and
% % set good quality antialiasing
% Screen('DrawLines', window, allCoords,...
%     lineWidthPix, black, [xCenter yCenter], 2);

% Animation loop: we loop for the total number of trials
for trial = 1:numTrials

    % % Set Grating parameters (?) randomise
    % phase = rand .* 360;
    % propertiesMat = [phase, freq, sigma, contrast, aspectRatio, 0, 0, 0]';

    % Cue and target position
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
    % Screen('FramePoly', window, colour, pointList, penWidth);

    % Assign the correct gap location
    if gapLoc == 0
        loc = loc1; % change loc in loop accordaing to locX (e.g. if gapLoc = 0; loc = loc1
        leftright = left; % where should the gap appear according to gap (e.g. if loc1 = always left)
        locVal = 0; % 0 = left; 1 = right; setting every gap on the left/right as 0/1
    elseif gapLoc == 1
        loc = loc2;
        leftright = left;
        locVal = 0;
    elseif gapLoc == 2
        loc = loc3;
        leftright = left;
        locVal = 0;
    elseif gapLoc == 3
        loc = loc4;
        leftright = left;
        locVal = 0;
    elseif gapLoc == 4
        loc = loc5;
        leftright = right;
        locVal = 1;
    elseif gapLoc == 5
        loc = loc6;
        leftright = right;
        locVal = 1;
    elseif gapLoc == 6
        loc = loc7;
        leftright = right;
        locVal = 1;
    elseif gapLoc == 7
        loc = loc8;
        leftright = right;
        locVal = 1;
    end
    % Screen('FrameArc', window, grey, left, loc, gapDist, ringThickness, ringThickness);

    % Assign Trial Condition (NoStim vs Gratings)
    if trialType == 0
        gratContrast = 0;
    elseif trialType == 1
        gratContrast = 1;
    end
    % Screen('DrawTexture', window, texture, [], left, angle, [], [], grey, [], [], [phase, radialFrequency, gratContrast, sigma, circularFrequency, 0, 0, 0]);


    % % Set the blend funciton for a nice antialiasing
    % Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    txtSize = 38 % 24
    % Welcome Screen
    if trial == 1

        % Draw the instructions
        openingLine1 = 'Welcome! the purpose of this study is to assess how the neural oscillations,';
        openingLine2 = '\n or how the brain communicates, differ between migraineurs and non-migraineurs.';
        openingLine3 = '\n You will be presented with centrally fixated visual cues, indicating';
        openingLine4 = '\n which visual field (left or right) to covertly atttend to';
        openingLine5 = '\n (without moving your eyes) to identify a visual target.';
        openingLine6 = '\n\n Press any key to continue.';
        Screen('TextSize', window, txtSize);
        DrawFormattedText(window, [openingLine1 openingLine2 openingLine3 openingLine4 openingLine5 openingLine6], 'center', 'center', black);

        % Flip to the screen
        Screen('Flip', window);

        % Wait for a key press
        KbStrokeWait(-1);

        % Flip the screen grey
        Screen('FillRect', window, grey);
        vbl = Screen('Flip', window);
        % WaitSecs(0.5);

    end

    % Instructional Screen 1 (Fixation)
    if trial == 1

        % Draw the instructions        
        openingLine1 = '\n\n\n\n\n\n At the beginning of each trial, you must FIXATE your eyes on this central cross:';
        Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter*.95], 2);
        Screen('FramePoly', window, colourFD, pointListFD, penWidth);
        openingLine2 = '\n\n\n\n\n after some time, the diamond will change colour, instructing you to';
        openingLine3 = '\n  shift your attention to the LEFT, RIGHT, or BOTH sides of the screen without moving your eyes';
        openingLine4 = '\n\n This indicates a target will or most likely appear on that relevant side';
        openingLine5 = '\n\n REMEMBER!';
        openingLine6 = '\n Always fixate your eyes on the central cross while you shift your attention.';
        Screen('TextSize', window, txtSize);
        DrawFormattedText(window, [openingLine1 openingLine2 openingLine3 openingLine4 openingLine5 openingLine6], 'center', 'center', black);


        % Flip to the screen
        Screen('Flip', window);

        % Wait for a key press
        KbStrokeWait(-1);

        % Flip the screen grey
        Screen('FillRect', window, grey);
        vbl = Screen('Flip', window);
        % WaitSecs(0.5);

    end

    % Instructional Screen 2 (Left Cue)
    if trial == 1

        % Draw the instructions        
        openingLine1 = '\n\n\n\n\n\n Any of the following central visual cues will manifest along the trial:';
        Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter*.95], 2);
        Screen('FramePoly', window, colourFD, pointListFD, penWidth);
        Screen('FramePoly', window, colourL, pointListL, penWidth);
        openingLine2 = '\n\n\n\n\n if the LEFT side of diamond turns green,';
        openingLine3 = '\n shift your attention to the LEFT side of the screen!';
        openingLine4 = '\n\n This indicate a target will most likely appear on the LEFT.';
        openingLine5 = '\n\n REMEMBER!';
        openingLine6 = '\n Always fixate your eyes on the central cross while you shift your attention.';
        Screen('TextSize', window, txtSize);
        DrawFormattedText(window, [openingLine1 openingLine2 openingLine3 openingLine4 openingLine5 openingLine6], 'center', 'center', black);


        % Flip to the screen
        Screen('Flip', window);

        % Wait for a key press
        KbStrokeWait(-1);

        % Flip the screen grey
        Screen('FillRect', window, grey);
        vbl = Screen('Flip', window);
        % WaitSecs(0.5);

    end

    % Instructional Screen 3 (Right Cue)
    if trial == 1

        % Draw the instructions        
        openingLine1 = '\n\n\n\n\n\n Any of the following central visual cues will manifest along the trial:';
        Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter*.95], 2);
        Screen('FramePoly', window, colourFD, pointListFD, penWidth);
        Screen('FramePoly', window, colourR, pointListR, penWidth);
        openingLine2 = '\n\n\n\n\n if the RIGHT side of diamond turns green,';
        openingLine3 = '\n shift your attention to the RIGHT side of the screen!';
        openingLine4 = '\n\n This indicate a target will most likely appear on the RIGHT.';
        openingLine5 = '\n\n REMEMBER!';
        openingLine6 = '\n Always fixate your eyes on the central cross while you shift your attention.';
        Screen('TextSize', window, txtSize);
        DrawFormattedText(window, [openingLine1 openingLine2 openingLine3 openingLine4 openingLine5 openingLine6], 'center', 'center', black);


        % Flip to the screen
        Screen('Flip', window);

        % Wait for a key press
        KbStrokeWait(-1);

        % Flip the screen grey
        Screen('FillRect', window, grey);
        vbl = Screen('Flip', window);
        % WaitSecs(0.5);

    end
    
    % Instructional Screen 4 (Neutral Cue)
    if trial == 1

        % Draw the instructions        
        openingLine1 = '\n\n\n\n\n\n Any of the following central visual cues will manifest along the trial:';
        Screen('DrawLines', window, CrossCoords, fcWidth, black, [xCenter yCenter*.95], 2);
        Screen('FramePoly', window, colourFD, pointListFD, penWidth);
        Screen('FramePoly', window, colourNC, pointListNC, penWidth);
        openingLine2 = '\n\n\n\n\n if BOTH sides of diamond turns green,';
        openingLine3 = '\n shift your attention to both LEFT and RIGHT side of the screen!';
        openingLine4 = '\n\n This indicate a target will appear on EITHER sides of the screen.';
        openingLine5 = '\n\n REMEMBER!';
        openingLine6 = '\n Always fixate your eyes on the central cross while you shift your.';
        Screen('TextSize', window, txtSize);
        DrawFormattedText(window, [openingLine1 openingLine2 openingLine3 openingLine4 openingLine5 openingLine6], 'center', 'center', black);


        % Flip to the screen
        Screen('Flip', window);

        % Wait for a key press
        KbStrokeWait(-1);

        % Flip the screen grey
        Screen('FillRect', window, grey);
        vbl = Screen('Flip', window);
        % WaitSecs(0.5);

    end

    % Instructional Screen 5 (Target)
    if trial == 1

        % Draw the instructions        
        openingLine1 = 'The target will be A GAP on the outer ring of appearing BILATERAL RINGS';
        openingLine2 = '\n While deploying your attention, you are instructed to respond (as fast as possible)';
        openingLine3 = '\n to the appearing gap AND to identify the precise location of the gap.';
        openingLine4 = '\n\n\n REMEMBER!';
        openingLine5 = '\n Always fixate your eyes on the central cross while your attention is moved';
        openingLine6 = '\n\n 8 Possible gap locations:';
        openingLine7 = '\n CLOCKWISE from bottom left gap on left ring (1) to bottom right gap on right ring (8)';
        openingLine8 = '\n\n\n\n\n\n\n\n\n\n\n\n\n';
        Screen('TextSize', window, txtSize);
        DrawFormattedText(window, [openingLine1 openingLine2 openingLine3 openingLine4 openingLine5 ...
            openingLine6 openingLine7 openingLine8], 'center', 'center', black);
        
        % Left
        Screen('FrameOval', window, black, left, ringThickness, [], []);
        % Right
        Screen('FrameOval', window, black, right, ringThickness, [], []);

        % loc1
        Screen('FrameArc', window, grey, left, 200, gapDist, ringThickness, ringThickness);
        % loc2
        Screen('FrameArc', window, grey, left, 240, gapDist, ringThickness, ringThickness);
        % loc3
        Screen('FrameArc', window, grey, left, 280, gapDist, ringThickness, ringThickness);
        % loc4
        Screen('FrameArc', window, grey, left, 320, gapDist, ringThickness, ringThickness);
        
        % Right
        % loc5
        Screen('FrameArc', window, grey, right, 20, gapDist, ringThickness, ringThickness);
        % loc6
        Screen('FrameArc', window, grey, right, 60, gapDist, ringThickness, ringThickness);
        % loc7
        Screen('FrameArc', window, grey, right, 100, gapDist, ringThickness, ringThickness);
        % loc8
        Screen('FrameArc', window, grey, right, 140, gapDist, ringThickness, ringThickness);



        % Flip to the screen
        Screen('Flip', window);

        % Wait for a key press
        KbStrokeWait(-1);

        % Flip the screen grey
        Screen('FillRect', window, grey);
        vbl = Screen('Flip', window);
        % WaitSecs(0.5);

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
        % WaitSecs(0.5);

    end

    % Set the blend funciton for a nice antialiasing
    Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

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
        Screen('FrameOval', window, black, left, ringThickness, [], []); % ring
        Screen('FrameOval', window, black, right, ringThickness, [], []); % ring
        Screen('FrameArc', window, grey, leftright, loc, gapDist, ringThickness, ringThickness); % gap
        % Flip to screen       
        vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    end

    % Present the FC + SC + Target Detection -----> Target Detection Question Time Window
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
        Screen('FrameOval', window, black, left, ringThickness, [], []); % ring
        Screen('FrameOval', window, black, right, ringThickness, [], []); % ring
        % Flip to screen       
        vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    end
 
    % Response (V/I/N - which validity was it)
    if cuePos == 0
        cuePosVal = 0;
    elseif cuePos == 1
        cuePosVal = 1;
    elseif cuePos == 2
        cuePosVal = 2;
    end 

    if cuePos == 2
        validity = 2; % neutral
    elseif locVal == cuePos
        validity = 1; % valid
    elseif locVal ~= cuePos
        validity = 0; % inval
    end 

    % Response (Detection RT)
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
        elseif keyCode(locR)
            respDet = 1; % right
            respToBeMade = false;
        end
    end
    endResp = GetSecs;
    rt = endResp - startResp;

    % Response (Detection - correct/incorrect)
    if respDet == locVal
        correctDet = 1; % correct detection
    elseif respDet ~= locVal
        correctDet = 0; % incorrect detection
    end

    % Present Detection Question -----> Target Detection Time Window
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
        % Set rings
        Screen('FrameOval', window, black, left, ringThickness, [], []); % ring
        Screen('FrameOval', window, black, right, ringThickness, [], []); % ring
        % Ask target detection
        openingLine1 = 'Where is the gap?';
        Screen('TextSize', window, 60);
        DrawFormattedText(window, [openingLine1], 'center', 'center', black);
        % Flip to screen
        vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    end

    % Response (Location Accuracy)
    respToBeMade = true;
    % startResp = GetSecs;
    while respToBeMade
        [keyIsDown,secs, keyCode] = KbCheck(-1);
        if keyCode(esc)
            ShowCursor;
            sca;
            return
        elseif keyCode(loc1Res)
            respAcc = 0;
            respToBeMade = false;
        elseif keyCode(loc2Res)
            respAcc = 1;
            respToBeMade = false;
        elseif keyCode(loc3Res)
            respAcc = 2;
            respToBeMade = false;
        elseif keyCode(loc4Res)
            respAcc = 3;
            respToBeMade = false;
        elseif keyCode(loc5Res)
            respAcc = 4;
            respToBeMade = false;
        elseif keyCode(loc6Res)
            respAcc = 5;
            respToBeMade = false;
        elseif keyCode(loc7Res)
            respAcc = 6;
            respToBeMade = false;
        elseif keyCode(loc8Res)
            respAcc = 7;
            respToBeMade = false;
        end
    end

    if gapLoc == respAcc
        correctAcc = 1; % 1 = correct response
    elseif gapLoc ~= respAcc
        correctAcc = 0; % 0 = incorrect response
    end

    % Clear the screen ready for a response
    Screen('FillRect', window, grey);
    vbl = Screen('Flip', window, vbl + (1 - 0.5) * ifi);

% ---------------------------- SAVE DATA --------------------------------------
    % Put label and responses to a matrix
    dataMat(trial, :) = [validity rt correctDet correctAcc];
    
    % save matrix to csv to different folder in the same directory (\t = 1 column)
    % results\BEH or EEG\UNIQUE_ID\trial_X.csv
    writematrix(dataMat, [cd filesep 'results\BEH\SLI000\trial_1.csv'], 'Delimiter', ',')

    % % Inter trial interval black screen. Note that the timestamp for the
    % % initial frame will be missed due to the first vbl being "old" due to
    % % the response loop. I leave it as an excercise to the reader as to how
    % % one could fix this simply.
    % for i = 1:isiTimeFrames
    %     Screen('FillRect', window, grey);
    %     vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    % end
    % 
    % % If this is the last trial we present screen saying that the experimet
    % % is over.
    % Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    % if trial == numTrials
    % 
    %     % Draw the instructions: in reality the person could press any of
    %     % the listened to keys to exist. But they do not know that.
    %     DrawFormattedText(window, 'Trial Finished! press ESCAPE to exit', 'center', 'center', black);
    % 
    %     % Flip to the screen
    %     vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    % 
    %     % Wait for a key press
    %     KbStrokeWait(-1);
    % 
    % end


end

%% ------------------------ End -------------------------
DrawFormattedText(window, 'Finished! Press any Key.', 'center', 'center', black);
Screen('DrawingFinished', window); 
Screen('Flip', window);
KbStrokeWait(-1);
sca













