global key 
InitKeyboard();

x = 1;

while x == 1
    brick.MoveMotorAngleRel('A', 50, 360, 'Coast')
    brick.MoveMotorAngleRel('D', 50, 360, 'Coast')
    pause(2)
    if brick.UltrasonicDist(2) == 255
       brick.StopMotor('A', 'Brake')
       brick.StopMotor('D', 'Brake')
       pause(1)
       brick.MoveMotorAngleRel('A', 70, 40, 'Brake');
       brick.MoveMotorAngleRel('D', 70, -40, 'Brake');
    end
    disp(brick.TouchPressed(4))
    if brick.TouchPressed(4) == 1
        brick.MoveMotorAngleRel('A', 100, -360, 'Brake');
        brick.MoveMotorAngleRel('D', 100, -360, 'Brake');
        pause(3)
        brick.MoveMotorAngleRel('A', 100, 720, 'Brake');
        brick.MoveMotorAngleRel('D', 100, -720, 'Brake');
        pause(5)
    end
    disp(brick.TouchPressed(4))
switch key
    case 'w'
        x = 2;
    case 'q'

        break;
end



end

    