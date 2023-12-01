global key 
x = 1;

brick.GyroCalibrate(1);
target = 0;

brickPress = 0;

brick.SetColorMode(3, 2);


while x == 1
    disp(brick.UltrasonicDist(2));
    while brick.UltrasonicDist(2) <= 35
        disp("Driving");
        brick.MoveMotorAngleRel('DA', 45, 360, 'Brake');
        brickPress = brick.TouchPressed(4);
        disp(brickPress);
        disp("Detecting Color");
        if brick.ColorCode(3) == 5 
            disp("RED RED RED RED")
            brick.StopAllMotors('Brake');
            pause(2);
        end
     if brickPress == 1
        disp("Button Pressed");
        target = target + 90;
        brick.StopAllMotors('Brake');
        pause(0.5);
        brick.MoveMotorAngleRel('AD', 100, -360, 'Brake');
        pause(1.5);
            while brick.GyroAngle(1) <= target
                disp(brick.GyroAngle(1));
                brick.MoveMotorAngleRel('A', 40, -40,'Brake');
                brick.MoveMotorAngleRel('D', 40, 40, 'Brake');
            end
            pause(0.5);
            while brick.GyroAngle(1) >= target
                    disp(brick.GyroAngle(1));
                    brick.MoveMotorAngleRel('A', 20, 10,'Brake')
            end
            while brick.GyroAngle(1) <= target
                    disp(brick.GyroAngle(1));
                    brick.MoveMotorAngleRel('D', 20, 5,'Brake')
            end

            pause(0.5);
            
            brickPress = 0;
            pause(1);
     end 
     


switch key
    case 'w'
        x = 0;
    case 'q'
        break;
end
    end
    if brick.UltrasonicDist(2) > 35 && brick.UltrasonicDist(2) < 256
        target = target - 90;
        brick.MoveMotorAngleRel('AD', 100, 360, 'Brake')
        pause(1.5);
        disp("Turning Should Start")
            while brick.GyroAngle(1) >= target
                disp("Should be Turning")
                disp(brick.GyroAngle(1));
                brick.MoveMotorAngleRel('A', 40, 40,'Brake');
                brick.MoveMotorAngleRel('D', 40, -40, 'Brake');
            end
            disp("Begin Correcting")
            while brick.GyroAngle(1) <= target
                disp(brick.GyroAngle(1));
                brick.MoveMotorAngleRel('D', 20, 10, 'Brake');
            end
            pause(1);
            while brick.UltrasonicDist(2) > 25
                brick.MoveMotorAngleRel('DA', 30, 180, 'Brake')
                pause(0.25)
                disp("reading color")
                if brick.ColorCode(3) == 5 
                disp("RED RED RED RED")
                brick.StopAllMotors('Brake');
                pause(2);
                brick.MoveMotorAngleRel('AD', 40, 360, 'Brake')
                pause(1);
                end
            end
            pause(1);
            brick.MoveMotorAngleRel('AD', 50, 360, 'Brake');
            brick.StopAllMotors('Brake');
     end

     
end

while x == 0
    pause(0.001);
    switch key
        case 'uparrow'
            brick.MoveMotorAngleRel('AD', 50, 120, 'Brake');
            

        case 'downarrow'
            brick.MoveMotorAngleRel('AD', 50, -90, 'Brake');
            
        case 'leftarrow'
            brick.MoveMotorAngleRel('A', 70, 20, 'Brake');
            brick.MoveMotorAngleRel('D', 70, -20, 'Brake');
                   

        case 'rightarrow'
            
            brick.MoveMotorAngleRel('D', 70, 20, 'Brake');
            brick.MoveMotorAngleRel('A', 30, -20, 'Brake');



        case 'z'
            brick.MoveMotorAngleRel('B', 100, -110, 'Brake');

        case 'x'
            brick.MoveMotorAngleRel('B', 100, 110, 'Brake');




        case 'q'

            break;
    end
end
CloseKeyboard();
    