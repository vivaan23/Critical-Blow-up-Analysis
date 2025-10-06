function plot_mae_profiles()
    figure('Position', [100, 100, 800, 600]);
    
    xi = linspace(0, 10, 100);
    F_d4 = exp(-xi.^2/4) .* (1 - 0.2*xi.^2);
    F_d5 = exp(-xi.^2/3) .* (1 - 0.15*xi.^2);
    
    plot(xi, F_d4, 'b-', 'LineWidth', 2.5); hold on;
    plot(xi, F_d5, 'r-', 'LineWidth', 2.5);
    xlabel('Similarity Variable ($\xi$)', 'Interpreter','latex'); 
    ylabel('Profile ($F_(\xi)$)','Interpreter','latex');
    legend('$d$=4, $p$=2.0', '$d$=5, $p$=1.7808', 'Interpreter', 'latex'); 
    grid on;
    saveas(gcf, 'mae_profiles.png');
end
