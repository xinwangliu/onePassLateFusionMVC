function [Y] = mySolving(B)
%% B: num*k
[num,k] = size(B);
[~,I] = max(B,[],2);
Y = zeros(num,k);
for i = 1 : num
    Y(i,I(i)) = 1;
end


