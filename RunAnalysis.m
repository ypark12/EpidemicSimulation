% FinalProject: Epidemic
% Date: 05/05/2020
% Abe Park
% RunAnalysis.m
% update = 1 X 4 matrix of the average epidemic duration, average # of 
% infective per one period of time, average # of remaining susceptible, and
% average # of accumulated removals at the end of 40 samples of the 
% epidemic of the specific effective contact rate. Receives the n X 4
% matrix of recorded samples and the current value of row location.
% ------------------------------------------------------------------------
function update = RunAnalysis(analysis, location)
    % Initiliaze the vector to [0 0 0 0]
    update = analysis(1, :);
    
    % Add each vector by its components at each row
    for i = 1:40
        update = update + analysis(location, :);
        location = location + 1;
    end
    
    % Dividides by the number of samples (40)
    update = update ./ 40;
end

