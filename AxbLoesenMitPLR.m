function X =  AxbLoesenMitPLR(A,B)
  #check size
  [n,m] = size(B);
  [p,q] = size(A);
  if n ~= p
    error('The sizes of the matrices do not match');
  end

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
      X(j,i) = x(j)
    endfor
  endfor
end
