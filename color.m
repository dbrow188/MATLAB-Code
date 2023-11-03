brick.SetColorMode(3, 2);

while 1 
    brick.MoveMotorAngleRel('AD', 30, 60, 'Coast')
    disp("Motor moved")
    if brick.ColorCode(3) == 5  
        brick.StopAllMotors('Brake');
        pause(1);
        brick.MoveMotorAngleRel('AD', 100, 360, 'Coast')
    end
    if brick.ColorCode(3) == 4
        brick.StopAllMotors('Brake');
        
        disp("It should beep");
        for i = 0: 1: 3    
        brick.beep();
        pause(0.5);
        disp(i);
        end
        brick.MoveMotorAngleRel('AD', 100, 360, 'Coast')
    end

    if brick.ColorCode(3) == 1
        brick.StopAllMotors('Brake');
        disp("Brakes are stopped")
        for i = 0: 1: 2
        brick.beep();
        pause(1);
        end
        brick.MoveMotorAngleRel('AD', 100, 360, 'Brake')
    end

    if brick.ColorCode(3) == 4
        brick.StopAllMotors('Brake');
        
        disp("It should beep");
        for i = 0: 1: 3    
        brick.beep();
        pause(0.5);
        disp(i);
        end
        brick.MoveMotorAngleRel('AD', 100, 360, 'Coast')
    end
    if brick.ColorCode(3) == 3
        brick.StopAllMotors('Brake');
        
        disp("It should beep");
        for i = 0: 1: 2    
        brick.beep();
        pause(0.5);
        disp(i);
        end
        brick.MoveMotorAngleRel('AD', 100, 360, 'Coast')
    end

    if brick.ColorCode(3) == 2
        brick.StopAllMotors('Brake');
        
        disp("It should beep");
        for i = 0: 1: 1  
        brick.beep();
        pause(0.5);
        disp(i);
        end
        brick.MoveMotorAngleRel('AD', 100, 360, 'Coast')
    end
       
end