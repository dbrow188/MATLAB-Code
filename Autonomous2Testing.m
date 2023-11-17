global key 
InitKeyboard();
x = 1;

brick.GyroCalibrate(1);
target = 0;

brickPress = 0;

brick.SetColorMode(3, 2);


while x == 1
    disp("Target 1")
    disp(brick.UltrasonicDist(2));
    while brick.UltrasonicDist(2) <= 35 && brick.UltrasonicDist(2) > 0
        disp("Target 2");
        brick.MoveMotorAngleRel('D', 20, 360, 'Coast');
        brick.MoveMotorAngleRel('A', 15, 360, 'Coast')
        brickPress = brick.TouchPressed(4);
     disp(brickPress);
     if brickPress == 1
        disp("Target 3");
        target = target - 90;
        brick.StopAllMotors('Brake');
        pause(1);
        brick.MoveMotorAngleRel('AD', 100, -360, 'Brake');
        pause(3);
            while brick.GyroAngle(1) >= target
                disp(brick.GyroAngle(1));
                brick.MoveMotorAngleRel('A', 40, 20,'Coast');
                brick.MoveMotorAngleRel('D', 40, -20, 'Coast');
            end
            while brick.GyroAngle(1) <= target
                    disp(brick.GyroAngle(1));
                    brick.MoveMotorAngleRel('D', 40, 20,'Brake')
            end
            brickPress = 0;
        disp("It should have started turning I have no clue what is doing")
     end 

        if brick.ColorCode(3) == 5  
            brick.StopAllMotors('Brake');
            pause(3);
            brick.MoveMotorAngleRel('AD', 40, 360, 'Brake')
        elseif brick.ColorCode(3) == 4
            brick.StopAllMotors('Brake');
            for i = 0: 1: 3    
                brick.beep();
                pause(0.5);
                disp(i);
            end
            x = 0;

        elseif brick.ColorCode(3) == 3
            brick.StopAllMotors('Brake');
        
            disp("It should beep");
            for i = 0: 1: 2    
            brick.beep();
            pause(0.5);
            disp(i);
            end
            brick.MoveMotorAngleRel('AD', 100, 360, 'Coast')
    
        elseif brick.ColorCode(3) == 2
            brick.StopAllMotors('Brake');
            for i = 0: 1: 1  
                brick.beep();
            pause(0.5);
            disp(i);
            end
            x = 0;
        end


switch key
    case 'w'
        x = 0;
    case 'q'
        break;
end
    end
    if brick.UltrasonicDist(2) > 35 && brick.UltrasonicDist(2) < 256
        target = target + 90;
        brick.MoveMotorAngleRel('AD', 100, 360, 'Coast')
        pause(3);
        disp("Turning Should Start")
            while brick.GyroAngle(1) <= target
                disp("Should be Turning")
                disp(brick.GyroAngle(1));
                brick.MoveMotorAngleRel('A', 40, -80,'Coast');
                brick.MoveMotorAngleRel('D', 60, 80, 'Coast');
            end
            while brick.GyroAngle(1) >= target
                disp(brick.GyroAngle(1));
                brick.MoveMotorAngleRel('A', 40, 20, 'Coast');
            end
            pause(0.5);
            while brick.UltrasonicDist(2) > 25
                brick.MoveMotorAngleRel('AD', 20, 120, 'Coast')
                pause(0.5)
            end
            pause(1);
            brick.MoveMotorAngleRel('AD', 50, 360, 'Coast');
     end

     
end

while x == 0
    pause(0.1);
    switch key
        case 'uparrow'
            brick.MoveMotorAngleRel('AD', 50, 60, 'Brake');
            

        case 'downarrow'
            brick.MoveMotorAngleRel('AD', 50, -40, 'Brake');
            
        case 'leftarrow'
            brick.MoveMotorAngleRel('A', 70, 40, 'Brake');
            brick.MoveMotorAngleRel('D', 70, -40, 'Brake');
           

        case 'rightarrow'
            brick.MoveMotorAngleRel('A', 50, -40, 'Brake');
            brick.MoveMotorAngleRel('D', 70, 40, 'Brake');


        case 'z'
            brick.MoveMotorAngleRel('B', 100, -110, 'Brake');

        case 'x'
            brick.MoveMotorAngleRel('B', 100, 110, 'Brake');

        case 'e'
            x = 1;

        case 'q'

            break;
    end
end
CloseKeyboard();
    