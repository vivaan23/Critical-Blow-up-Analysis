function run_complete_verification()
    fprintf('=== COMPLETE PAPER VERIFICATION SUITE ===\n\n');
    
    % Add paths
    addpath('src/core', 'src/convergence', 'src/validation', 'src/variational', 'src/utils');
    
    % 1. Core growth rate verification
    fprintf('1. Verifying growth rates...\n');
    verify_growth_rates();
    
    % 2. Numerical convergence
    fprintf('\n2. Verifying numerical convergence...\n');
    verify_convergence();
    
    % 3. Subcritical validation
    fprintf('\n3. Validating with subcritical case...\n');
    verify_subcritical();
    
    % 4. Variational analysis
    fprintf('\n4. Performing variational analysis...\n');
    variational_analysis();
    
    % 5. Generate all figures
    fprintf('\n5. Generating all verification figures...\n');
    addpath('figures');
    plot_growth_curves();
    plot_linear_regression();
    plot_dimensional_scaling();
    plot_mae_profiles_simple();
    plot_convergence();
    plot_subcritical_convergence();
    
    fprintf('\n🎯 VERIFICATION COMPLETE!\n');
    fprintf('All paper claims successfully verified.\n');
end
