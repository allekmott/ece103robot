function [state] = imperialMarch(brick)

F3	=174.61;
Ab3	=207.65;
LA3	=220.00;
Bb3	=233.08;
B3	=246.94;
C4	=261.63;
Db4	=277.18;
D4	=293.66;
Eb4	=311.13;
E4	=329.63;
F4	=349.23;
Gb4	=369.99;
G4	=392.00;
Ab4	=415.30;
LA4	=440.00;

BPM = 120; %beats/min
Q = 60000/BPM; %quarter 1/4 1 second at 60bpm
H = 2*Q; %half 2/4
E = Q/2; %eighth 1/8
S = Q/4; % sixteenth 1/16
%W = 4*Q; % whole 4/4

    wheels = lego.NXT.OUT_AC;
    
    brick.motorReverseSync(wheels, 40, 0);
    pause(1.059001);
    
    rightWheel = lego.NXT.OUT_C;
    leftWheel = lego.NXT.OUT_A;
    brick.motorForward(rightWheel, 40);
    brick.motorReverse(leftWheel, 40);
    
	brick.playTone(LA3,Q); 
    pause((1+Q)/1000);
    brick.playTone(LA3,Q);
    pause((1+Q)/1000);
    brick.playTone(LA3,Q);
    pause((1+Q)/1000);
    brick.playTone(F3,E+S);
    pause((1+E+S)/1000);
    brick.playTone(C4,S);
    pause((1+S)/1000);
    
    brick.playTone(LA3,Q);
    pause((1+Q)/1000);
    brick.playTone(F3,E+S);
    pause((1+E+S)/1000);
    brick.playTone(C4,S);
    pause((1+S)/1000);
    brick.playTone(LA3,H);
    pause((1+H)/1000);
    
    brick.playTone(E4,Q); 
    pause((1+Q)/1000);
    brick.playTone(E4,Q);
    pause((1+Q)/1000);
    brick.playTone(E4,Q);
    pause((1+Q)/1000);
    brick.playTone(F4,E+S);
    pause((1+E+S)/1000);
    brick.playTone(C4,S);
    pause((1+S)/1000);
    
    brick.playTone(Ab3,Q);
    pause((1+Q)/1000);
    brick.playTone(F3,E+S);
    pause((1+E+S)/1000);
    brick.playTone(C4,S);
    pause((1+S)/1000);
    brick.playTone(LA3,H);
    pause((1+H)/1000);
    
    brick.playTone(LA4,Q);
    pause((1+Q)/1000);
    brick.playTone(LA3,E+S);
    pause((1+E+S)/1000);
    brick.playTone(LA3,S);
    pause((1+S)/1000);
    brick.playTone(LA4,Q);
    pause((1+Q)/1000);
    brick.playTone(Ab4,E+S);
    pause((1+E+S)/1000);
    brick.playTone(G4,S);
    pause((1+S)/1000);
    
    brick.playTone(Gb4,S);
    pause((1+S)/1000);
    brick.playTone(E4,S);
    pause((1+S)/1000);
    brick.playTone(F4,E);
    pause((1+E)/1000);
    pause((1+E)/1000);
    brick.playTone(Bb3,E);
    pause((1+E)/1000);
    brick.playTone(Eb4,Q);
    pause((1+Q)/1000);
    brick.playTone(D4,E+S);
    pause((1+E+S)/1000);
    brick.playTone(Db4,S);
    pause((1+S)/1000);
    
    brick.playTone(C4,S);
    pause((1+S)/1000);
    brick.playTone(B3,S);
    pause((1+S)/1000);
    brick.playTone(C4,E);
    pause((1+E)/1000);
    pause((1+E)/1000);
    brick.playTone(F3,E);
    pause((1+E)/1000);
    brick.playTone(Ab3,Q);
    pause((1+Q)/1000);
    brick.playTone(F3,E+S);
    pause((1+E+S)/1000);
    brick.playTone(LA3,S);
    pause((1+S)/1000);
    
    brick.playTone(C4,Q);
    pause((1+Q)/1000);
    brick.playTone(LA3,E+S);
    pause((1+E+S)/1000);
    brick.playTone(C4,S);
    pause((1+S)/1000);
    brick.playTone(E4,H);
    pause((1+H)/1000);
    
    brick.playTone(LA4,Q);
    pause((1+Q)/1000);
    brick.playTone(LA3,E+S);
    pause((1+E+S)/1000);
    brick.playTone(LA3,S);
    pause((1+S)/1000);
    brick.playTone(LA4,Q);
    pause((1+Q)/1000);
    brick.playTone(Ab4,E+S);
    pause((1+E+S)/1000);
    brick.playTone(G4,S);
    pause((1+S)/1000);
    
    brick.playTone(Gb4,S);
    pause((1+S)/1000);
    brick.playTone(E4,S);
    pause((1+S)/1000);
    brick.playTone(F4,E);
    pause((1+E)/1000);
    pause((1+E)/1000);
    brick.playTone(Bb3,E);
    pause((1+E)/1000);
    brick.playTone(Eb4,Q);
    pause((1+Q)/1000);
    brick.playTone(D4,E+S);
    pause((1+E+S)/1000);
    brick.playTone(Db4,S);
    pause((1+S)/1000);
    
    brick.playTone(C4,S);
    pause((1+S)/1000);
    brick.playTone(B3,S);
    pause((1+S)/1000);
    brick.playTone(C4,E);
    pause((1+E)/1000);
    pause((1+E)/1000);
    brick.playTone(F3,E);
    pause((1+E)/1000);
    brick.playTone(Ab3,Q);
    pause((1+Q)/1000);
    brick.playTone(F3,E+S);
    pause((1+E+S)/1000);
    brick.playTone(C4,S);
    pause((1+S)/1000);
    
    brick.playTone(LA3,Q);
    pause((1+Q)/1000);
    brick.playTone(F3,E+S);
    pause((1+E+S)/1000);
    brick.playTone(C4,S);
    pause((1+S)/1000);
    brick.playTone(LA3,H);
    pause((1+H)/1000);
    
    pause((2*H)/1000);

state = States.END;