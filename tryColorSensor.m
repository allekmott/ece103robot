function [ ] = tryColorSensor( address )
brick = lego.NXT(address);
colorSensorPort = lego.NXT.IN_1;
retVal = brick.setInputMode(colorSensorPort, 15, 0);
if retVal == 0
    fprintf('lolwut\n');
    brick.resetInputScaledValue(lego.NXT.IN_1);
end
%all blue tape ~285-295 closer ang 290
%mix ~330 - 360
%white ~450-460
tic
% Under mount
% white - 480 -490
% blue - 290 -315
% mix 330 - 345

while true
    brick.sensorValue(lego.NXT.IN_1)
    
%     if color == black
%         fprintf('Color: %s\n', 'black');
%     elseif color == blue
%         fprintf('Color: %s\n', 'blue');
%     elseif color == green
%         fprintf('Color: %s\n', 'green');
%     elseif color == yellow
%         fprintf('Color: %s\n', 'yellow');
%     elseif color == red
%         fprintf('Color: %s\n', 'red');
%     elseif color == white
%         fprintf('Color: %s\n', 'white');
%     end

end
brick.close();

