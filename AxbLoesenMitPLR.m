function X =  AxbLoesenMitPLR()
  #read A and B from console
  A = input('Input A: like [1,2;3,4;5,6;7,8;9,10] ');
  if not(ismatrix(A))
   error('A is not a matrix');
  endif
  B = input('Input B: like [1,2;3,4;5,6;7,8;9,10] ');
  if not(ismatrix(B))
   error('A is not a matrix');
  endif

  #solve A*X = B for X
  solveAXB(A,B);

end
