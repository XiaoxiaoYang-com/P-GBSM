# A Physics-Enhanced Stochastic Channel Model for 6G



## 1 Data preparation
Before running the bp_slam_3D script, you need to generate a synthetic dataset using QuaDRiGa or P-GBSM.



## 2 follow-up work
After the review finished, the P-GBSM and QuaDriGa_2023.12.13_v2.8.1-0 3 code will be updated one after another



## 3 BPSLAM Result Visualization and Evaluation
CDF of localization errors of the BP-SLAM algorithm using synthetic data from the QuaDRiGa and P-GBSM models. This directory contains the saved results of the BPSLAM algorithm. All results can be accessed under the “./bp_slam_3D/all_results” folder. Localization performance of BP-SLAM using synthetic data from P-GBSM and QuaDRiGa Models.
### 3.1 Cumulative Distribution Function (CDF)
To reproduce the Cumulative Distribution Function (CDF) plots shown in Figure 7, run:CDF_all_3_Fig7.m and CDF_all_4_Fig7.m
### 3.2 Quantitative performance metrics
To generate the quantitative performance metrics corresponding to Table 3, run: CDF_all_3_tab_3.m and CDF_all_4_tab_3.m
### 3.3 3D trajectories and qualitative
To visualize the 3D trajectories and qualitative bp_slam results, run: guiji_all_3_Qualitative_3D.m and guiji_all_4_Qualitative_3D.m
### 3.4 Agent position RMSE
To analyze the step-by-step root mean square error (RMSE) of the positioning results, run: mgbsm_position_error_3_.m and  mgbsm_position_error_4_.m


