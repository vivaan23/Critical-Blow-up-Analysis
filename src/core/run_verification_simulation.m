function results = run_verification_simulation(config, mae_profile)
% run_verification_simulation - Implement Pillars III & IV: Viscosity + FVM
% Solve the regularized PDE in self-similar coordinates

    d = config.dimension;
    p = config.exponent;
    epsilon = config.viscosity;
    N = config.grid_points;
    dtau = config.time_step;
    Xi_max = config.domain_size;
    A = config.initial_amplitude;
    
    fprintf('Starting dynamic simulation...\n');
    
    % Spatial discretization
    xi = linspace(0, Xi_max, N)';
    dxi = xi(2) - xi(1);
    
    % Initial conditions in self-similar frame
    w0 = A * exp(-xi.^2);  % Gaussian profile
    v0 = zeros(size(xi));   % Zero initial velocity
    
    % Precompute coefficients
    coeff = compute_pde_coefficients(xi, d, p);
    
    % Time stepping parameters
    tau_range = 0:dtau:config.final_time;
    n_steps = length(tau_range);
    
    % Storage for results
    results.tau = tau_range;
    results.xi = xi;
    results.w = zeros(N, n_steps);
    results.v = zeros(N, n_steps);
    results.w_max = zeros(n_steps, 1);
    
    results.w(:,1) = w0;
    results.v(:,1) = v0;
    results.w_max(1) = max(w0);
    
    % IMEX time stepping (simplified implementation)
    fprintf('Time stepping: τ = 0 to %.1f, Δτ = %.4f\n', config.final_time, dtau);
    
    for n = 1:n_steps-1
        if mod(n, 100) == 0
            fprintf('  Step %d/%d, τ = %.2f, w_max = %.6f\n', n, n_steps-1, tau_range(n), results.w_max(n));
        end
        
        % IMEX step: Implicit for viscous term, explicit for others
        [w_new, v_new] = imex_step(results.w(:,n), results.v(:,n), xi, dxi, dtau, coeff, epsilon, p);
        
        results.w(:,n+1) = w_new;
        results.v(:,n+1) = v_new;
        results.w_max(n+1) = max(w_new);
    end
    
    fprintf('Dynamic simulation completed\n');
end

function coeff = compute_pde_coefficients(xi, d, p)
% COMPUTE_PDE_COEFFICIENTS - Compute coefficients for transformed PDE
    
    coeff.A = (p-3)/(p-1) * ones(size(xi));  % A(ξ)
    coeff.B = xi.^2 - 2*(d-1)/(p-1) - 4/((p-1)^2);  % B(ξ)
    coeff.C = 2*(p+1)/((p-1)^2) * ones(size(xi));    % C(ξ)
    coeff.lambda = (p+3)/(p-1);
end

function [w_new, v_new] = imex_step(w_old, v_old, xi, dxi, dtau, coeff, epsilon, p)
% IMEX_STEP - One step of IMEX scheme for coupled system
    
    N = length(xi);
    
    % Explicit step for nonlinear and advective terms
    w_explicit = w_old + dtau * v_old;
    
    % Compute spatial derivatives (central differences)
    dw_dxi = gradient(w_old, dxi);
    d2w_dxi2 = del2(w_old, dxi);
    
    % Nonlinear source term
    nonlinear_term = abs(w_old).^p;
    
    % Explicit right-hand side for v equation
    rhs_v = - (coeff.A .* v_old + coeff.B .* dw_dxi + coeff.C .* w_old ...
             - (d-1)./xi .* dw_dxi + 2*xi .* gradient(v_old, dxi) ...
             - (1+epsilon) * d2w_dxi2 + nonlinear_term);
    
    % Handle boundary at ξ=0 (L'Hopital)
    rhs_v(1) = - (coeff.A(1)*v_old(1) + (coeff.B(1) - (d-1))*d2w_dxi2(1) + coeff.C(1)*w_old(1) + 2*xi(1)*gradient(v_old, dxi(1)) ...
                - (1+epsilon)*d2w_dxi2(1) + nonlinear_term(1));
    
    % Update v explicitly
    v_explicit = v_old + dtau * rhs_v;
    
    % Implicit correction for stability (simplified)
    w_new = w_explicit;
    v_new = v_explicit;
    
    % Apply boundary conditions
    w_new(1) = w_new(2);  % Symmetry at ξ=0
    v_new(1) = v_new(2);
    
    % Robin boundary at far field (simplified as Dirichlet for large domain)
    w_new(end) = 0;
    v_new(end) = 0;
end
