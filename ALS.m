function [P, Q, iter_vect, err_vect] = ALS(items,users,features, Y,P,Q, R,alpha, maxIter, tol, regularization_term, N)
    iter = 0;
    
    iter_vect = zeros(maxIter,1);
    err_vect = zeros(maxIter,1);
    
    while iter < maxIter    
        suma_erori = 0;

        for i = 1 : items
            for u = 1 : users
                if R(i,u) == 1
                    eroare = Y(i, u) - P(i, :) * Q(u, :)';
                    suma_erori = suma_erori + eroare ^ 2;
                      
                    P(i,:) = (Y(i,u) * Q(u,:) * (Q(u,:)' * Q(u,:) + regularization_term * eye(features, features)) ^ -1)';
                    Q(u,:) = (Y(i,u) * P(i,:) * (P(i,:)' * P(i,:) + regularization_term * eye(features, features)) ^ -1)';   
                end
            end
        end
        RMSE = sqrt (1/N * suma_erori);
        iter = iter + 1;         
        iter_vect(iter,1) = iter; 
        err_vect(iter,1) = RMSE; 
    end 
end




