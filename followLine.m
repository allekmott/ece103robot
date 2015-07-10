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
% black - 100
%red = 140 - 150
%red -blue = 125 - 130

%kill motors
brick.motorReverseSync(wheels, 0, 0);

MAX_POWER = 40;
MIN_POWER = 20;
MAX_STEER = 100;

avgLight = 400; % 337
BLUE_THRESH = 0; % threshold until hard turn in blue
BLUE_PAUSE = .3;

cyclesInWhite = 0;

%red 150
%rb = 120 - 140
%rbw - 400

%other side red 140
%rb - 120

lastVal = 0;
while true
    power = MAX_POWER;
    senseValue = brick.sensorValue(lightSensor);
    
    if senseValue < 290
        if (senseValue > 70 && senseValue < 200) % some sort of red
            brick.playTone(783.99,400);
            brick.motorReverseSync(wheels, 30, 0);
            state = States.PROCESS_INTERACTION;
        elseif (senseValue < 90)
            state = States.PLAY_SONG;
        else
            brick.playTone(10000,400); 
            brick.motorReverseSync(wheels, 30, 0);
            continue;
        end
        pause(.1);
        break;
    end
    % TODO handle red/interactions & end

    diff = (senseValue - avgLight) / 1.5
    powerReduction = 10^(3 - (abs(diff) / 20));
    power = MAX_POWER - powerReduction
    if (power < MIN_POWER)
        power = MIN_POWER;
    end

    if diff < BLUE_THRESH % left; over blue
        cyclesInWhite = 0;
        fprintf('blue\n');
        %if (diff < BLUE_THRESH) % realllly blue; turn HARD
            brick.motorForward(leftWheel, 35);
           brick.motorReverse(rightWheel, 35);
            pause(BLUE_PAUSE);
        %else
        %    steer = -((diff/3) ^ 2);
        %    if (steer > MAX_STEER)
        %        steer = MAX_STEER;
        %    end
        %    brick.motorReverseSync(wheels, power, steer);
        %end
    elseif diff > 20 %right; over white
        
        %fprintf('white\n');
        cyclesInWhite = cyclesInWhite + 1
        
        if (cyclesInWhite > 20)
            cyclesInWhite = 0;
        end
        
        power = power * .8;
        power = power * (1 + (cyclesInWhite / 20));
        if power > 60 % lotsa time in white, reverse
            brick.motorForward(rightWheel, 50);
            brick.motorReverse(leftWheel, 50);
        else    
            steer = diff / 1.5
            brick.motorReverseSync(wheels, power, steer);
        end
        lastVal = senseValue;
    %else %midpoint; over edge
        %fprintf('edge\n');
     %   brick.motorReverseSync(wheels, power, 0);
    end

    %fprintf('Steer: %2.1f\n', steer);
    %fprintf('light: %2.1f\n', senseValue);

end

