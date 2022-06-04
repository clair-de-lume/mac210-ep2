function [err] = calculateError(originalImg, decompressedImg)
  originalImg = imread(originalImg);
  decompressedImg = imread(decompressedImg);
  origR = originalImg(:, :, 1); origG = originalImg(:, :, 2); origB = originalImg(:, :, 3);
  decR = decompressedImg(:, :, 1); decG = decompressedImg(:, :, 2); decB = decompressedImg(:, :, 3);
  
  # ta dando erro pq as matrizes tem dimensões diferentes :(
  #errR = (norm(origR-decR, 2))/(norm(origR, 2);
  #errG = (norm(origG-decG, 2))/(norm(origG, 2);
  #errB = (norm(origB-decB, 2))/(norm(origB, 2);
  
  #err = (errR + errG + errB)/3;
  endfunction