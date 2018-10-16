clc
h = [linspace(0.1,0.1,15) linspace(0.005,0.005,40) linspace(0.1,0.1,13)];
k = h;
l = size(k,2)+1;
Dom = zeros(l);

%bordas
Dom(1,:) = 75;
Dom(end,:) = 75;
Dom(:,end) = 75;
Dom(:,1) = 75;
Dom(35:end, 35:end) = 75;
Dom(36:end, 36:end) = NaN;

domCell = mat2celula(Dom);
t = 0.008;
itMax = 50;
alpha = 0.51328;

metImplicito(domCell,alpha,h,k,t,itMax);