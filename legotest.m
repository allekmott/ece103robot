function legotest()

% Make Connection
import lego.*;
%brick = NXT('0016530AB5F7')
brick = NXT('0016530EAB22');
brick.getFirmwareVersion()
brick.close();
