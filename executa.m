%% executa: function description
function [] = executa(dom,alpha,h,k,t,itMax)
	domCell = mat2celula(dom);
	metImplicito(domCell,alpha,h,k,t,itMax);
	system('video\geraVideo.sh');
end
