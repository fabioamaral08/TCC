%% geraVideo: function description
function [] = geraVideo(f,sb,nome,num,tempo)
	titulo = sprintf('Propagacao do calor: %.2f s',tempo);
	title(sb,titulo);	
	nomeArquivo = sprintf('video/%s_%i.png',nome,num);
	saveas(f,nomeArquivo);
end


