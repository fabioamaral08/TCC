%% verMalha: function description
function [malha] = verMalha(h,k)
	h = h(:);, k = k(:);
	minH = min(h);
	minK = min(k);
	espacoH = [round(h'/minH)*20 0];
	espacoK = [round(k'/minK)*20 0];
	malha = ones(sum(espacoK),sum(espacoH));
	col = size(h,1) + 1;
	lin = size(k,1) + 1;
	espH = floor(col/10);
	espK = floor(lin/10);

	ey = 1;

	for i = 1:lin
		malha(ey:ey+espK,:) = 0;
		ey = ey+espacoK(i);
	end
	ex = 1;
	for i = 1:col
		malha(:,ex:ex+espH) = 0;
		ex = ex + espacoH(i);
	end
end