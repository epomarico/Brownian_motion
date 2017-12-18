% This function generates and plots in time one trajectory of a 1D Brownian motion

function W=brownian_motion_1D(n,h,print_motion_1D)
    % Inputs: n: number of steps
    %         h: step
    %         print_motion_1D: logical variable for chossing to print the trajectory
    % Outputs: W: 1 x n vector of the Brownian motion 
    
    % Generates Brownian increments
    DeltaW = randn(1,n)*sqrt(h); % randn generates random numbers between 0 and 1 
                                 % gaussian probability distribution with mean 0 and
                                 % variance 1. By multiplying by sqrt(h) we
                                 % obtain a variance of sqrt(h)
    
    % Generates 1D Brownian trajectory. Adds 0 at the beginning of the trajectory                             
    Wn = cumsum(DeltaW);    W=[0 Wn];
 
    % Print 1D Brownian trajectory if print_motion_1D is true
    if print_motion_1D == true 
        figure; plot(W);xlim([0 n]);
        ylabel('\fontsize{16}W');    
        xlabel('\fontsize{16}t');
    end
    
    
end
