function generate_all_figures()
    fprintf('Generating all paper figures...\n');
    
    addpath('figures');
    set(0, 'DefaultTextInterpreter', 'none');
    
    plot_growth_curves();
    plot_linear_regression();
    plot_dimensional_scaling();
    plot_mae_profiles();
    plot_convergence();
    plot_subcritical_convergence();
    
    fprintf('All figures saved to results/figures/\n');
end
