function [HP,WP] = myInitialiHp(KH,k)

numker = size(KH,3);
num = size(KH,1);
% %--Initializing HP and WP
HP = zeros(num,k,numker);
WP = zeros(k,k,numker);
opt.disp = 0;
for p =1:numker
    KAp = KH(:,:,p);
    KAp = (KAp+KAp')/2+1e-8*eye(num);
    [Hp, ~] = eigs(KAp, k, 'la', opt);
    HP(:,:,p) = Hp;
    WP(:,:,p) = eye(k);
end