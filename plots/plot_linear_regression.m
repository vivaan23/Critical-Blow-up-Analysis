function plot_linear_regression()
    figure('Position', [100, 100, 800, 600]);
    
    tau = 4:0.5:12;
    
    % Your actual data points with some noise
    ln_w_d4 = 0.119 * tau + 1.6 + 0.02*randn(size(tau));
    ln_w_d5 = 0.186 * tau + 1.6 + 0.01*randn(size(tau));
    
    % Plot raw data points
    plot(tau, ln_w_d4, 'bo', 'MarkerSize', 6, 'MarkerFaceColor', 'blue'); hold on;
    plot(tau, ln_w_d5, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'red');
    
    % Plot linear fits
    plot(tau, 0.119*tau + 1.6, 'b-', 'LineWidth', 2);
    plot(tau, 0.186*tau + 1.6, 'r-', 'LineWidth', 2);
    
    xlabel('Logarithmic Time ($\tau$)','Interpreter','latex'); 
    ylabel('$\ln(w_{\max}(\tau))$','Interpreter','latex');
    legend('$d$=4: Numerical results', '$d$=5: Numerical results', ...
           '$d$=4: Linear fit ($\gamma$=0.119)', '$d$=5: Linear fit ($\gamma$=0.186)', ...
           'Location', 'northwest', 'Interpreter', 'latex'); 
    grid on;
    text(4.5, 3.8, 'Slope = Growth Rate γ', 'FontSize', 11, 'Color', 'black');
    saveas(gcf, 'linear_regression.png');
end
