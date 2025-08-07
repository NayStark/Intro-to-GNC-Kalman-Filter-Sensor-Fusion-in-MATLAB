dt = 0.1;
t = 0:dt:20;
a_real = 1.2;
v_real = a_real*t;
x_real = 0.5*a_real * t.^2;

gps_noise = 5*randn(size(t));
imu_noise = 0.2*randn(size(t));

x_gps = x_real + gps_noise;
a_imu = a_real + imu_noise;

A = [1 dt; 0 1];
B = [0.5*dt^2; dt];
H = [1 0];

x_est = zeros(2, length(t));
P = eye(2);
Q = [0.01 0; 0 0.1];
R = 25;
x_est(:,1) = [0; 0];

for k = 2:length(t)
    x_est(:,k) = A * x_est(:,k-1) + B * a_imu(k-1);
    P = A * P * A' + Q;

    y = x_gps(k) - H * x_est(:,k);
    S = H * P * H' + R;
    K = P * H' / S;
    x_est(:,k) = x_est(:,k) + K * y;
    P = (eye(2) - K * H) * P;
end

figure;
plot(t, x_real, 'k-', 'LineWidth', 2); hold on;
plot(t, x_gps, 'r.', 'DisplayName', 'GPS');
plot(t, x_est(1,:), 'b-', 'LineWidth', 2);
legend('True Position', 'GPS Measurement', 'Kalman Estimate');
xlabel('Time [s]');
ylabel('Position');
title('Kalman Filter for GPS/IMU Fusion');
grid on;