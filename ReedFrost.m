% FinalProject: Epidemic
% Date: 05/05/2020
% Abe Park
% ReedFrost.m
% interval = an interval of probable outcomes of s_n+1 using the Reed-Frost 
% model of approximation. Receives a current 1 X 3 SIR matrix and a
% specified p value.
% ------------------------------------------------------------------------
function interval = ReedFrost(sir, p)
    sn = sir(1);
    in = sir(2);

    % Cannot have a sample size less than 1
    if sn < 1
        interval = NaN;
        return
    end

    % k: a vector of possible s_n+1
    k = [sn:-1:0];
    
    % qn: probability of no contact with the infected at given time n
    qn = (1 - p).^in;

    % sn Choose k
    for i = 1:sn+1
        nCk(i) = nchoosek(sn, k(i));
    end
    
    % Reed Frost Equation
    qnk = qn.^k;
    component1 = nCk .* qnk;
    component2 = (1 - qn).^(sn - k);
    probability = component1 .* component2;
    
    % Rearranges the values: interval(i+2) = interval(i) + interval(i+1)
    tmp = 0;
    for i = 1:length(probability)
        interval(i) = probability(i) + tmp;
        tmp = interval(i);
    end
end

