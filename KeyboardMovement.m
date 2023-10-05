global key 
InitKeyboard();

while 1 
    pause(0.001);
    switch key
        case 'uparrow'
            brick.MoveMotor('A', 100)
            brick.MoveMotor('D', 100)

        case 'downarrow'
            brick.MoveMotor('A', -100)
            brick.MoveMotor('D', -100)
            
        case 'leftarrow'
            brick.MoveMotor('A', -100)
            brick.MoveMotor('D', 100)
            
        

        case 'rightarrow'
            brick.MoveMotor('A', 100)
            brick.MoveMotor('D', -100)


        case 'z'
            brick.MoveMotorAngleRel('A', 100, -110, 'Brake');

        case 'x'
            brick.MoveMotorAngleRel('A', 100, 110, 'Brake');




        case 'q'

            break;
    end
end
CloseKeyboard();