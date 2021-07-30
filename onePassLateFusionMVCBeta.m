function [Y,C,WP,beta,obj] = onePassLateFusionMVCBeta(KH,k)

num = size(KH, 2); %the number of samples
numker = size(KH, 3); %m represents the number of kernels
maxIter = 100; %the number of iterations
[HP,WP] = myInitialiHp(KH,k);
beta = ones(numker,1)*sqrt(1/numker);
[C] = myInitializationC(KH,k);

flag = 1;
iter = 0;

RpHpwp = zeros(num,k); % k - clusters, N - samples
for p=1:numker
    RpHpwp = RpHpwp +  beta(p)*(HP(:,:,p)*WP(:,:,p));
end

while flag
    iter = iter +1;
    %---the first step-- optimize Y with given (WP C,and beta)
    YB  = RpHpwp*C';
    [Y] = mySolving(YB);
    
    %%--the second step-- optimize C with (Y, WP and beta)
    CB = Y'*RpHpwp;
    [Uh,Sh,Vh] = svd(CB,'econ');
    C = Uh*Vh';
    
    %---the third step-- optimize beta with (C, Y and WP)
    beta = updateBetaOPLFMVC(HP,WP,Y,C);
    
    %---the fourth step-- optimize WP with (C, Y and beta)
    WP = updateWPOPLFMVC(HP,Y,C);
    
    %---Calculate Obj--
    RpHpwp = zeros(num,k);
    for p = 1:numker
        RpHpwp = RpHpwp + beta(p)*HP(:,:,p)*WP(:,:,p);
    end
    obj(iter) = trace((Y*C)'*RpHpwp);
    if (iter>2) && (abs((obj(iter)-obj(iter-1))/(obj(iter)))<1e-4 || iter>maxIter)
        flag =0;
    end
%     if (iter>2) && (iter>maxIter)
%         flag =0;
%     end
end
% H_normalized = Hstar./ repmat(sqrt(sum(Hstar.^2, 2)), 1,k);