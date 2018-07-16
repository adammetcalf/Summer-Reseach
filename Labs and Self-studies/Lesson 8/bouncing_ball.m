% Bouncing_ball.m determines the velocity and position of a bouncing  ball based on initial 
%velocity and height and the coefficient of restitution

clear;
clc;
 
% Intitialise parameters
g = -9.81;
time = 0;
dt = 0.02;
index=1;
height=5;
velocity=0;
Cr=0.5;
new_height=height;
% start while loop that will stop once the ball stops bouncing or time
% exceeds 20s
while (height > 0.01 || abs(velocity) > 0.1) && time < 20
% Check floor contact
actual_time(index) = time;
actual_height(index) = new_height; 
actual_velocity(index)=velocity;
new_height = height + velocity*dt+0.5*g*dt^2;
if height <= 0 && velocity <= 0 % Checks for ground contact
velocity = -(velocity+(g*dt))*Cr; % If contact made reverse direction 
else
velocity = velocity+(g*dt); % Otherwise
end
time = time+dt; % Increment time and index
index = index+1;
height=new_height;
end 

plot(actual_time, actual_height, actual_time, actual_velocity);
xlabel('time (sec)');
ylabel('position (m) / velocity(m/s)');
legend('position', 'velocity');