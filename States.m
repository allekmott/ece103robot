classdef States
	properties (Constant)
		% initial state, move forward until you see blue
		MOVE_TO_LINE = 0;

		% line follow state, follow line until interrupted
		FOLLOW_LINE = 1;

		% interrupted, process through interaction
		PROCESS_INTERACTION = 2;

		% see black, play song and then end
		PLAY_SONG = 3;

		% finished with maze, terminate process
		END = -1;
	end
end