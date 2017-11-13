function [bloops, trans1, trans2] = normalize(matches)

% normalization %

ctr1 = mean(matches(:,1:2));        ctr2 = mean(matches(:,3:4));

off1 = eye(3);                      off2 = eye(3);
off1(1,3) = -ctr1(1);               off2(1,3) = -ctr2(1);   
off1(2,3) = -ctr1(2);               off2(2,3) = -ctr2(2); 

X1 = max(abs(matches(:,1)));        Y1 = max(abs(matches(:,2)));
X2 = max(abs(matches(:,3)));        Y2 = max(abs(matches(:,4)));
scale1 = eye(3);                    scale2 = eye(3);
scale1(1,1) = 1/X1;                 scale2(1,1) = 1/X2;
scale1(2,2) = 1/Y1;                 scale2(2,2) = 1/Y2;

trans1 = scale1 * off1;             trans2 = scale2 * off2;
hom1(:,1) = matches(:,1);           hom1(:,2) = matches(:,2);       hom1(:,3) = 1;
hom2(:,1) = matches(:,3);           hom2(:,2) = matches(:,4);       hom2(:,3) = 1;
norm1 = (trans1 * hom1')';          norm2 = (trans2 * hom2')';

bloops(:,:) = [norm1(:,1:2), norm2(:,1:2)];

end