global key 
InitKeyboard();

x = 1;
brick.GyroCalibrate(1);
target = 0;

brickPress = brick.TouchPressed(4);

brick.SetColorMode(3, 2);


while x == 1
    disp("Target 1")
    disp(brick.UltrasonicDist(2));
     if brick.UltrasonicDist(2) <= 35 && brick.UltrasonicDist(2) > 0
        disp("Target 2");
        brick.MoveMotorAngleRel('AD', 40, 240, 'Brake');
        
     elseif brick.UltrasonicDist(2) > 35 && brick.UltrasonicDist(2) < 256
        target = target + 90;
        brick.MoveMotorAngleRel('AD', 100, 360, 'Coast')
        pause(1);
            while brick.GyroAngle(1) <= target
            disp(brick.GyroAngle(1));
            brick.MoveMotorAngleRel('A', 40, -20,'Coast');
            brick.MoveMotorAngleRel('D', 40, 20, 'Coast');
            end
            while brick.GyroAngle(1) >= target
            disp(brick.GyroAngle(1));
            brick.MoveMotorAngleRel('A', 20, 10, 'Coast');
            end
            pause(1);
            while brick.UltrasonicDist(2) > 25
                brick.MoveMotorAngleRel('AD', 20, 100, 'Coast')
                pause(0.5)
            end
            brick.MoveMotorAngleRel('AD', 30, 180, 'Coast');
            pause(1);
     end


     disp(brick.TouchPressed(4));
     brickPress = brick.TouchPressed(4);
     if brickPress == 1
        brickPress = 0;
        disp("Target 3");
        disp(brick.TouchPressed(4));
        target = target - 90;
        brick.StopAllMotors('Brake');
        brick.MoveMotorAngleRel('AD', 100, -360, 'Brake');
        pause(3);
            while brick.GyroAngle(1) >= target
                disp(brick.GyroAngle(1));
                brick.MoveMotorAngleRel('A', 40, 20,'Coast');
                brick.MoveMotorAngleRel('D', 40, -20, 'Coast');
            end
            while brick.GyroAngle(1) <= target
                    disp(brick.GyroAngle(1));
                    brick.MoveMotorAngleRel('D', 20, 20,'Brake')
            end
            pause(1);
     end 

        if brick.ColorCode(3) == 5  
            brick.StopAllMotors('Brake');
            pause(1);
            brick.MoveMotorAngleRel('AD', 100, 360, 'Coast')
    
        elseif brick.ColorCode(3) == 4
            brick.StopAllMotors('Brake');
        
            disp("It should beep");
            for i = 0: 1: 3    
                brick.beep();
                pause(0.5);
                disp(i);
            end
            brick.MoveMotorAngleRel('AD', 100, 360, 'Coast')

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
        
            disp("It should beep");
            for i = 0: 1: 1  
                brick.beep();
            pause(0.5);
            disp(i);
            end
            brick.MoveMotorAngleRel('AD', 100, 360, 'Coast')
        end


switch key
    case 'w'
        x = 2;
    case 'q'
        break;
    case 'e'
        brick.StopAllMotors('Brake');
end
end

while x == 0
    pause(0.001);
    switch key
        case 'uparrow'
            brick.MoveMotorAngleRel('AD', 100, 60, 'Brake');
            

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
    