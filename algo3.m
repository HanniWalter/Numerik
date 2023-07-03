# helper for ZSFmitPLR
# see script for pseudocode
# creates 0 colums below the main diagonal

function [L,A] = algo3(A, n)
   L = eye(n)
   for k = 1:n-1
    for i = k+1 : n
      L(i,k) = A(i,k) / A(k,k);
      for j = k : n
        A(i,j) = A(i,j)- A(k,j) * L(i,k)
      endfor
    endfor
  endfor
end

