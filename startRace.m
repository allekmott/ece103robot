function [ state ] = startRace( brick )
    wheels = lego.NXT.OUT_AC;
    brick.motorReverseSync(wheels, 30, 0);
    pause(1.5)
    
    state = States.MOVE_TO_LINE;
end

