function plot_dimensional_scaling()
    figure('Position', [100, 100, 800, 600]);
    
    dimensions = [4, 5];
    growth_rates = [0.119, 0.186];
    uncertainties = [0.004, 0.005];
    
    bar(dimensions, growth_rates, 'FaceColor', [0.8 0.8 0.8]); hold on;
    errorbar(dimensions, growth_rates, uncertainties, 'k.', 'LineWidth', 2);
    
    ratio = 0.186 / 0.119;
    text(3.5, 0.16, sprintf('Ratio d5/d4 = %.3f', ratio), ...
         'FontSize', 12, 'FontWeight', 'bold');
    
    xlabel('Dimension'); 
    ylabel('Growth Rate');
    title('Dimensional Scaling of Instability'); 
    grid on;
    saveas(gcf, 'dimensional_scaling.png');
end
