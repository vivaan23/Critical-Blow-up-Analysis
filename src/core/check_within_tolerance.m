function status = check_within_tolerance(measured, target, tolerance)
% CHECK_WITHIN_TOLERANCE - Check if measured value is within tolerance range
% Inputs:
%   measured  - experimentally measured value
%   target    - target/reference value  
%   tolerance - allowed tolerance range
% Output:
%   status    - verification status string

    if abs(measured - target) <= tolerance
        status = '✅ PASS';
    else
        status = '❌ FAIL';
    end
end
