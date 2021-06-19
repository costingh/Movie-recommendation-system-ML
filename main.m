%% 1: Incarcam datele

%  Y - este o matrice cu dimensuinile 1682x943 (1682 filme si 943 useri), care contine ratingul dat de un user unui film (1-5)
%  R - este o matrice cu dimensuinile 1682x943, unde R(i,j) = 1 daca userul j a dat un rating filmului i

% Vom incarca Y si R
[Y,R] = loadDataset('u1.base');
listaFilme = incarcaDateFilme();
[T,Tr] = loadDataset('u1.test');

% u = users - useri
% m = movies - filme
% f = features - caracteristici 
u = size(Y, 2);
i = size(Y, 1);
f = 10;
N = 80000;
P = rand(i,f);
Q = rand(u,f);
Pp = P;
Qq = Q;

param_initiali1 = [P(:); Q(:)];
param_initiali2 = [Pp(:); Qq(:)];

alpha = 0.0001;
beta = 0.01;
tol = 0.8;
maxIter = 150;

ALS_regularization_term = 0.01;
ALS_tolerance = 0.9;
ALS_maxIter = 50;

% SGD
% tic
% [P, Q, iteratii, eroare] =  SGD(i, u, Y, P, Q, R, alpha, maxIter, tol, beta);
% toc
% title('Stochastic Gradient Descend (SGD)')
% plot(iteratii, eroare, 'LineWidth',2, 'DisplayName','Training Data')
% ylabel('RMSE')
% xlabel('Iteratii')
% hold on
% 
% 
% [Pp, Qq, iteratii, eroare] =  SGD(i, u, T, Pp, Qq, Tr, alpha, maxIter, tol, beta);
% title('Stochastic Gradient Descend (SGD)')
% plot(iteratii, eroare, 'LineWidth',2, 'DisplayName','Testing Data')
% ylabel('RMSE')
% xlabel('Iteratii')
% hold off
% legend



% ALS
% tic
% N = 100011;
% [P, Q, iteratii, eroare] =  ALS(i,u,f, Y,P,Q, R,alpha, ALS_maxIter, ALS_tolerance, ALS_regularization_term, N);
% toc
% title('Alternating Least Square (ALS)')
% plot(iteratii, eroare, 'LineWidth',2)
% ylabel('RMSE')
% xlabel('Iteratii')



% FMINUNC
% options = optimset('GradObj', 'on', 'LargeScale', 'off', 'MaxIter', 300, 'TolX',1e-2);
% tic
% min = fminunc (@(t)(functieCost(t, Y, R, u, i,f, beta)),param_initiali1, options);
% toc
% P = reshape(min(1:i*f), i, f);
% Q = reshape(min(i*f+1:end), u, f);  
% N = 100011;
% suma_erori = 0;
% for user = 1 : u
%     for item = 1 : i
%         if R(item,user) == 1
%             Y_rating_prezis = P(item,:) * Q(user,:)';
%             suma_erori = suma_erori + (Y(item,user) - Y_rating_prezis) .^ 2;
%         end
%     end
% end
% RMSE = sqrt (1/N * suma_erori)






