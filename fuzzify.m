function fuzzyInputs = fuzzify(trafficDensity, waitingTime)
% Fuzzify the input variables
% Inputs:
%   trafficDensity : number of vehicles (0-20)
%   waitingTime    : waiting time in seconds (0-60)
% Output:
%   fuzzyInputs    : struct with membership values

% Traffic Density Membership Functions
fuzzyInputs.Traffic.Low = max(0, min(1, (10 - trafficDensity)/10));
fuzzyInputs.Traffic.Medium = max(0, min((trafficDensity - 5)/5, (15 - trafficDensity)/5));
fuzzyInputs.Traffic.High = max(0, min(1, (trafficDensity - 10)/10));

% Waiting Time Membership Functions
fuzzyInputs.Waiting.Short = max(0, min(1, (30 - waitingTime)/30));
fuzzyInputs.Waiting.Medium = max(0, min((waitingTime - 10)/20, (50 - waitingTime)/20));
fuzzyInputs.Waiting.Long = max(0, min(1, (waitingTime - 30)/30));
end
