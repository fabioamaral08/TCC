%% formaImagem: function description
function [imagem] = formaImagem(mat,h,k)
	minH = min(h);
	minK = min(k);
	espacoH = [round(h/minH)*10];
	espacoK = [round(k/minK)*10];
	imagem = ones(sum(espacoK),sum(espacoH));
	[lin col] = size(mat);
	ey = 1;
	mask = isnan(mat);
	ignora = min(mat(:)) - 100;
	mat(mask) = ignora;
	for i = 1:lin-1
		ex = 1;
		for j = 1:col-1
			if mat(i,j) == ignora ||mat(i,j+1) == ignora ||mat(i+1,j) == ignora
				continue;
			end
			for u = ey:ey+espacoK(i)
				p1 = (u - ey)/espacoK(i);	
				for v = ex:ex+espacoH(j)
					p0 = (v - ex )/espacoH(j);
					cor0 = mat(i,j) * (1-p0) + mat(i,j+1) * p0;
					cor1 = mat(i+1,j) * (1-p0) + mat(i+1,j+1) * p0;
					imagem(u,v) = cor0 * (1-p1) + cor1 * (p1);
				end
			end
			ex = ex + espacoH(j);
		end
		ey = ey + espacoK(i);
	end
end