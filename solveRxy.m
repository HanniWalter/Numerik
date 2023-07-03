function x = solveRxy(R,y)
  #sizecheck
  if isrow(y)
    y = y.';
  end

  [n, m] = size(R);
  [s, _] = size(y);
  if n ~= m || m ~= s
    error('Die Größen der Matrizen passen nicht zusammen.');
  end
  x = zeros(n,1)

  for i = n:-1:1
   for j = i-1:-1:1


    a = - R(j,i) / R(i,i);
    R(j,i) = R(j,i) + a * R(i,i);
    y(j) = y(j) + a * y(i);
   endfor
  endfor
  for i = 1:n
    x(i) = y(i)/R(i,i)
  endfor
  end

