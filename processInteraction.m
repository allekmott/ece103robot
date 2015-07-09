
function [state] = processInteraction(brick, interaction)
    
    leftWheel = lego.NXT.OUT_A;
    rightWheel = lego.NXT.OUT_C;
    lightSensor = lego.NXT.IN_1;
    
	if interaction == 1
		fprintf('Interaction 1\n');
        time = 1.5;
        power = 50;
        senseValue = brick.sensorValue(lightSensor);
        iteration = 0;
        while ~(senseValue < 350 && senseValue > 250)
            brick.motorReverse(rightWheel, power);
            brick.motorBrake(leftWheel);
            senseValue = brick.sensorValue(lightSensor);
            if iteration == 0
                pause(.3);
            end
            iteration = iteration + 1;
        end
        
%         pause(.4);
%         brick.motorForward(rightWheel, 30);
%         brick.motorForward(leftWheel, 30);
        pause(.4);
        brick.motorBrake(leftWheel);
        brick.motorBrake(rightWheel);
		% TODO code for interaction 1
        
        %turnDegrees(brick, 90);
        
        brick.motorReverse(rightWheel, power);
        brick.motorReverse(leftWheel, power);
        pause(time);
        %brick.motorBrake(leftWheel);
       % brick.motorBrake(rightWheel);
		% TODO code for interaction 1
        
        turnDegrees(brick, -90);
        brick.motorReverse(rightWheel, power);
        brick.motorReverse(leftWheel, power);
        pause(time);
        brick.motorBrake(leftWheel);
        brick.motorBrake(rightWheel);
        
        turnDegrees(brick, -90);
        state = States.MOVE_TO_LINE;
	else if interaction == 2
		fprintf('Interaction 2\n');
		% TODO code for interaction 2
        fprintf('Fuck this shit br0 \n');
	else
		fprintf('Interaction ..wait wtf?\n');
	end

	
    end

    
    
