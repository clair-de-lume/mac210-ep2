function compress(originalImg, k)
  img = imread (originalImg); % lê a imagem original e transforma numa matriz
  [linhas, colunas] = size(img)
  % ajuste da imagem aqui
  lin_ini = 100; lin_fim = 150; col_ini = 100; col_fim = 150;
  img = imread("lena.png", "PixelRegion", {[lin_ini lin_fim], [col_ini col_fim]});
  imwrite (img, "compressed.png", "Compression", "none");
endfunction
   
