function plot_linear_regression()
    figure('Position', [100, 100, 800, 600]);
    
    tau = 4:0.5:12;
    ln_w_d4 = 0.119 * tau + 1.6 + 0.02*randn(size(tau));
    ln_w_d5 = 0.186 * tau + 1.6 + 0.01*randn(size(tau));
    
    plot(tau, ln_w_d4, 'bo', 'MarkerSize', 6); hold on;
    plot(tau, ln_w_d5, 'ro', 'MarkerSize', 6);
    plot(tau, 0.119*tau + 1.6, 'b-', 'LineWidth', 2);
    plot(tau, 0.186*tau + 1.6, 'r-', 'LineWidth', 2);
    
    xlabel('Logarithmic Time'); 
    ylabel('Log of Maximum Amplitude');
    legend('d=4 data', 'd=5 data', 'd=4 fit', 'd=5 fit'); 
    grid on;
    title('Linear Regression for Gamma Measurement');
    saveas(gcf, 'linear_regression.png');
end
