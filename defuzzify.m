function greenTime = defuzzify(ruleOutputs)
% Defuzzification using centroid method
% Green light duration range: 10-60 seconds

x = 10:1:60; % crisp output range
% Define triangular MFs for output
shortMF = max(0, min(1, (30 - x)/20));
mediumMF = max(0, min((x-20)/20, (50-x)/20));
longMF = max(0, min(1, (x-40)/20));

% Clip MF by rule strength
shortClipped = min(shortMF, ruleOutputs.Short);
mediumClipped = min(mediumMF, ruleOutputs.Medium);
longClipped = min(longMF, ruleOutputs.Long);

% Aggregate outputs
aggMF = max(max(shortClipped, mediumClipped), longClipped);

% Centroid method
greenTime = sum(x .* aggMF) / sum(aggMF);
end
