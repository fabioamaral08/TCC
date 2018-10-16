%% cell2Mat: function description
function [mat] = celula2mat(celula)
	[lin col] = size(celula);
	mat = zeros(lin,col);

	for i=1:lin
		for j = 1: col
			mat(i,j) = celula(i,j).valor;
		end
	end
end
