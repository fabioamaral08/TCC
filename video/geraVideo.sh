#!/bin/bash


##############################################
# Desenvolvido por Leonardo M. N. de Mattos. #
# www.mattos.eng.br                          #
# l (at) mattos.eng.br                       #
##############################################


#Criar o video a partir das imagensi
echo "Gerando video..."
ffmpeg -f image2 -i video_2_%d.png -b 1080k ../output20.avi
echo "...Video gerado!"

#Acelerar o video
echo "Acelerando o video..."
mencoder -speed 16 -o ../output20_fast.avi -ovc lavc ../output20.avi
echo "... video acelerado!"
echo "FIM!"
read -p "aperte"