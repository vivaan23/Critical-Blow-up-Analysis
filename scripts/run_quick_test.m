function run_quick_test()
    fprintf(' QUICK VERIFICATION TEST \n\n');
    
    addpath('src/core', 'src/utils');
    verify_growth_rates();
    
    fprintf('\nCore results verified in < 30 seconds.\n');
end
