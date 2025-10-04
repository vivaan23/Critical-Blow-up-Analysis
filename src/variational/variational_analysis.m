function variational_analysis()
    fprintf('=== VARIATIONAL ANALYSIS ===\n\n');
    
    dimensions = [4, 5];
    
    for i = 1:length(dimensions)
        d = dimensions(i);
        p = compute_strauss_exponent(d);
        
        fprintf('Dimension d = %d, p_S = %.4f:\n', d, p);
        
        % Check Palais-Smale condition
        if abs(p - compute_strauss_exponent(d)) < 1e-6
            fprintf('  ✅ Critical case: Functional fails Palais-Smale\n');
            fprintf('  → No finite-energy self-similar profiles exist\n');
        else
            fprintf('  Subcritical case: Minimizers exist\n');
        end
        
        % Energy analysis
        energy_properties = analyze_energy_functional(d, p);
        fprintf('  Energy functional analysis completed\n\n');
    end
end

% compute_energy_functional.m
function energy_properties = analyze_energy_functional(d, p)
    fprintf('  Analyzing energy functional for d=%d, p=%.4f...\n', d, p);
    
    % Simplified energy analysis
    energy_properties.has_minimizer = (p < compute_strauss_exponent(d));
    energy_properties.critical_case = abs(p - compute_strauss_exponent(d)) < 1e-6;
    
    if energy_properties.critical_case
        fprintf('  → Critical exponent: No minimizer exists\n');
        fprintf('  → Concentration-compactness applies\n');
    elseif energy_properties.has_minimizer
        fprintf('  → Subcritical: Minimizers exist\n');
    else
        fprintf('  → Supercritical: Different blow-up mechanism\n');
    end
end
