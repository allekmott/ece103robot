function [] = race(address)

fprintf('Initializing...\n');

brick = lego.NXT(address);

%assign sensor ports
lightSensor = lego.NXT.IN_1;
leftWheel = lego.NXT.OUT_A;
rightWheel = lego.NXT.OUT_C;

%both wheels together
wheels = lego.NXT.OUT_AC;

% brick.setSensorColorFull(lightSensor);
% ^ old; initializes color sensor in RGB mode
initColorSensor = brick.setInputMode(lightSensor, 15, 0);
if initColorSensor == 0
    fprintf('\tReset light sensor\n');
    brick.resetInputScaledValue(lightSensor);
end

% (port,power,turnRatio) 0 = straight ahead, -100 to 100

% initial state, move forward until you see blue
STATE_MOVE_TO_LINE = 0;

% line follow state, follow line until interrupted
STATE_FOLLOW_LINE = 1;

% interrupted, process through interaction
STATE_INTERACTION = 2;

% see black, play song and then end
STATE_SONG = 3;

% finished with maze, terminate process
STATE_END = -1;

% initial
state = STATE_MOVE_TO_LINE


fprintf('Begin state interation; state = %d', state);
while state >= 0
	switch state
		case STATE_MOVE_TO_LINE
			state = moveToLine(brick);
			continue
		case STATE_FOLLOW_LINE
			state = followLine(brick);
			continue
		case STATE_INTERACTION
			state = processInteract(brick);
			continue
		case STATE_SONG
			state = imperialMarch(brick);
			continue
	end
end

% end state
fprintf('Done?');

% Terminate NXT process
brick.close();
