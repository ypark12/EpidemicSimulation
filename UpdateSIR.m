% FinalProject: Epidemic
% Date: 05/05/2020
% Abe Park
% UpdateSIR.m
% [sn, in, rn] = updated SIR values after the random number generation and
% choosing the Reed-Frost interval of which the interval range and the
% random number match. Receives a n X 3 SIR matrix and interval of
% length(sn).
% ------------------------------------------------------------------------
function [sn, in, rn] = UpdateSIR(sir, interval)
    % Generate a random number from 0 to 1
    randomNumber = rand;

    % randomNumber falls within the interval(i) from 0 to 1
    % of which (i - 1) = the number of newly infected susceptibles
    tmp = 0;
    for i = 1:length(interval)
        if (randomNumber > tmp) & (randomNumber < interval(i))
            % Updates rn by adding the previous in
            rn = sir(3) + sir(2);
            
            % Prevents sn from becoming a negative value
            if i > sir(1)
                in = sir(1);
                sn = 0;
                
            % Updates sn and in
            else
                in = (i-1);
                sn = sir(1) - (i-1);
            end
            break
        end
        
        % Loops until the interval range and the random number match
        tmp = interval(i);
    end
end

