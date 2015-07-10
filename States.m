classdef States
	properties (Constant)
        % move forward, but pause to avoid black/blue confusion,
        % then hand off to move to line
        START_RACE = 0;
        
		% move forward until you see blue
		MOVE_TO_LINE = 1;

		% line follow state, follow line until interrupted
		FOLLOW_LINE = 2;

		% interrupted, process through interaction
		PROCESS_INTERACTION = 3;

		% see black, play song and then end
		PLAY_SONG = 4;

		% finished with maze, terminate process
		END = -1;
	end
end