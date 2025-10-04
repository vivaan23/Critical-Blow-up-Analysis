function plot_convergence()
    figure('Position', [100, 100, 1400, 500]);
    
    % Set global LaTeX interpreter
    set(groot, 'defaultTextInterpreter', 'latex');
    set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
    set(groot, 'defaultLegendInterpreter', 'latex');
    
    % Spatial convergence
    subplot(1,3,1);
    grid_sizes = [256, 512, 1024, 2048, 4096];
    gamma_values = [0.1052, 0.1141, 0.1178, 0.1187, 0.1190];
    errors = abs(gamma_values - 0.1190);
    
    loglog(grid_sizes, errors, 'bo-', 'LineWidth', 3, 'MarkerSize', 8, 'MarkerFaceColor', 'blue');
    xlabel('Grid Resolution ($N$)', 'FontSize', 12);
    ylabel('$|\gamma - \gamma_{\infty}|$', 'FontSize', 12);
    title('(a) Spatial Convergence', 'FontSize', 13);
    grid on;
    
    % Add convergence order text
    text(500, 0.001, '$\mathcal{O}(N^{-1})$', 'FontSize', 11, 'Color', 'blue');
    
    % Temporal convergence  
    subplot(1,3,2);
    dt_values = [0.01, 0.005, 0.002, 0.001, 0.0005];
    dt_errors = [0.0088, 0.0049, 0.0012, 0.0003, 0.0001];
    
    loglog(dt_values, dt_errors, 'ro-', 'LineWidth', 3, 'MarkerSize', 8, 'MarkerFaceColor', 'red');
    xlabel('Time Step ($\Delta\tau$)', 'FontSize', 12);
    ylabel('$|\gamma - \gamma_{\infty}|$', 'FontSize', 12);
    title('(b) Temporal Convergence', 'FontSize', 13);
    grid on;
    
    text(0.003, 0.0005, '$\mathcal{O}(\Delta\tau)$', 'FontSize', 11, 'Color', 'red');
    
    % Viscosity convergence
    subplot(1,3,3);
    epsilon_values = [1e-3, 1e-4, 1e-5, 1e-6];
    epsilon_gamma = [0.115, 0.1185, 0.1189, 0.1190];
    asymptotic_value = 0.1190;
    
    semilogx(epsilon_values, epsilon_gamma, 'go-', 'LineWidth', 3, 'MarkerSize', 8, 'MarkerFaceColor', 'green');
    hold on;
    plot([1e-7, 1e-2], [asymptotic_value, asymptotic_value], 'k--', 'LineWidth', 1, 'Color', [0.5 0.5 0.5]);
    
    xlabel('Viscosity Parameter ($\epsilon$)', 'FontSize', 12);
    ylabel('Growth Rate ($\gamma(\epsilon)$)', 'FontSize', 12);
    title('(c) Viscosity Convergence', 'FontSize', 13);
    grid on;
    
    text(2e-4, 0.116, '$\gamma_{\infty} = 0.1190$', 'FontSize', 11, 'Color', 'black');
    
    sgtitle('Convergence Analysis', 'FontSize', 16, 'FontWeight', 'bold');
    
    saveas(gcf, 'convergence_verification.png');
    
    % Reset to default interpreters
    set(groot, 'defaultTextInterpreter', 'tex');
    set(groot, 'defaultAxesTickLabelInterpreter', 'tex');
    set(groot, 'defaultLegendInterpreter', 'tex');
end
