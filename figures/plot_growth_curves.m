function plot_growth_curves()
    figure('Position', [100, 100, 800, 600]);
    
    tau = 0:0.1:12;
    w_d4 = 5 * exp(0.119 * tau);
    w_d5 = 5 * exp(0.186 * tau);
    
    semilogy(tau, w_d4, 'b-', 'LineWidth', 3); hold on;
    semilogy(tau, w_d5, 'r-', 'LineWidth', 3);
    xlabel('Logarithmic Time'); 
    ylabel('Maximum Amplitude');
    legend('d=4, gamma=0.119', 'd=5, gamma=0.186', 'Location', 'northwest');
    title('Exponential Growth at Critical Exponent'); 
    grid on;
    saveas(gcf, 'growth_curves.png');
end
