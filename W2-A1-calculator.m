%%% Week 02 - Assignment: MATLAB as a Calculator
% Your first MATLAB problem.

% We borrowed $1000 at a 10% annual interest rate. If we did not make a payment for two years, and assuming there is no
% penalty for non-payment, how much do we owe now? Assign the result to a variable called 'debt'.

debt = 1000;
years = 2;
for year = 1:1:years
    rate = 0.1*debt;
    debt = debt + rate;
end;
disp(debt);
