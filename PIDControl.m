disp("LBYCPC3 - PID Control")
disp("CHUA, Kendrick Dayle J." + ...
    "MANALANSAN, Sean Patrick T." + ...
    "MAYUGA, Zachary Brent L.")
disp("Transfer Function: numerator = [C], denominator[A B C]")

%Question 1
A = input("What is the value of the A:");
B = input("What is the value of the B:");
C = input("What is the value of the C:");

sys = tf([C],[A B C]);
sys1 = feedback(sys,-1);

figure;
subplot(2,2,1)

impulse(sys1)
subplot(2,2,2)

step(sys1)
subplot(2,2,3)

t = 0:0.01:1;
rampTime = t;
ramp = lsim(sys1,rampTime,t);
plot(t,ramp)
title('Ramp Response');
subplot(2,2,4)

parabolicTime = t.^2/2;
parabolic = lsim(sys1,parabolicTime,t);
plot(t,parabolicTime)
title('Parabolic Response');

figure;
pzmap(sys1)

%Question 2
Kp = input("What is the value of the Kp:");
Kd = input("What is the value of the Kd:");
Ki = input("What is the value of the Ki:");

sys2 = pid(Kp,Ki,Kd);
sys3 = feedback(sys1*sys2,1);

figure;
subplot(2,2,1)

impulse(sys3)
subplot(2,2,2)

step(sys3)
subplot(2,2,3)

t = 0:0.01:1;
rampTime = t;
ramp = lsim(sys3,rampTime,t);
plot(t,ramp)
title('Ramp Response');
subplot(2,2,4)

parabolicTime = t.^2/2;
parabolic = lsim(sys3,parabolicTime,t);
plot(t,parabolicTime)
title('Parabolic Response');

figure;
pzmap(sys3)