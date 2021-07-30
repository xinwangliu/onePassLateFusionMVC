function WP = updateWPOPLFMVC(HP,Y,C)

k = size(HP,2);
numker = size(HP,3);
WP = zeros(k,k,numker);

Hstar = Y*C;
for p = 1 : numker
    Tp = HP(:,:,p)'*Hstar;
    [Up,Sp,Vp] = svd(Tp,'econ');
    WP(:,:,p) = Up*Vp';
end