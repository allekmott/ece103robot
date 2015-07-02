function [brick] = intializeBrick()
% Make connection with robot using hardcoded address and returns the initialized brick object
% Additionaly prints to console the firmware version and battery level

brick = lego.NXT(address);
fprintf('---BRICK INITIALIZED---\n');

% TODO - set port locations as constants for global use
% assign sensor ports
lightSensor = lego.NXT.IN_1;
leftWheel = lego.NXT.OUT_A;
rightWheel = lego.NXT.OUT_C;

% both wheels together
wheels = lego.NXT.OUT_AC;

% brick.setSensorColorFull(lightSensor);
% ^ old; initializes color sensor in RGB mode
initColorSensor = brick.setInputMode(lightSensor, 15, 0);
if initColorSensor == 0
    fprintf('\tReset light sensor\n');
    brick.resetInputScaledValue(lightSensor);
end
fprintf('---COLOR SENSOR INITIALIZED---\n');

fprintf('%s\n',brick.getFirmwareVersion());
fprintf('Battery Level: %d%\n', brick.getBatteryLevel()/100);
