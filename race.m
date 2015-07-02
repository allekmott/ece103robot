function [] = race(address)

fprintf('Initializing...\n');
brick = initializeBrick();

% sensor initialization moved to initializeBrick()

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
