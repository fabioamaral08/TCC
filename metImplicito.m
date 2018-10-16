%% metImplicito: function description
function [resp] = metImplicito(dom,alpha,h,k,t,itMax,nome)
	[lin col] = size(dom);
	numIncog = 0;
	for i= 1:lin
		for j = 1:col
			if dom(i,j).tipo == 1
				numIncog = numIncog+1;
			end
		end
	end
	A = zeros(numIncog);
	b = zeros(numIncog,1);
	alpha = 2*alpha*t;
	for it = 1:itMax

		for i = 2:lin-1
			for j = 2:col-1
				if dom(i,j).tipo == 1
					sigH = (alpha)/(h(j-1)+h(j));
					sigK = (alpha)/(k(i-1)+k(i));
					p = dom(i,j).pos;
					b(p) = dom(i,j).valor;
					A(p,p) = 1 + (alpha*(h(j-1)*h(j) + k(i-1)*k(i)))/(h(j-1)*h(j) * k(i-1)*k(i));

					if dom(i+1,j).tipo == 0
						b(p) = b(p) + dom(i+1,j).valor * sigK/k(i);
					else
						A(p,dom(i+1,j).pos) = -sigK/k(i);
					end

					if dom(i-1,j).tipo == 0
						b(p) = b(p) + dom(i-1,j).valor*sigK/k(i-1);
					else
						A(p,dom(i-1,j).pos) = -sigK/k(i-1); 
					end

					if dom(i,j+1).tipo == 0
						b(p) = b(p) + dom(i,j+1).valor*sigH/h(j);

					else
						A(p,dom(i,j+1).pos) = -sigH/h(j);
					end

					if dom(i,j-1).tipo == 0
						b(p) = b(p) + dom(i,j-1).valor*sigH/h(j-1);

					else
						A(p,dom(i,j-1).pos) = -sigH/h(j-1);
					end

				end
			end
		end
		x = A\b;
		for i = 2:lin-1
			for j = 2:col-1
				if dom(i,j).tipo == 1
					dom(i,j).valor = x(dom(i,j).pos);
				end
			end
		end
		u = celula2mat(dom);	
		[f,sb] = printaBarra(formaImagem(u,h,k));
		geraVideo(f,sb,nome,it,it*t);
	end
	resp = celula2mat(dom);
end