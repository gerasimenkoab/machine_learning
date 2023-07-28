function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

n=length(theta);
temp1 = (log(sigmoid(X*theta)))'* y;
temp2 = (log( ones(m,1) - sigmoid(X*theta) ))' * (ones(m,1) - y);
J = -(temp1 + temp2) / m+ theta(2:n)' * theta(2:n) *lambda/(2*m);

grad(1) = ( (sigmoid(X * theta) - y)' * X(1:m,1) ) / m;
temp3 = zeros(n);
temp4 = zeros(n);
temp3(2:n) = (sigmoid(X * theta) - y)' * X(1:m,2:n);
temp4(2:n) = lambda*theta(2:n);
grad(2:n) = ( temp3(2:n) + temp4(2:n) ) / m;

%temp1 = (log(sigmoid(X*theta)))'* y;
%temp2 = (log( ones(m,1) - sigmoid(X*theta) ))' * (ones(m,1) - y);
%J = -(temp1 + temp2) / m+ theta' * theta *lambda/(2*m);

%grad = ( (sigmoid(X * theta) - y)' * X + lambda*theta ) / m;


% =============================================================

end
