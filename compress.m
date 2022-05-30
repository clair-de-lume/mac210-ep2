function compress(originalImg, k)
  origImg = imread (originalImg);
  procImg = process_my_image (origImg);
  imwrite ("compressed.png", procImg, "Compression", k);
endfunction
   