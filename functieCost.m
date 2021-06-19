function [L, grad] = functieCost(params, Y, R, u, i,f, beta)

    P = reshape(params(1:i*f), i, f);
    Q = reshape(params(i*f+1:end),u, f);

    L = 0;
    P_grad = zeros(size(P));
    Q_grad = zeros(size(Q));

    for user = 1 : u
        for item = 1 : i
            L = L + (Y(item, user) - P(item, :) * Q(user, :)') .^ 2 + beta  * ( norm(P(item, :)) ^ 2 + norm(Q(user, :)) ^ 2);
        end
    end
    
    grad = [P_grad; Q_grad];
end
