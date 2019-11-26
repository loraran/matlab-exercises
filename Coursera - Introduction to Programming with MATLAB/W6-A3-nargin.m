%%% Week 06 - Assignment: nargin
% Variable Number of Input Arguments

% Write a function called 'under_age' that takes two positive integer scalar arguments: 
%   a. 'age' that represents someone's age, and 
%   b. 'limit' that represents an age limit. 
% The function returns 'true' if the person is younger than the age limit. If the second argument, 'limit', is not provided,
% it defaults to 21. You do not need to check that the inputs are positive integer scalars.
% The name of the output argument is 'too_young'.

function [too_young] = under_age(age,limit)
    if nargin < 2
        limit = 21;
    end;
    if age < limit
        too_young = true;
    else
        too_young = false;
    end;
end

% Code to call your function:

too_young = under_age(18,18)
too_young = under_age(20)
