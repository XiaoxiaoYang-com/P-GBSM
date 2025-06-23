close all;
clear all;
colors = {'#8A2BE2', '#FF4500','#20B2AA','#FFD700' ...
    ,'#1C2331','#00788C','#40A8C4','#6ED3CF','#B2F7EF','#607D8B',
    };
for i=1:size(colors,2)

mycolors(i,:) = sscanf(colors{1,i}(2:end), '%2x%2x%2x', [1,3]) / 255;
end


figure();
size11=20;
set(gca, 'FontName', 'Times New Roman');  % 设置坐标轴的字体为 Arial
set(gcf, 'DefaultAxesFontSize', size11);  % 设置坐标轴字体大小
set(gcf, 'DefaultTextFontSize', size11);  % 设置所有文本字体大小
set(gcf, 'DefaultLegendFontSize', size11);  % 设置图例字体大小


load('4_true_2_mgbsm_8_2.mat');
diff=trueTrajectory(:,1:700)-estimatedTrajectory(1:3,1:700);
mae_rmse_std(diff');
cdfcdf(diff',mycolors(1,:),'-');

hold on;
load('4_true_3_mgbsm_8_3.mat');
diff=trueTrajectory(:,1:700)-estimatedTrajectory(1:3,1:700);
mae_rmse_std(diff');
cdfcdf(diff',mycolors(2,:),'-');

load('4_true_3_mgbsm_8_4.mat');
diff=trueTrajectory(:,1:700)-estimatedTrajectory(1:3,1:700);
mae_rmse_std(diff');
cdfcdf(diff',mycolors(3,:),'-');

hold on;
load('4_true_2_qua_8_2.mat');
diff=trueTrajectory(:,1:700)-estimatedTrajectory(1:3,1:700);
mae_rmse_std(diff');
cdfcdf(diff',mycolors(1,:),'--');

hold on;
load('4_true_3_qua_3_3.mat');
diff=trueTrajectory(:,1:700)-estimatedTrajectory(1:3,1:700);
mae_rmse_std(diff');
cdfcdf(diff',mycolors(2,:),'--');

hold on;
load('4_true_3_qua_3_4.mat');
diff=trueTrajectory(:,1:700)-estimatedTrajectory(1:3,1:700);
mae_rmse_std(diff');
cdfcdf(diff',mycolors(3,:),'--');

grid on;
xlabel('Distance error (m)'); 
ylabel('Cumulative Probability'); 
ylim([0,1.1]);
legend("Ours\_4-2-2","Ours\_4-3-3","Ours\_4-3-4","Qua\_4-2-2","Qua\_4-3-3","Qua\_4-3-4",'Location', 'best');

title('CDF - Positioning Error  ');

saveas(gcf, './4base_CDF.jpg');
savefig('./4base_CDF.fig');
