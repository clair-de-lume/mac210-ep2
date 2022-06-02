function compress(originalImg, k)
  originalImg = imread(originalImg);
  #imshow(imagem);                 # mostra imagem
  [p, colunas, rgb] = size(originalImg) # tamanho da imagem
  n = round((p+k)/(1+k))           # tamanho nxn (arredonda o n)
  #fix(int de menor valor abs), floor(int antecessor), ceil(int sucessor, round(int mais prox)
  img = zeros(n, n, 3);
  for x = 1: n;
     for y = 1: n;
       img(x, y, :) = originalImg(x*(k+1), y*(k+1), :);
       y = y + 1;
     endfor
     x = x + 1;
  endfor
  #aux = round((p-n)/2)             # valor auxiliar para manter a subimg no centro
  #lin_ini = aux; lin_fim = aux+n; col_ini = aux; col_fim = aux+n;
  #img = imagem(lin_ini:lin_fim, col_ini:col_fim, :);      # comprime
  imwrite (img, "compressed.png", "Compression", "none"); # cria imagem comprimida
endfunction
