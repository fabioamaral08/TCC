%% mat2cell: function description
function [matCell] = mat2celula(mat)
	[lin col] = size(mat);

	matCell(lin,col).tipo = 0;
	matCell(lin,col).valor = mat(lin,col);
	matCell(lin,col).pos = 0;
	for i = 1:lin
		matCell(i,1).tipo = 0;
		matCell(i,1).valor = mat(i,1);
		matCell(i,1).pos = 0;

		matCell(i,end).tipo = 0;
		matCell(i,end).valor = mat(i,end);
		matCell(i,end).pos = 0;
	end
	for i = 1:col
		matCell(1,i).tipo = 0;
		matCell(1,i).valor = mat(1,i);
		matCell(1,i).pos = 0;
		
		matCell(end,i).tipo = 0;
		matCell(end,i).valor = mat(end,i);
		matCell(end,i).pos = 0;
	end

	for i = 1:lin
		for j = 1:col
			if isnan(mat(i,j))
				matCell(i,j).tipo = -1;
				matCell(i,j).valor = mat(i,j);
				matCell(i,j).pos = 0;
			end
		end
	end
	cont = 1;
	for i = 2:lin-1
		for j = 2:col-1
			if ~isnan(mat(i,j))
				pos = cont;
				t = 1;
				if matCell(i+1,j).tipo == -1 || matCell(i-1,j).tipo == -1 || matCell(i,j+1).tipo == -1 || matCell(i,j-1).tipo == -1
					cont = cont-1;
					pos = 0;
					t = 0;
				end
				matCell(i,j).tipo = t;
				matCell(i,j).valor = mat(i,j);
				matCell(i,j).pos = pos;
				cont = cont+1;
			end
		end
	end


end