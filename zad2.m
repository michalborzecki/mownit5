function [y] = zad2 (src, k)
  A = rgb2gray(imread(src));
  [U, S, V] = svd(double(A));
  A2 = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
  imshow(uint8(A2));
endfunction
