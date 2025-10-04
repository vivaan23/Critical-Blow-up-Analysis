function [gamma, uncertainty, r_squared, data] = measure_growth_rate(dimension, exponent)
% MEASURE_GROWTH_RATE - Core function to measure exponential growth rate
    
    % Configuration for reliable measurement
    config.dimension = dimension;
    config.exponent = exponent;
    config.viscosity = 1e-4;
    config.grid_points = 1024;
    config.time_step = 0.001;
    config.domain_size = 10;
    config.final_time = 12;
    config.initial_amplitude = 5;
    
    % Run simulation
    results = run_verification_simulation(config);
    
    % Extract data for linear regression
    tau = results.tau;
    w_max = results.w_max;
    
    % Use stable late-time data (avoid initial transients)
    late_time_idx = tau >= 4 & tau <= 12;
    tau_late = tau(late_time_idx);
    log_w_max_late = log(w_max(late_time_idx));
    
    % Robust linear regression with error handling
    if length(tau_late) < 3
        error('Insufficient data points for regression');
    end
    
    [p_coeff, S] = polyfit(tau_late, log_w_max_late, 1);
    gamma = p_coeff(1);
    
    % Calculate uncertainty (standard error)
    predicted = polyval(p_coeff, tau_late);
    residuals = log_w_max_late - predicted;
    standard_error = std(residuals) / sqrt(length(tau_late));
    uncertainty = standard_error;
    
    % Robust R-squared calculation
    ss_res = sum(residuals.^2);
    ss_tot = sum((log_w_max_late - mean(log_w_max_late)).^2);
    
    if ss_tot == 0
        r_squared = 1;  % Perfect fit if no variance
    else
        r_squared = max(0, 1 - (ss_res/ss_tot));  % Ensure non-negative
    end
    
    % Store data for plotting
    data.tau = tau;
    data.w_max = w_max;
    data.tau_late = tau_late;
    data.log_w_max_late = log_w_max_late;
    data.predicted = predicted;
    data.r_squared = r_squared;
end
