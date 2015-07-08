function [state] = followLine(brick)

lightSensor = lego.NXT.IN_1;

%both wheels A and C together
wheels = lego.NXT.OUT_AC;

leftWheel = lego.NXT.OUT_A;
rightWheel = lego.NXT.OUT_C;

% Approx light ranges on desktop -- may be different in race box
% all blue tape ~285-295
% mix ~330-360
% white ~450-460

avgLight = 350;

MAX_POWER = 50;
MIN_POWER = 20;
MAX_STEER = 100;

while true
    power = MAX_POWER;

    steer = 0;
    senseValue = brick.sensorValue(lightSensor);


    % TODO handle red/interactions & end

    steer = (senseValue - avgLight) / 1.5
    if abs(steer) > MAX_STEER
        steer = MAX_STEER;
    end
%    power = power - (abs(steer) / 2);
%    if power < MIN_POWER
%        power = MIN_POWER;
%    end

    right = (steer > 0); % 1 for right, 0 for left
    steerPower = abs(steer) / 2; % woo
    if steer < 50 % left; over blue
        brick.motorForward(leftWheel, steerPower);
        brick.motorReverse(rightWheel, steerPower);
    else
        if right
            steer = steer / 1.5;
            power = power / 1.25;
        end
        brick.motorReverseSync(wheels, power, steer);
    end
    
    % Second argument is power, increase after testing
    %brick.motorReverseSync(wheels, power, steer); 

    %fprintf('Steer: %2.1f\n', steer);
    %fprintf('light: %2.1f\n', senseValue);

end
state = States.FOLLOW_LINE
