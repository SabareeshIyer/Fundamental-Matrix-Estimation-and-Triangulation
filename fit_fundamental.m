function F = fit_fundamental(matches)

    matchCount = size(matches(:, 1));
    A = [];
    for i=1:matchCount
        xi = matches(i,1);              yi = matches(i,2);
        xi_prime = matches(i,3);        yi_prime = matches(i,4);
        
        temp_mat = [xi*xi_prime, xi*yi_prime, xi, yi*xi_prime,...
                    yi*yi_prime, yi, xi_prime, yi_prime 1];
        A = [A; temp_mat];
    end
    [U, S, V] = svd(A);
    F = reshape(V(:,9), 3, 3);
    
    [u, s, v] = svd(F);
    s(end) = 0;
    F = u*s*v';
    
end