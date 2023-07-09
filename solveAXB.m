function X =  solveAXB(A,B)
  #check size
  transposed = false;
  [n,m] = size(B);
  [p,q] = size(A);
  if n ~= p
   if m == p
    B = B.';
    transposed = true;

   else
    error('The sizes of the matrices do not match');
    end
  endif
  [n,m] = size(B);
  #precalculate P L R
  [P,L,R] = ZSFmitPLR(A);

  X = zeros(n,m);
  #for each colum b in B solve A*x = b
  for i = 1:m
    b = B(:, i);
    y = solveLyPb(L,P,b);
    x = solveRxy(R,y);

    #put x in X
    for j = 1:n
      X(j,i) = x(j);
    endfor
  endfor
  if transposed
   X = X.';
  endif
  A
  B
  P
  L
  R
  X
end
