function [C] = myInitializationC(KH,k)

numker = size(KH,3);
Sigma0 = ones(numker,1)/numker;
avgKer  = mycombFun(KH,Sigma0);
[H_normalized1] = mykernelkmeans(avgKer, k);
H_normalized1 = H_normalized1./ repmat(sqrt(sum(H_normalized1.^2, 2)),1,k);

s = RandStream('mt19937ar','Seed',0);
RandStream.setGlobalStream(s);

[IDX, C] = kmeans(H_normalized1,k, 'MaxIter',200,'Replicates',30);
%% numclass, 'MaxIter',100, 'Replicates',10
C = orth(C);
% %returns the K cluster centroid locations in the K-by-P matrix C.