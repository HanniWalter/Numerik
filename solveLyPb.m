function y = solveLyPb(L,P,b)
  #sizecheck
  if isrow(b)
            b = b.';
  end

  [n, m] = size(L);
  [p, q] = size(P);
  [s, _] = size(b);
    if n ~= m || m ~= p || p ~= q  || q ~= s
        error('Die Größen der Matrizen passen nicht zusammen.');
    end

  y = zeros(n,1)
  Pb = P * b
  for i = 1:n
   for j = i+1:n
    a = - L(j,i) / L(i,i);
    L(j,i) = L(j,i) + a * L(i,i);
    Pb(j) = Pb(j) + a * Pb(i);
   endfor
  endfor
  for i = 1:n
    y(i) = Pb(i)/L(i,i)
  endfor
end
