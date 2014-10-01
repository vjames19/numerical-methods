function newtonRhapson_assignment

	%Part A - Plot the function.
	ezplot('0.5*x^3 - 4*x^2 + 5.5*x - 1', [-10, 10]) %% Plots the function between -10 and 10

	%Part B - Find the roots.
	syms x;
	fx = 0.5*x^3 - 4*x^2 + 5.5*x - 1;
	epsilon = 0.0001;
	NewtonRhapsonRootOf(fx, 0.3, epsilon)
	NewtonRhapsonRootOf(fx, 1.2, epsilon)
	NewtonRhapsonRootOf(fx, 6, epsilon)
end

function [ root ] = NewtonRhapsonRootOf(fx, x0, epsilon)
	%Finds the root of fx using the Newton Rhapson method.
	% fx - symbolic function.
	% x0 - Initial Guess.
	% epsilon - Error threshold
	%   Detailed explanation goes here
	df = diff(fx);
	error = Inf;

	while error > epsilon
	    root = x0 - double(subs(fx, x0))/double(subs(df, x0)); %subs evaluates the symbolic expression
	    error = abs(root - x0)/ abs(root);
	    x0 = root;
	end
end