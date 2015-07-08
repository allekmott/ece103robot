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

% Under mount
% white - 480 -490
% blue - 290 -315
% mix 330 - 345

%kill motors
brick.motorReverseSync(wheels, 0, 0);

avgLight = 370; % 337

MAX_POWER = 40;
MIN_POWER = 20;
MAX_STEER = 100;

while true
    power = MAX_POWER;
    senseValue = brick.sensorValue(lightSensor);
    
    % TODO handle red/interactions & end

    diff = (senseValue - avgLight) / 1.5
    powerReduction = 10^(3 - (abs(diff) / 20));
    power = MAX_POWER - powerReduction
    if (power < MIN_POWER)
        power = MIN_POWER;
    end

    if diff < -20 % left; over blue
        fprintf('blue\n');
        if (diff < -40) % realllly blue; turn HARD
            brick.motorForward(leftWheel, 35);
            brick.motorReverse(rightWheel, 35);
            pause(.3);
        else
            steer = -((diff/3) ^ 2)
            if (steer > MAX_STEER)
                steer = MAX_STEER;
            end
            brick.motorReverseSync(wheels, power, steer);
        end
    elseif diff > 20 %right; over white
        fprintf('white\n');
        steer = diff / 1.5
        
        brick.motorReverseSync(wheels, power, steer);
    else %midpoint; over edge
        fprintf('edge\n');
        brick.motorReverseSync(wheels, power, 0);
    end

    %fprintf('Steer: %2.1f\n', steer);
    %fprintf('light: %2.1f\n', senseValue);

end
state = States.FOLLOW_LINE
