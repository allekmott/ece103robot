function [state] = followLine(brick)

lightSensor = lego.NXT.IN_1;

%both wheels A and C together
wheels = lego.NXT.OUT_AC;

% Approx light ranges on desktop -- may be different in race box
% all blue tape ~285-295
% mix ~330-360
% white ~450-460

avgLight = 345;

MAX_POWER = 30;
power = MAX_POWER;

steer = 0;
senseValue = brick.sensorValue(lightSensor);

% TODO handle red/interactions & end

steer = senseValue - avgLight;
power = power - (steer / 10);

if steer > 100 
    steer = 100;
elseif steer < -100
    steer = -100;
end

% Second argument is power, increase after testing
brick.motorReverseSync(wheels, power, steer); 

fprintf('Steer: %2.1f\n', steer);
%fprintf('light: %2.1f\n', senseValue);

state = States.FOLLOW_LINE