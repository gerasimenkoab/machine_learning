function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%


for j = 1:size(Theta,1)
tet = Theta(j,:);
r1 = (X * (tet.') - Y(:,j)) .* R(:,j);
r1sq = r1.' * r1  ;
J = J + r1sq;

end
J = J / 2;


% gradient part
% x gradient
for k = 1:size(X,2)
  for i = 1:size(X,1)    
    tet = X(i,:);
    tst1 = Theta(:,k).* R(i,:).';
    tst2 = Theta * (tet.') - Y(i,:).';
    r1 = ( Theta(:,k).* R(i,:).').' * (Theta * (tet.') - Y(i,:).');
    X_grad(i,k)= r1;
  end
end

%theta gradient
%theta part
for k = 1:size(Theta,2)
  for j = 1:size(Theta,1)    
    tet = Theta(j,:);
    tst1 =  X(:,k).* R(:,j);
    tst2 = X * (tet.') - Y(:,j);
    r1 = ( X(:,k).* R(:,j)).' * (X * (tet.') - Y(:,j));
    Theta_grad(j,k) = r1;
  end
end







% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
