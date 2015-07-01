function [] = race(address)

fprintf('Initializing...\n');

brick = lego.NXT(address);

% assign sensor ports
lightSensor = lego.NXT.IN_1;
leftWheel = lego.NXT.OUT_A;
rightWheel = lego.NXT.OUT_C;

% both wheels together
wheels = lego.NXT.OUT_AC;

% brick.setSensorColorFull(lightSensor);
% ^ old; initializes color sensor in RGB mode
initColorSensor = brick.setInputMode(lightSensor, 15, 0);
if initColorSensor == 0
    fprintf('\tReset light sensor\n');
    brick.resetInputScaledValue(lightSensor);
end

% (port,power,turnRatio) 0 = straight ahead, -100 to 100


% initial state
state = States.FOLLOW_LINE;

fprintf('Begin state interation; state = %d', state);
while state >= 0 % End state = -1
	switch state
		case States.MOVE_TO_LINE
			state = moveToLine(brick);
			continue
		case States.FOLLOW_LINE
			state = followLine(brick);
			continue
		case States.PROCESS_INTERACTION
			state = processInteract(brick);
			continue
		case States.PLAY_SONG
			state = imperialMarch(brick);
			continue
	end
end

% end state
fprintf('Done?');

% Terminate NXT process
brick.close();
