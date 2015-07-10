function [ state ] = moveToLine( brick )
%moveToLine Move up to blue line

fprintf('Moving to line\n');

lightSensor = lego.NXT.IN_1;
wheels = lego.NXT.OUT_AC;
brick.motorReverseSync(wheels, 30, 0);

senseValue = brick.sensorValue(lightSensor);
while ~(senseValue > 280 && senseValue < 350)
    fprintf('Moving to line\n');
    brick.motorReverseSync(wheels, 40, 0);
    senseValue = brick.sensorValue(lightSensor);
end
brick.playTone(783.99,400); 
pause(0.4);
state = States.FOLLOW_LINE;

% if senseValue < 350 && senseValue > 250
%     brick.playTone(783.99,400);
%     pause(0.4);
%     state = States.FOLLOW_LINE;
% else
%     state = States.MOVE_TO_LINE;
% end

end

