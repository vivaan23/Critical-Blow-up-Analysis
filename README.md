# Critical-Blow-up-Analysis: Verification Code

**Supplementary Code for :**  
"Resolution of the critical nonlinear wave equation blow-up conjecture via a Unified Numerical-Variational Framework"  
*By Arpit Verma*

---

## About

This repository contains the **MATLAB verification code** accompanying the research paper on critical blow-up in semilinear wave equations. The code provides **numerical verification** of the paper's central claims regarding exponential instability at the Strauss exponent.

## Verified Results

The code reproduces and verifies the paper's key numerical results:

- **Exponential growth rates**: γ(d=4) = 0.119 ± 0.004, γ(d=5) = 0.186 ± 0.005
- **Dimensional scaling**: Ratio γ_d5/γ_d4 = 1.562
- **Non-self-similar blow-up**: Confirmed at critical Strauss exponent
- **Numerical convergence**: Spatial, temporal, and viscosity convergence verified

## Quick Verification

```matlab
% Run complete verification suite
run_complete_verification();

% Generate all paper figures
generate_all_figures();

% Quick test of core results (30 seconds)
run_quick_test();
