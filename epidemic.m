% FinalProject: Reed-Frost Epidemic Analysis
% Date: 05/05/2020
% Abe Park
% epidemic.m
% The script utilizes the Reed-Frost model to analyze the effect of 
% the effective contact rate (spread probability) of the epidemic in four 
% categories: the average epidemic duration, the average amount of 
% infective per one sampling interval, the average amount of remaining 
% susceptible, and the average amount of accumulated removals.
% ------------------------------------------------------------------------

clear, clc, close all

%% Setup
p = .1:.2:.7;                           % effective contact rate
analysis = [0 0 0 0];

% Invariant variables
% Sample size must remain from 5 to 10 for an accurate analysis.
%  - Large number of sample size is inadequate for the Reed-Frost model
%    because the model invovles factorial calculation, nCk, of sample size
sample = 10;      


%% Reed-Frost Simulation
for i = 1:length(p)
    % 40 Sample paths of the Reed Frost model for each 3 choices of p
    for j = 1:40
        % Initial SIR values
        in = 1;                         % infectives
        sn = sample - 1;                % susceptibles
        rn = 0;                         % removals
        sir = [sn, in, rn];             % initial 1 X 3 SIR matrix

        % Simulation
        table = [1 sample 0 0; 2 sir];  % time by SIR matrix

        output = Simulation(table, sir, p(i));
        analysis = [analysis; output(end, :)];
    end

    %% Graph
    figure
    SIR = [output(:, 2) output(:, 3) output(:, 4)];
    bar(SIR, 'stacked')
    xlabel('Time Period'), ylabel('Sample Size')
    st = ['Spread of Epidemic within Sample Size ', num2str(sample), ...
        ', ', 'Effective Contact Rate: ', num2str(p(i))];
    title(st)
    legend('# of susceptibles', '# of infectives', '# of removals', ...
        'Location', 'northwest')
end


%% Epidemic Analysis
p1_anlys = RunAnalysis(analysis, 2);
p2_anlys = RunAnalysis(analysis, 42);
p3_anlys = RunAnalysis(analysis, 82);
p4_anlys = RunAnalysis(analysis, 122);

% Bar Graph
% 1. avg. epidemic duration
% 2. avg. amount of infective per one period of time
% 3. avg. amount of remaing susceptible of the epidemic
% 4. avg. amount of accumulated removals of the epidemic
figure
domain = categorical({'p1 = .1', 'p2 = .3', 'p3 = .5', 'p4 = .7'});
domain = reordercats(domain,{'p1 = .1', 'p2 = .3', 'p3 = .5', 'p4 = .7'});
data = [p1_anlys(1), p1_anlys(3), p1_anlys(2), p1_anlys(4); ...
        p2_anlys(1), p2_anlys(3), p2_anlys(2), p2_anlys(4); ...
        p3_anlys(1), p3_anlys(3), p3_anlys(2), p3_anlys(4); ...
        p4_anlys(1), p4_anlys(3), p4_anlys(2), p4_anlys(4)];
bar(domain, data);
xlabel('Effective Contact Rate'), ylabel('Sample Unit(s)')
title('Spread of Epidemic within Varied Effective Contact Rate')
legend('avg. epidemic duration', 'avg. infectives per period', ...
    'avg. # of remaing susceptibles', 'avg. # of accumulated removals', ...
    'Location', 'northwest')