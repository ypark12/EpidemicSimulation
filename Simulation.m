% FinalProject: Epidemic
% Date: 05/05/2020
% Abe Park
% Simulation.m
% output = n X 4 matrix of time and SIR values over the sampling intervals;
% values are determined when the simulation of the Reed-Frost model is
% done. Receives an initial 2 X 4 table and 1 X 3 SIR matrix, with a
% speicifed p value.
% ------------------------------------------------------------------------
function output = Simulation(table, sir, p)
    t = 2;         % Skip to t = 2 because t = 1 set for initial SIR values
    sn = sir(1);
    in = sir(2);
    rn = sir(3);
    
    % Loop until there is no susceptible, or there is no infected.
    while sn > 0
        % Calculates the probability of surviving sampling interval of
        % epidemic given SIR values and effective contact rate
        interval = ReedFrost(sir, p);

        % Updates sn, in, rn values using the calculated infection spread
        [sn, in, rn] = UpdateSIR(sir, interval);
        sir = [sn, in, rn];

        % Updates time and table
        t = t + 1;
        table = [table; t sir];
        output = table;
        
        % in < 1: No infected = zero possibility of transmitting infection
        if in < 1
            break
        end
    end
end

