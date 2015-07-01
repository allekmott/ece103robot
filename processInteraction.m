interaction = 0;

function [state] = followLine(brick)
	interaction = interaction + 1;

	if interaction == 1
		fprintf('Interaction 1\n');
		% TODO code for interaction 1
	else if interaction == 2
		fprintf('Interaction 2\n');
		% TODO code for interaction 2
	else
		fprintf('Interaction ..wait wtf?\n');
	end

	% Finished processing interaction, revert to follow state
	state = States.FOLLOW_LINE;
end