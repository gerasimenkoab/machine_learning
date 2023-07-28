function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
dlt = zeros(K, 1);
tmp = zeros(K);
v=0;
p=0;
for( i = 1:size(X,1))
%  idx(i) = 1;
%  delt_min = (X(i,1)-centroids(1,1))^2 +(X(i,2)-centroids(1,2))^2;
%  for(j = 2:K)
%    delt = (X(i,1)-centroids(j,1))^2 +(X(i,2)-centroids(j,2))^2;
%    if (delt < delt_min)
%      delt_min = delt;
%      idx(i) = j;
%    endif
%  endfor
%%  dlt = (centroids .- X(i,:)) * (centroids .- X(i,:))' ;
  tmp = centroids - X(i,:);
  tmp = tmp .* tmp;
%  dlt = tmp(:,1) + tmp(:,2);
  dlt = sum(tmp,2);
  [~, p] = min(dlt);
  idx(i) = p;
end





% =============================================================

end

