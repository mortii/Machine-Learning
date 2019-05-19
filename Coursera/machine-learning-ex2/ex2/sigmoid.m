function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).
[rows, columns] = size(z);

for row = 1:rows
    for column = 1:columns
        g(row, column) = 1/(1 + exp(-z(row, column)));
    end
end

g; 
% =============================================================

end
