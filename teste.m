 alpha = 0.0834;
 A = zeros(31);
 t = 0.05;
 it = 100;
 h = ones(30,1)*0.1;
 k = h;
 A(:,1) = 100;
 A(:,end) = 100;
 A(end,:) = 100;
 A(1,:) = 100;
 Ac = mat2cell(A);
 r = metImplicito(Ac,alpha,h,k,t,it);

 h = [0.1 0.1 .005 * ones(1,40) 0.1 .005 * ones(1,40) 0.1 0.1 0.1 ]