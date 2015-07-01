function [] = race(address)

brick = lego.NXT(address);

%assign sensors
lightSensor = lego.NXT.IN_1;
leftWheel = lego.NXT.OUT_A;
rightWheel = lego.NXT.OUT_C;

%both wheels together
wheels = lego.NXT.OUT_AC;

brick.setSensorColorFull(lightSensor);

%(port,power,turnRatio) 0 = straight ahead, -100 to 100

while true

brick.motorForwardSync(wheels,50,50);
pause(.1);

end
%findStart(brick)

%follow line until RED
    %then return
%handle first interaction

%findLine()

%followLine 

pause(1); %stops entire thread
%may be better to use tic/toc or timeelapsed
sensorData = brick.sensorValue(lightSensor);

imperialMarch(brick);
fprintf('Done?');
brick.close();
