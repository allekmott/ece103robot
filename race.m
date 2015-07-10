function [] = race()

import lego.*;

fprintf('Initializing...\n');

legotest;

brick = initializeBrick();

% sensor initialization moved to initializeBrick()
interaction = 1; 
% initial state
state = States.START_RACE;

brick.playTone(300,600)
pause(.6);
brick.playTone(300,600)
pause(.6);
brick.playTone(300,600)
pause(.6);
brick.playTone(800,800)
pause(.4);




fprintf('Begin state interation; state = %d\n', state);
while state >= 0 % End state = -1
	switch state
        case States.START_RACE
            state = startRace(brick);
            continue
		case States.MOVE_TO_LINE
			state = moveToLine(brick);
			continue
		case States.FOLLOW_LINE
			state = followLine(brick);
			continue
		case States.PROCESS_INTERACTION
			state = processInteraction(brick, interaction);
            interaction = interaction + 1;
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
