% Placa 5x1 m

h = [linspace(0.1,0.1, 2) linspace(0.01,0.01, 7) linspace(0.005, 0.005, 92) linspace(0.01,0.01, 7) linspace(0.1,0.1, 2)];
k = [linspace(0.1,0.1, 2) linspace(0.01,0.01, 7) linspace(0.005, 0.005, 92) linspace(0.01,0.01, 7) linspace(0.1,0.1, 2)];

c = size(h,2)+1;
l = size(k,2)+1;
Dom = zeros(l,c);

%sum(k)
%sum(h)

%bordas
Dom(1,:) = 200;
Dom(end,:) = 200;
Dom(:,end) = 200;
Dom(:,1) = 200;
Dom(41:70,41:70) = -40;
Dom(42:69, 42:69) = NaN;

%img = formaImagem(Dom,h,k);
%printaBarra(img);
%imshow(verMalha(h,k))

domCell = mat2celula(Dom);
t = 0.01;
itMax = 2000;
alpha = 174/(19250 * .135); %propriedades do tungstenio
metImplicito(domCell,alpha,h,k,t,itMax,'apresPrototipo');

