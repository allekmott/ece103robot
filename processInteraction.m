
function [state] = processInteraction(brick, interaction)
    
    leftWheel = lego.NXT.OUT_A;
    rightWheel = lego.NXT.OUT_C;
    wheels = lego.NXT.OUT_AC;
    lightSensor = lego.NXT.IN_1;
    
	if interaction == 1
		fprintf('Interaction 1\n');
        
        brick.motorReverseSync(wheels, 50, 0);
        pause(.5)
        
        brick.motorReverseSync(wheels, 60, 21); % power 40, steer 20
        pause(6);
        state = States.MOVE_TO_LINE;
    elseif interaction == 2
		fprintf('Interaction 2\n');
        
        %brick.motorReverse(rightWheel, 30);
        %brick.motorBrake(leftWheel);
        %pause(.3);
        
		%turnDegrees(brick, 25);
        %turnDegrees(brick, -25);
        
        fprintf('dont care bitch\n');
        state = States.FOLLOW_LINE;
    else
		fprintf('Interaction ..wait wtf?\n');
        brick.playTone(5000,400);
        state = States.FOLLOW_LINE;
	end

	
end

    
    