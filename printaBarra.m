%% printaBarra: function description
function [f,sb] = printaBarra(u,gera,num,tempo,lim)
	f = figure(1,'visible','on');;

	axis on
	sb = subplot(1,1,1);
	imshow(u)
	colormap(gca,[1 1 1 ;jet(64)])
	colorbar()
	if nargin > 4
		caxis([min(lim(:)) max(lim(:))]);
	else
		caxis([min(u(:)) max(u(:))]);
	end
	
end

