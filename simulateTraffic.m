function simulateTraffic(timeSteps, trafficDensity, waitingTime)
% Simulate traffic light control with flexible inputs
%
% Inputs (all optional):
%   timeSteps       : number of simulation steps (default = 50)
%   trafficDensity  : array of traffic density values
%   waitingTime     : array of waiting times
%
% Function works with:
%   - Random traffic (no trafficDensity or waitingTime provided)
%   - Manual arrays (trafficDensity, waitingTime arrays provided)
%   - Single input (1 trafficDensity and 1 waitingTime)

% Identify mode
if nargin < 2 || isempty(trafficDensity)
    mode = 'Random Traffic Simulation';
    trafficDensity = randi([0 20], 1, timeSteps);
elseif length(trafficDensity) == 1 && length(waitingTime) == 1
    mode = 'Single Input Green Light Calculation';
else
    mode = 'Manual Traffic Simulation';
end

disp(['=== Mode: ', mode, ' ===']);

% Ensure arrays match timeSteps for multi-step simulations
if length(trafficDensity) < timeSteps
    trafficDensity = repmat(trafficDensity, 1, ceil(timeSteps/length(trafficDensity)));
    trafficDensity = trafficDensity(1:timeSteps);
end
if length(waitingTime) < timeSteps
    waitingTime = repmat(waitingTime, 1, ceil(timeSteps/length(waitingTime)));
    waitingTime = waitingTime(1:timeSteps);
end

% Pre-allocate output
greenTimes = zeros(1, timeSteps);

% Run fuzzy controller for each time step
for t = 1:timeSteps
    fuzzyInputs = fuzzify(trafficDensity(t), waitingTime(t));
    ruleOutputs = evaluateRules(fuzzyInputs);
    greenTimes(t) = defuzzify(ruleOutputs);
    
    % Display single input info for single input mode
    if strcmp(mode, 'Single Input Green Light Calculation')
        disp(['Traffic Density: ', num2str(trafficDensity(t)), ...
              ', Waiting Time: ', num2str(waitingTime(t)), ...
              ' sec --> Green Light Duration: ', num2str(greenTimes(t)), ' sec']);
        return; % Stop after first step for single input
    end
end

% For multi-step simulations, show plots
if ~strcmp(mode, 'Single Input Green Light Calculation')
    figure;
    subplot(3,1,1); plot(1:timeSteps, trafficDensity, 'b-o');
    xlabel('Time Step'); ylabel('Traffic Density (vehicles)');
    title('Traffic Density');

    subplot(3,1,2); plot(1:timeSteps, waitingTime, 'r-o');
    xlabel('Time Step'); ylabel('Waiting Time (sec)');
    title('Waiting Time');

    subplot(3,1,3); plot(1:timeSteps, greenTimes, 'g-o');
    xlabel('Time Step'); ylabel('Green Light Duration (sec)');
    title('Green Light Duration by Fuzzy Controller');
end

end
