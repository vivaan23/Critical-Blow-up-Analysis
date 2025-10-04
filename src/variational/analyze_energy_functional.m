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
