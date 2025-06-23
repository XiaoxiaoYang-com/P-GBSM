
% 主程序
close all;
clear all;

% 颜色定义
colors = {'#8A2BE2', '#FF4500', '#20B2AA', '#FFD700', ...
          '#1C2331', '#00788C', '#40A8C4', '#6ED3CF', '#B2F7EF', '#607D8B'};
for i = 1:length(colors)
    mycolors(i,:) = sscanf(colors{i}(2:end), '%2x%2x%2x', [1,3]) / 255;
end

% 创建图形
figure();
size11 = 20;
set(gca, 'FontName', 'Times New Roman');
set(gcf, 'DefaultAxesFontSize', size11);
set(gcf, 'DefaultTextFontSize', size11);
set(gcf, 'DefaultLegendFontSize', size11);

% 定义每组数据的绘图样式
plot_configs = {
    {'-', '+'},  % 实线+加号
    {'-', 'o'},  % 实线+圆圈
    {'-', 's'},  % 实线+方块
    {'--', 'x'}, % 虚线+叉号
    {'--', 'd'}, % 虚线+菱形
    {'--', '^'}  % 虚线+上三角
};

% 定义每组数据的绘图样式
plot_configs = {
    {'-', 's'},  % 实线+加号
    {'-', 'o'},  % 实线+圆圈
    {'-', '^'},  % 实线+方块
    {'--', 's'}, % 虚线+叉号
    {'--', 'o'}, % 虚线+菱形
    {'--', '^'}  % 虚线+上三角
};

% 数据加载和绘图
% 第一组数据 (Ours)
load('3_true_2_mgbsm_8_vv_2.mat');

xishu=50;
diff = trueTrajectory(:,1:xishu:700) - estimatedTrajectory(1:3,1:xishu:700);
mae_rmse_std(diff');

cdfcdf_Marker(diff', mycolors(1,:), plot_configs{1}{1}, plot_configs{1}{2});

% 第二组数据 (Ours)
load('3_true_3_mgbsm_8_vv3.mat');
diff = trueTrajectory(:,1:xishu:700) - estimatedTrajectory(1:3,1:xishu:700);
mae_rmse_std(diff');
cdfcdf_Marker(diff', mycolors(2,:), plot_configs{2}{1}, plot_configs{2}{2});

% 第三组数据 (Ours)
load('3_true_3_mgbsm_8_vv4.mat');
diff = trueTrajectory(:,1:xishu:700) - estimatedTrajectory(1:3,1:xishu:700);
mae_rmse_std(diff');
cdfcdf_Marker(diff', mycolors(3,:), plot_configs{3}{1}, plot_configs{3}{2});

% 第四组数据 (Qua)
load('3_true_2_qua_8_2.mat');
diff = trueTrajectory(:,1:xishu:700) - estimatedTrajectory(1:3,1:xishu:700);
mae_rmse_std(diff');
cdfcdf_Marker(diff', mycolors(1,:), plot_configs{4}{1}, plot_configs{4}{2});

% 第五组数据 (Qua)
load('3_true_3_qua_3_3.mat');
diff = trueTrajectory(:,1:xishu:700) - estimatedTrajectory(1:3,1:xishu:700);
mae_rmse_std(diff');
cdfcdf_Marker(diff', mycolors(2,:), plot_configs{5}{1}, plot_configs{5}{2});

% 第六组数据 (Qua)s
load('3_true_3_qua_3_4.mat');
diff = trueTrajectory(:,1:xishu:700) - estimatedTrajectory(1:3,1:xishu:700);
mae_rmse_std(diff');
cdfcdf_Marker(diff', mycolors(3,:), plot_configs{6}{1}, plot_configs{6}{2});

% 图形美化
grid on;
xlabel('Position error (m)'); 
ylabel('Cumulative probability'); 
ylim([0,1.1]);
legend("Ours\_3-2-2", "Ours\_3-3-3", "Ours\_3-3-4", ...
       "Qua\_3-2-2", "Qua\_3-3-3", "Qua\_3-3-4", ...
       'Location', 'best');
% title('CDF - Positioning Error with Markers');

% 保存图形
saveas(gcf, './3base_CDF_with_markers.jpg');
savefig('./3base_CDF_with_markers.fig');

function cdfcdf_Marker(diff, color1, LineStyle, MarkerStyle)
    % 计算绝对均值误差
    diff = abs(mean(diff, 2));
    sorted_data = sort(diff);
    sort_diff = sort(diff);
    
    % 输出关键统计量
    disp(" MAX  " + num2str(sort_diff(end)));
    disp(" 1-theama  " + num2str(sort_diff(round(length(sort_diff) * 0.6827))));
    disp(" 2-theama  " + num2str(sort_diff(round(length(sort_diff) * 0.9545))));
    N = length(sorted_data);
    % % 绘制阶梯图（支持自定义线型和标记）
    % stairs(sort(diff), (1:length(diff))/length(diff), ...
    %     'Color', color1, ...
    %     'LineStyle', LineStyle, ...
    %     'LineWidth', 2, ...
    %     'Marker', MarkerStyle,'MarkerSize',10); % 控制标记密度

    plot(sorted_data, (1:N)/N, ...
    'Color', color1, ...
    'LineStyle', LineStyle, ...
    'LineWidth', 2, ...
    'Marker', MarkerStyle, ...
    'MarkerSize', 10);
% 'MarkerFaceColor', color1s

    hold on;
end