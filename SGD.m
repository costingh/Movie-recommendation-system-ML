function [P, Q, iter_vect, err_vect] = SGD(items,users, Y,P,Q, R, alpha, maxIter, tol, regularization_term)    
    eroare = zeros(items,users);
    iter = 0;
    iter_vect = zeros(maxIter,1);
    err_vect = zeros(maxIter,1);
    
    while iter < maxIter
        suma_erori = 0;  
        for u = 1 : users
            for i = 1 : items
                if R(i,u) == 1
                       eroare(i, u) = Y(i, u) - P(i, :) * Q(u, :)';                                   
                       
                       Q_gradient = - 2 * (eroare(i, u) * P(i,:) - regularization_term * Q(u,:));
                       P_gradient = - 2 * (eroare(i, u) * Q(u,:) - regularization_term * P(i,:));

                       Q_temp = Q(u,:) - alpha * Q_gradient;
                       P_temp = P(i,:) - alpha * P_gradient;

                       Q(u, :) = Q_temp;
                       P(i, :) = P_temp;
                       
                       suma_erori = suma_erori + eroare(i, u) .^ 2;
                end                     
            end
        end
                
        suma_erori = 0;
        n = 0;
        for i = 1 : items        
            for u = 1 : users
               if R(i,u) == 1
                    Y_rating_prezis = P(i,:) * Q(u,:)';
                    suma_erori = suma_erori + (Y(i,u) - Y_rating_prezis) .^ 2;
                    n = n + 1;
                end
            end   
        end
        
        RMSE = sqrt (1/n * suma_erori);
        iter = iter + 1;   
        iter_vect(iter,1) = iter; 
        err_vect(iter,1) = RMSE; 
        
        if RMSE < tol
            return;
        end
    end 
end







