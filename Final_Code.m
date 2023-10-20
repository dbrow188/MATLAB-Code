global key 
InitKeyboard();

while 1 
    pause(0.001);
    switch key
        case 'uparrow'
            brick.MoveMotorAngleRel('A', 100, 40, 'Brake');
            brick.MoveMotorAngleRel('D', 100, 40, 'Brake');

        case 'downarrow'
            brick.MoveMotorAngleRel('A', 100, -40, 'Brake');
            brick.MoveMotorAngleRel('D', 100, -40, 'Brake');
            
        case 'leftarrow'
            brick.MoveMotorAngleRel('A', 70, 40, 'Brake');
            brick.MoveMotorAngleRel('D', 70, -40, 'Brake');
           

        case 'rightarrow'
            brick.MoveMotorAngleRel('A', 70, -40, 'Brake');
            brick.MoveMotorAngleRel('D', 70, 40, 'Brake');


        case 'z'
            brick.MoveMotorAngleRel('B', 100, -110, 'Brake');

        case 'x'
            brick.MoveMotorAngleRel('B', 100, 110, 'Brake');





        case 'q'

            break;
    end
end
CloseKeyboard();