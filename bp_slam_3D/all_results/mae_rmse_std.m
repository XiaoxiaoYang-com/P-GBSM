function [] = mae_rmse_std(diff)

% 求坐标之间的误差，即两点之间距离
%diff=predict_pos - true_pos;
distance = zeros(length(diff),1);
for i = 1:length(diff)
    distance(i) = norm(diff(i,:));%求2-范数，即两点之间误差
end

% MAE:估计值与真值误差的绝对值的平均,和MEDE一样
MAE = mean(abs(distance));
disp("MAE/MEDE:   "+num2str(MAE));

% RMSE:估计值与真值误差平方的平均再开方
RMSE=sqrt(mean(distance.^2));
disp("RMSE:   "+num2str(RMSE));

% STD:误差的标准差，用于评价误差的分布
STD = std(distance);
disp("STD:  "+num2str(STD));