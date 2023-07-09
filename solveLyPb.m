function y = solveLyPb(L,P,b)
  #sizecheck
  if isrow(b)
            b = b.';
  end

  [n, m] = size(L);
  [p, q] = size(P);
  [s, _] = size(b);
    if n ~= m || m ~= p || p ~= q  || q ~= s
        error('The sizes of the matrices do not match.');
    end
  #precalculate P * b
  Pb = P * b;

  y = zeros(n,1);
  #Gaussian elimination , bring L in lower triangular form while Lx = Pb is still true
  for i = 1:n
   for j = i+1:n
    a = - L(j,i) / L(i,i);
    L(j,i) = L(j,i) + a * L(i,i);
    Pb(j) = Pb(j) + a * Pb(i);
   endfor
  endfor
  #dig(L) may not be ones so divide y by L(i,i)
  for i = 1:n
    y(i) = Pb(i)/L(i,i);
  endfor
end
