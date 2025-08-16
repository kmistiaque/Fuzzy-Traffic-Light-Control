function ruleOutputs = evaluateRules(fuzzyInputs)
% Evaluate fuzzy rules for traffic light control
% Output is membership degree of green light duration categories

% Rule base (Mamdani, AND = min)
ruleOutputs.Short = min(fuzzyInputs.Traffic.Low, fuzzyInputs.Waiting.Short);
ruleOutputs.Medium = max(min(fuzzyInputs.Traffic.Medium, fuzzyInputs.Waiting.Medium), ...
                        min(fuzzyInputs.Traffic.Low, fuzzyInputs.Waiting.Medium));
ruleOutputs.Long = max(min(fuzzyInputs.Traffic.High, fuzzyInputs.Waiting.Long), ...
                       min(fuzzyInputs.Traffic.Medium, fuzzyInputs.Waiting.Long));
end
