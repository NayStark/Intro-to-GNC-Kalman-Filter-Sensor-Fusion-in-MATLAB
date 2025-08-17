# Kalman Filter Sensor Fusion: GPS + IMU Navigation in MATLAB

This project demonstrates how to estimate the position and velocity of a moving vehicle using a **Kalman Filter** that fuses **noisy GPS** and **IMU acceleration** data in MATLAB. It showcases foundational techniques in **Guidance, Navigation, and Control (GNC)**.

## 🛰️ Project Summary

- Simulated 1D vehicle motion with constant acceleration
- Synthetic sensor measurements:
  - Noisy GPS (low-frequency position)
  - Noisy IMU (high-frequency acceleration)
- Kalman Filter used to:
  - Predict system state from a physics-based motion model
  - Correct estimates using noisy GPS data
- Visual comparison of true state, raw measurements, and filtered estimates

## Output

<p align="center">
<img width="1592" height="682" alt="image" src="https://github.com/user-attachments/assets/154a8cda-6c26-4409-b93a-0399c77045ac" />
</p>
