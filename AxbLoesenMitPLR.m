function X =  AxbLoesenMitPLR(A,B)
  #check size


  [n,m] = size(B);
  [P,L,R] = ZSFmitPLR(A);

  X = zeros(n,m);
  for i = 1:m
    b = B(:, i);
    y = solveLyPb(L,P,b);
    x = solveRxy(R,y);
    for j = 1:n
      X(j,i) = x(j)
    endfor
  endfor
end
