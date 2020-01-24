
global c

c.m_0 = 9.10938215e-31;  % electron mass
c.q_0 = 1.60217653e-19;  % electron charge


E_field = 5; %V/m
F = E_field * c.q_0; %Newtons

a = F / c.m_0; % m/s^2

timesteps = 1000;
dt = 1e-10;
t = 0;
x = 0;
Vx = 0;
sprob = 0.05;
Vtotal = 0;
count = 0;

for i = 1: timesteps
   
  dvx = a * dt;
  Vx = Vx + dvx;
  chance = rand;
  
  if(chance <= sprob)
       Vx = -0.5 * Vx;
  end
  
  dx = Vx*dt;    
  
  x = x + dx;
  t = t + dt;
  
  count = count + 1;
  Vtotal = Vtotal + Vx;
  Vavg = Vtotal / count;
  
 subplot(2,1,1);
 plot(t, x, 'r.');
 xlabel('Time (s)');
 ylabel('Position in X (m)');
 hold on;
 
 subplot(2,1,2);
 hold on;
 plot(t, Vavg, 'g.')
 plot(t, Vx, 'r.');
 title('Average V: ' + string(Vavg));
 xlabel('Time (s)');
 ylabel('Velocity in X');

 
 pause(0.001);
 
end

