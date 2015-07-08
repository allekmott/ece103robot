function [state] = followLineTWO(brick)

lightSensor = lego.NXT.IN_1;

%both wheels A and C together
wheels = lego.NXT.OUT_AC;
leftWheel = lego.NXT.OUT_A;
rightWheel = lego.NXT.OUT_C;

% Approx light ranges on desktop -- may be different in race box
% all blue tape ~285-295
% mix ~330-360
% white ~450-460
K = 2/170;
Kp = K * 50;
Tp = 25; % target power
offset = 350;
error = 0;

while true
    senseValue = brick.sensorValue(lightSensor);
    fprintf('light: %2.1f\n', senseValue);
    
    error = senseValue - offset
    
    if abs(error) < 15
        error = 0;
    end
    
    Turn = Kp * error;
    %Turn = Turn /Kp;
    powerA = Tp + Turn;
    powerC = Tp - Turn;
    
    if powerA > 0
        brick.motorReverse(leftWheel, powerA);
    else
        brick.motorForward(leftWheel, powerA); % (Ports, Percentage Power, Degrees Rotation)
    end
    if powerC > 0
        brick.motorReverse(rightWheel, powerC);
    else
        brick.motorForward(rightWheel, powerC);
    end
    %fprintf('Steer: %2.1f\n', steer);
    %fprintf('light: %2.1f\n', senseValue);

end
state = States.FOLLOW_LINE
