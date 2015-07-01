function [] = followLine(brick)

colorSensorPort = lego.NXT.IN_1;
retVal = brick.setInputMode(colorSensorPort, 15, 0);
if retVal == 0
    fprintf('lolwut\n');
    brick.resetInputScaledValue(lego.NXT.IN_1);
end
%all blue tape ~285-295 closer ang 290
%mix ~330 - 360
%white ~450-460

%sensorValue = brick.sensorValue(lego.NXT.IN_1)

while true
    sensorValue = brick.sensorValue(lego.NXT.IN_1)
    if sensorVale 
    
end
