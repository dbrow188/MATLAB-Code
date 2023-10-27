global key 
InitKeyboard();

x = 1;
brick.GyroCalibrate(1);
target = 0;



while x == 1
    disp("Target 1");
    %{
    if brick.UltrasonicDist(2) == 255
       brick.StopMotor('A', 'Brake')
       brick.StopMotor('D', 'Brake')
       pause(1)
       brick.MoveMotorAngleRel('A', 70, 40, 'Brake');
       brick.MoveMotorAngleRel('D', 70, -40, 'Brake');
    end
    %}


     if brick.UltrasonicDist(2) < 255
        disp("Target 2");
        brick.MoveMotorAngleRel('AD', 40, 100, 'Coast');
     end
     if brick.TouchPressed(4) == 1

            disp("Target 3");
            disp(brick.TouchPressed(4));
            target = brick.GyroAngle(1) - 90;
            brick.StopAllMotors('Brake');
            brick.MoveMotorAngleRel('AD', 100, -360, 'Brake');
            pause(3);
                while brick.GyroAngle(1) >= target
                disp(brick.GyroAngle(1));
                brick.MoveMotorAngleRel('A', 30, 30,'Coast');
                brick.MoveMotorAngleRel('D', 30, -30, 'Coast');
                end
     end 
        
     %{
     elseif brick.UltrasonicDist(2) <= 20 && brick.UltrasonicDist(2) >= 19
        brick.MoveMotorAngleRel('AD', 50, 100, 'Coast')
        pause(1);
    elseif brick.UltrasonicDist(2) > 20
        brick.StopAllMotors('Coast')
        brick.MoveMotorAngleRel('A', 30, -10, 'Coast')
        brick.MoveMotorAngleRel('D', 30, 40, 'Coast')
       
    elseif brick.UltrasonicDist(2) < 19
        brick.StopAllMotors('Coast')
        brick.MoveMotorAngleRel('A', 40, 10, 'Coast')
        brick.MoveMotorAngleRel('D', 30,-10, 'Coast')
        brick.MoveMotorAngleRel('AD', 40,)
        
    end 
    disp(brick.TouchPressed(4));
     %}
     %{
    if brick.TouchPressed(4) == 1
        brick.StopAllMotors('Brake');
        brick.MoveMotorAngleRel('AD', 100, -360, 'Brake');
        pause(2)
        brick.MoveMotorAngleRel('A', 100, 700, 'Brake');
        brick.MoveMotorAngleRel('D', 100, -700, 'Brake');
        pause(3)
        
    end 
    disp(brick.TouchPressed(4))
     %}
switch key
    case 'w'
        x = 2;
    case 'q'
        break;
    case 'e'
        brick.StopAllMotors('Brake');
end

end

    