function [brick] = intializeBrick()
%Make connection with robot using hardcoded address and returns the initialized brick object
%Additionaly prints firmware version, battery level

brick = lego.NXT(address);
fprintf('---BRICK INITIALIZED---);
fprintf('%s\n',brick.getFirmwareVersion());
fprintf('Battery Level: %d%\n', brick.getBatteryLevel()/100);
