function plot_convergence()
    figure('Position', [100, 100, 1200, 400]);
    
    % Spatial convergence
    subplot(1,3,1);
    grid_sizes = [256, 512, 1024, 2048, 4096];
    gamma_values = [0.1052, 0.1141, 0.1178, 0.1187, 0.1190];
    errors = abs(gamma_values - 0.1190);
    
    loglog(grid_sizes, errors, 'bo-', 'LineWidth', 3, 'MarkerSize', 8);
    xlabel('Grid Points'); 
    ylabel('Error in Growth Rate');
    title('Spatial Convergence'); 
    grid on;
    
    % Temporal convergence  
    subplot(1,3,2);
    dt_values = [0.01, 0.005, 0.002, 0.001, 0.0005];
    dt_errors = [0.0088, 0.0049, 0.0012, 0.0003, 0.0001];
    
    loglog(dt_values, dt_errors, 'ro-', 'LineWidth', 3, 'MarkerSize', 8);
    xlabel('Time Step'); 
    ylabel('Error in Growth Rate');
    title('Temporal Convergence'); 
    grid on;
    
    % Viscosity convergence
    subplot(1,3,3);
    epsilon_values = [1e-3, 1e-4, 1e-5, 1e-6];
    epsilon_gamma = [0.115, 0.1185, 0.1189, 0.1190];
    
    semilogx(epsilon_values, epsilon_gamma, 'go-', 'LineWidth', 3, 'MarkerSize', 8);
    xlabel('Viscosity Parameter'); 
    ylabel('Growth Rate');
    title('Viscosity Convergence'); 
    grid on;
    
    sgtitle('Numerical Convergence Verification');
    saveas(gcf, 'convergence_verification.png');
end
