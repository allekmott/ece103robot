function [state] = followLine()

address = '00165311686b'
brick = lego.NXT(address)
brick.getBatteryLevel() /9000


lightSensor = lego.NXT.IN_1;
leftWheel = lego.NXT.OUT_A;
rightWheel = lego.NXT.OUT_C;

%both wheels together
wheels = lego.NXT.OUT_AC;

retVal = brick.setInputMode(lightSensor, 15, 0);
if retVal == 0
    fprintf('lolwut\n');
    brick.resetInputScaledValue(lightSensor);
end
pause(5);

%all blue tape ~285-295 closer ang 290
%mix ~330 - 360
%white ~450-460

%sensorValue = brick.sensorValue(lego.NXT.IN_1)
tic % start timer
steer = 0;
brick.motorReverseSync(wheels,10,steer);
while toc < 15
    senseValue = brick.sensorValue(lightSensor);
    
    if senseValue > 380
        steer = steer + 1;
    else
        steer = 0;
    end
    
    
    brick.motorReverseSync(wheels,50,steer);
    
    
    fprintf('Steer: %2.1f\n', steer);
    %fprintf('light: %2.1f\n', senseValue);
end
brick.close();
