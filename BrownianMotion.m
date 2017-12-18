% BROWNIAN MOTION
%
% This program generates a brownian motion or Wiener process, in 1 and 2 dimensions.
% and  plots some trajectories. In addition, it also simulates M trajectories, it shows
% their mean and variance, and estimates numerically some moments 
% E(x)=0, E(x^2)=t and E(x^4)=3t^2

% Initialize random number generator
randn('state',400);

% Initialize time parameters for generating the brownian motion
T = 1000; % Max time interval
h=1;      % step
N=T/h;    % number of steps in the time interval

% Generate and plot (if print_motion is true) a 1D Brownian motion in [0,T]
print_motion_1D=true;
W=brownian_motion_1D(N,h,print_motion_1D);

% Generate and plot (if print_motion is true) a 2D Brownian motion in [0,T]
print_motion_2D=true;
W2D=brownian_motion_2D(N,h,print_motion_2D);

% Generate and plot M trajectories of the 1D Brownian motion in [0,T]
N=1000; % number of steps
M=1000; % number of trajectories 

T=10; h=T/N; tn=0:h:T; % T: max time interval; h: step; tn: time vector

W_all=zeros(M,N+1); % matrix with all M trajectories (M rows) over N steps 
                    % (N+1 columns with the starting value W=0)

% Print M trajectories on the same plot
figure(2);
for i=1:M
   W_all(i,:)=brownian_motion_1D(N,h,false);
   plot(tn,W_all(i,:))
   hold on
end
ylabel('\fontsize{16}W');    
xlabel('\fontsize{16}t');

% Calculate and plot mean and variance of all M trajectories
m=mean(W_all);
v=var(W_all);
figure(3); 
subplot(1,2,1); 
plot(tn,m); ylabel('\fontsize{16}Mean of W(T)'); xlabel('\fontsize{16}t'); 
subplot(1,2,2);
plot(tn,v); ylabel('\fontsize{16}Variance of W(T)'); xlabel('\fontsize{16}t'); 

% Estimate numerically and plot the moments E(W(t)), E(W^2(t)) and E(W^4(t)) 
% of all M trajectories
exp1=(1/M)*sum(W_all);
exp2=(1/M)*sum(W_all.^2);
exp4=(1/M)*sum(W_all.^4);

xline=0:0.01:T; % vector for the xaxis of the theorical curves

close all

figure(4);
subplot(1,3,1);plot(tn,exp1);
hold on
yline=zeros(1,length(xline)); l1=plot(xline,yline,'r'); ylim([-0.1 0.1]); % plot E(W(t)) = t as a reference
ylabel('\fontsize{16}E[W(t)]'); xlabel('\fontsize{16}t'); hold off
legend(l1,'\fontsize{16}E[W(t)]=0','Location','southeast');
legend boxoff

subplot(1,3,2), plot(tn,exp2);
hold on
l2=plot(xline,xline,'r'); ylabel('\fontsize{16}E[W^2(t)]'); xlabel('\fontsize{16}t'); % plot E(W^2(t)) = t as a reference
legend(l2,'\fontsize{16}E[W(t)] = t','Location','southeast');legend boxoff;

subplot(1,3,3), plot(tn,exp4);
hold on
l3=plot(xline,3*(xline.^2),'r');ylabel('\fontsize{16}E[W^4(t)]'); xlabel('\fontsize{16}t'); % plot E(W^4(t)) = 3t^2 as a reference
legend(l3,'\fontsize{16}E[W(t)] = 3t^2','Location','southeast');legend boxoff;


