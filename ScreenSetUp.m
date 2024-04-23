

%-------------------------- !CLOSE ALL IN PRIMARY SCRIPT! ------------------------------

%% default set-up
AssertOpenGL;
PsychDefaultSetup(2);

%% Skip sync tests ** This is for demo purposes only ** It should not be
% done in a real experiment.

Screen('Preference', 'SkipSyncTests', 2);

%% Set the random number generator: RAND, RANDI, and RANDN produce a different sequence

rng('shuffle');

%% Return matrices for primary (0) and secondary (1) monitors.
%      Screen('Screens') gets the monitor numbers (depending how many monitors
%      are connected)

screenNumber = max(Screen('Screens'));

% Define black, white and grey

white = WhiteIndex(screenNumber);
grey = white / 2;
black = BlackIndex(screenNumber);
green = [0 255 0];
blue = [0 0 255];
red = [255 0 0];


%% 'Openwindow': open the screen / defining the parameters of screen.
%     window: the referred screen based on screenNumber.
%     windowRect: size
%          Psychimaging based on Screen

[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey, []);

%% 'Flip' to the set window (i.e. the set monitor)

Screen('Flip', window);

%% Query the frame duration

ifi = Screen('GetFlipInterval', window);

%% Set the text size

Screen('TextSize', window, 40);

%% Query and set the maximum priority level

topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);

%% Get the centre coordinate of the window

[xCenter, yCenter] = RectCenter(windowRect);

%% Set up alpha-blending for smooth (anti-aliased) lines

Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');


%% -------------------------------------------------------------------------------------
%---------------------------------------------------------------------------------------

% -------------------------------------- END -------------------------------------------

%---------------------------------------------------------------------------------------
%---------------------------------------------------------------------------------------



