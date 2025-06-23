function []=cdfcdf(diff,color1,LineStyle)

diff=abs(mean(diff,2));
sort_diff=sort(diff);
disp(" MAX  "+num2str(sort_diff(end)));
disp(" 1-theama  "+num2str(sort_diff(round(length(sort_diff)*0.6827))));
disp(" 2-theama  "+num2str(sort_diff(round(length(sort_diff)*0.9545))));
stairs(sort(diff),(1:length(diff))/length(diff),'Color', color1,'LineStyle',LineStyle,'LineWidth',2);
hold on;
