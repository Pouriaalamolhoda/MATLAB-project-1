
clc;
clear all;
close all;


data = readtable('points.xlsx');  
x = data.x;
y = data.y;


figure;
scatter(x, y, 'filled');
xlabel('x');
ylabel('y');
title('nemodar noght');
legend('Data Points');
grid on;


fit_line = polyfit(x, y, 1);
y_fit = polyval(fit_line, x);
low_buffer = y_fit - 10;
high_buffer = y_fit + 10;


figure;
scatter(x, y, 'filled');
hold on;
plot(x, y_fit, 'LineWidth', 2);
plot(x, low_buffer, '--b', 'LineWidth', 0.5);
plot(x, high_buffer, '--b', 'LineWidth', 0.5);
xlabel('x');
ylabel('y');
title('khat barazesh va had');
legend('Data Points', 'khat barazesh', 'had bala va paiin');
grid on;


outlier_status = strings(length(y), 1);

figure;
hold on;
plot(x, y_fit, 'LineWidth', 2);
plot(x, low_buffer, '--b', 'LineWidth', 0.5);
plot(x, high_buffer, '--b', 'LineWidth', 0.5);

for i = 1:length(y)
    if y(i) < low_buffer(i) || y(i) > high_buffer(i)
        
        plot(x(i), y(i), 'o', 'MarkerEdgeColor', 'r', 'MarkerSize', 8, 'LineWidth', 1.5);
        outlier_status(i) = "outlier";
    else
        
        plot(x(i), y(i), 'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'MarkerSize', 6);
        outlier_status(i) = "noghat dakheli";
    end
end


results = table(x, y, outlier_status, 'VariableNames', {'x', 'y', 'status'});
disp(results);

xlabel('x');
ylabel('y');
title('tashkis noghat az excel');
legend('khat barazesh', 'karane', 'biron mahdode', 'dakhel mahdode');
grid on;
hold off;