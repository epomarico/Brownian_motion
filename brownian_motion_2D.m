% This function generates and plots one trajectory of a 2D Brownian motion
% in XY plane 

function W2D=brownian_motion_2D(n,h,print_motion_2D)
    % Inputs: n: number of steps
    %         h: step
    %         print_motion_2D: logical variable for chossing to print the trajectory
    % Outputs: W: struct with two 1 x n vector fields for the x and y coordinates  
    
    W2D = struct();
    
    %Brownian trajectory along x axis
    W2D.x = cumsum([0 randn(1,n)]*sqrt(h));
    
    %Brownian trajectory along y axis
    W2D.y = cumsum([0 randn(1,n)]*sqrt(h));

    % Print 2D Brownian trajectory in xy plane if print_motion_1D is true
    if print_motion_2D == true 
        figure;
        plot(W2D.x, W2D.y);
        ylabel('\fontsize{16}Position Y');
        xlabel('\fontsize{16}Position X');
    end
    
end
