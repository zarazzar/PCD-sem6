function y = fungsi_geometric(x)
bad = find(x==0);
newx = x;
newx(bad) = 1;

newx = power(newx, (1/prod(size(x))));
y = prod(newx(:));
