function plot_dimensional_scaling()
    figure('Position', [100, 100, 800, 600]);
    
    dimensions = [4, 5];
    growth_rates = [0.119, 0.186];
    uncertainties = [0.004, 0.005];
    
    % Create bar plot
    bar(dimensions, growth_rates, 'FaceColor', [0.8 0.8 0.8]); 
    hold on;
    
    % Add error bars
    errorbar(dimensions, growth_rates, uncertainties, 'k.', 'LineWidth', 2, 'CapSize', 10);
    
    % Calculate ratio and display as fraction - FIXED: Using LaTeX for fraction
    ratio = 0.186 / 0.119;
    text(3.5, 0.16, sprintf('$\\frac{\\gamma_{d=5}}{\\gamma_{d=4}} = %.3f$', ratio), ...
         'FontSize', 14, 'FontWeight', 'bold', 'Interpreter', 'latex');
    
    % Labels with LaTeX for Greek letters
    xlabel('Dimension ($d$)', 'Interpreter', 'latex'); 
    ylabel('Growth Rate ($\gamma$)', 'Interpreter', 'latex');
    title('Dimensional Scaling of Instability', 'Interpreter', 'latex'); 
    
    grid on;
    saveas(gcf, 'dimensional_scaling.png');
end
