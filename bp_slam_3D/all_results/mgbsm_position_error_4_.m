clear variables; clc;
close all;

colors = {'#8A2BE2', '#FF4500','#20B2AA','#FFD700' ...
    ,'#1C2331','#00788C','#40A8C4','#6ED3CF','#B2F7EF','#607D8B',
    };
for i=1:size(colors,2)

mycolors(i,:) = sscanf(colors{1,i}(2:end), '%2x%2x%2x', [1,3]) / 255;
end
% % % % % % % % % % % 
figure();
size11=20;
set(gca, 'FontName', 'Times New Roman');  % 设置坐标轴的字体为 Arial
set(gcf, 'DefaultAxesFontSize', size11);  % 设置坐标轴字体大小
set(gcf, 'DefaultTextFontSize', size11);  % 设置所有文本字体大小
set(gcf, 'DefaultLegendFontSize', size11);  % 设置图例字体大小

load('4_true_2_mgbsm_8_2.mat');
% hold on;
plot(calcDistance_(trueTrajectory(:,1:700),estimatedTrajectory(1:3,1:700)),'color',mycolors(1,:),'linewidth',2);



% load('2_true_4_mgbsm_6_6.mat');
% hold on;
% plot(calcDistance_(trueTrajectory(:,1:700),estimatedTrajectory(1:3,1:700)),'color',mycolors(3,:),'linewidth',2);


% load('true_3_mgbsm_3_6.mat');
% hold on;
% plot(calcDistance_(trueTrajectory(:,1:700),estimatedTrajectory(1:2,1:700)),'color',mycolors(4,:),'linewidth',2);
% 
% load('true_3_mgbsm_3_7.mat');
% hold on;
% plot(calcDistance_(trueTrajectory(:,1:700),estimatedTrajectory(1:2,1:700)),'color',mycolors(5,:),'linewidth',2);

load('4_true_3_mgbsm_8_3.mat');
hold on;
plot(calcDistance_(trueTrajectory(:,1:700),estimatedTrajectory(1:3,1:700)),'-','color',mycolors(2,:),'linewidth',2);


load('4_true_3_mgbsm_8_4.mat');
hold on;
plot(calcDistance_(trueTrajectory(:,1:700),estimatedTrajectory(1:3,1:700)),'-','color',mycolors(7,:),'linewidth',2);



load('4_true_2_qua_8_2.mat');
hold on;
plot(calcDistance_(trueTrajectory(:,1:700),estimatedTrajectory(1:3,1:700)),'--','color',mycolors(1,:),'linewidth',2);




load('4_true_3_qua_3_3.mat');
hold on;
plot(calcDistance_(trueTrajectory(:,1:700),estimatedTrajectory(1:3,1:700)),'--','color',mycolors(2,:),'linewidth',2);


load('4_true_3_qua_3_4.mat');
hold on;
plot(calcDistance_(trueTrajectory(:,1:700),estimatedTrajectory(1:3,1:700)),'--','color',mycolors(7,:),'linewidth',2);



xlabel('trajectory steps'), ylabel('position error agent [m]');grid on;
grid on;
legend("Ours\_4-2-2","Ours\_4-3-3","Ours\_4-3-4","Qua\_4-2-2","Qua\_4-3-3","Qua\_4-3-4",'Location', 'best');

saveas(gcf, './S-GSCM_qua_position_error_4_3.jpg');
savefig('./S-GSCM_qua_position_error_4_3.fig');

