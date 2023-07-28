function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;


% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
posIdx = find(y == 1);
negIdx = find(y == 0);
plot(X(posIdx,1),X(posIdx,2),'k+', 'LineWidth',2);
plot(X(negIdx,1),X(negIdx,2),'ro', 'LineWidth',2);
%for i=1:length(y)
%   if(y(i) > 0)
%     plot(X(i,1),X(i,2),'k+', 'LineWidth',2);
%   else
%     plot(X(i,1),X(i,2),'ro', 'LineWidth',2);
%   end
%end









% =========================================================================



hold off;

end
