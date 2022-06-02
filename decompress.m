function [img] = compress(originalImg, k) % aparentemente a compress faz o trabalho da decompress
  [originalImg, cmap] = imread(originalImg);
  #imshow(imagem);                 # mostra imagem
  [p, colunas, rgb] = size(originalImg) # tamanho da imagem
  n = round((p+k)/(1+k))           # tamanho nxn (arredonda o n)
  #fix(int de menor valor abs), floor(int antecessor), ceil(int sucessor, round(int mais prox)
  img = zeros(n, n, 3);
  for x = 1: (n-1);
     for y = 1: (n-1);
       if (mod(y, (k+1)) != 0) & (mod(x, (k+1)) != 0);
         img(x, y, :) = originalImg((x)*(k+1), (y)*(k+1), :); # tmb pode usar funçaõ mod(i,k+1) do octave
       endif
      endfor
    endfor
  #aux = round((p-n)/2)             # valor auxiliar para manter a subimg no centro
  #lin_ini = aux; lin_fim = aux+n; col_ini = aux; col_fim = aux+n;
  #img = imagem(lin_ini:lin_fim, col_ini:col_fim, :);      # comprime
  imwrite (uint8(img),"compressed.png", "Compression", "none"); # cria imagem comprimida
endfunction

