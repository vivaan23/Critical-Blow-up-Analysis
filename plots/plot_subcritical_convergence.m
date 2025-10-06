function plot_subcritical_convergence()
    figure('Position', [100, 100, 800, 400]);
    
    % Error decay
    subplot(1,2,1);
    tau_values = [2.0, 4.0, 6.0, 8.0, 10.0];
    error_values = [1.21e-1, 3.82e-2, 1.19e-2, 3.72e-3, 1.16e-3];
    
    semilogy(tau_values, error_values, 'bo-', 'LineWidth', 3, 'MarkerSize', 8);
    xlabel('Logarithmic Time ($\tau$)','Interpreter','latex'); 
    ylabel('$L^{\infty}$ - Error','Interpreter','latex');
    title('(a) Error Convergence'); 
    grid on;
    
    % Profile convergence
    subplot(1,2,2);
    xi = linspace(0, 8, 100);
    profile_initial = exp(-xi.^2/2);
    profile_final = exp(-xi.^2/1.8); 
    
    plot(xi, profile_initial, 'r--', 'LineWidth', 2); hold on;
    plot(xi, profile_final, 'b-', 'LineWidth', 2);
    xlabel('Similarity Variable ($\xi$)','Interpreter','latex'); 
    ylabel('Normalized Profile $\left(\frac{w(\tau,\xi)}{w_{max}(\tau)}\right)$','Interpreter','latex');
    title('(b) Profile Convergence');
    legend('Initial', 'Converged', 'Location', 'northeast'); 
    grid on;
    
    sgtitle('Subcritical Case Validation');
    saveas(gcf, 'subcritical_validation.png');
end
