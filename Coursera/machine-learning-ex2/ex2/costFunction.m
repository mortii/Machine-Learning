function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

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
%
% Note: grad should have the same dimensions as theta
%


J = cost(theta, X, y);
grad = gradient(theta, X, y, m);





% =============================================================

end

function c = cost(theta, X, y)
m = length(X);
sum = 0;
for row = 1:m
    y_value = y(row);
    expected_x = hyp(theta, X(row,:));
    
    sum = sum + -y_value * log(expected_x) - (1 - y_value) * log(1 - expected_x);
end
c = 1/m * sum;
end

function h = hyp(theta, x)
%fprintf('size of theta: m:%d, n:%d \n', size(theta));
%fprintf('size of x: m:%d, n:%d \n', size(x));
h = sigmoid((theta'*x'));
end

function g = gradient(theta, X, y, m)
grad = zeros(size(theta));
[grad_rows,grad_columns] = size(grad);

for grad_row = 1:grad_rows
    for grad_column = 1:grad_columns
        
        sum = 0;
        X_rows = length(X);
        for X_row = 1:X_rows
            
            %( sum of: (x-example vector - y element)*x element scalar%
            x_scalar = X(X_row,grad_row);
            y_value = y(X_row);
            expected_output = hyp(theta, X(X_row,:));

%             fprintf('x_scalar:%d \n', x_scalar);
%             fprintf('y_value:%d \n', y_value);
%             fprintf('expected_output:%d \n', expected_output);

            sum = sum + (expected_output - y_value) * x_scalar;

        end
        grad(grad_row, grad_column) = 1/m * sum;
    end
    
end
g = grad;
end


