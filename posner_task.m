

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

% Validity Setup

% Spatial cue will either be left (0) or right (1) and can be "valid - 0/0 or 1/1" 
% or "invalid - 0/1 or 1/0". Create 2 matrices (valid and invalid) each with 8 
% possible combination of cue and target/gap positions. Then combine to
% achieve 80% validity.

% Valid
baseMatVal = [0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1; ... % Spatial Cue
              0 1 2 3 4 5 6 7 0 1 2 3 4 5 6 7; ... % Gap Loc
              0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1];    % Stim Condition

% For 64 valid trials (80% of Spatial Cue Condition) = 16 valid combination * 6
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

% Make our response matrix which will save the RT and correctness of the
% location choice. We preallocate the matrix with nans.
dataMat = nan(numTrials, 2); % sama ini juga simpen


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
    targetPos = combinedTrialsShuff(2, trial);

    % Logic to assign the correct position to the cue and target
    if cuePos == 0
        cueRect = left;
    elseif cuePos == 1
        cueRect = right;
    end

    if targetPos == 0 || 1 || 2 || 3
        targetRect = left;
    elseif targetPos == 4 || 5 || 6 || 7
        targetRect = rightRect;
    end

    % Set the blend funciton for a nice antialiasing
    Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    % If this is the first trial we present a start screen and wait for a key-press
    if trial == 1

        % Draw the instructions
        openingLine1 = 'The purpose of this study is to assess how the neural oscillations,';
        openingLine2 = '\n or how the brain communicates, differ between migraineurs and non-migraineurs.';
        openingLine3 = '\n You will be presented with centrally fixated visual cues, indicating';
        openingLine4 = '\n which visual field (left or right) to covertly atttend to';
        openingLine5 = '\n (without moving your eyes) to identify a visual target.';
        openingLine6 = '\n\n Press any key to continue.';
        Screen('TextSize', window, 60);
        DrawFormattedText(window, [openingLine1 openingLine2 openingLine3 openingLine4 openingLine5 openingLine6], 'center', 'center', black);

        % Flip to the screen
        Screen('Flip', window);

        % Wait for a key press
        KbStrokeWait(-1);

        % Flip the screen grey
        Screen('FillRect', window, grey);
        vbl = Screen('Flip', window);
        WaitSecs(0.5);

    end

    if trial == 1

        % Draw the instructions        
        openingLine1 = 'Any of the following central visual cues will manifest along the trial:';
        img = imread('C:\Users\Leonardo\Documents\NTU\Task Pics\Diamonds.png');
        imgTexture = Screen('MakeTexture', window, img);
        Screen('DrawTexture', window, imgTexture);
        openingLine2 = '\n\n if left side of diamond turns green (1), you must deploy to your attention to the left side of the screen';
        openingLine3 = '\n if right side of diamond turns green (2), you must deploy to your attention to the right of side the screen';
        openingLine4 = '\n if both sides of diamond turns green (3), you must deploy to your attention to both sides the screen';
        openingLine5 = '\n\n REMEMBER!';
        openingLine6 = '\n Always fixate your eyes on the central cross while your attention is deployed';
        Screen('TextSize', window, 60);
        DrawFormattedText(window, [openingLine1 openingLine2 openingLine3 openingLine4 openingLine5 openingLine6], 'center', 'center', black);


        % Flip to the screen
        Screen('Flip', window);

        % Wait for a key press
        KbStrokeWait(-1);

        % Flip the screen grey
        Screen('FillRect', window, grey);
        vbl = Screen('Flip', window);
        WaitSecs(0.5);

    end



end








%% ----------------------- Close -------------------------


KbWait;
sca; 




















