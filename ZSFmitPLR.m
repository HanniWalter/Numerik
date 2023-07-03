
function [P,L,R] = ZSFmitPLR(matrix)
    [n, m] = size(matrix);

    # check sqaure
    if n != m
        error('Die Matrix ist nicht quadratisch.');
    end

   #create P
    matrix_copy = matrix;
    z = 1:n;
    for j = 1:n
      largest_i = j;
      for i = j:n
        if abs(matrix_copy(i,j)) > abs(matrix_copy(largest_i,j))
          largest_i = i;
        endif
      endfor
      X = [j,largest_i];
      matrix_copy(X,:) = matrix_copy(X([2,1]),:);
            z([j largest_i]) = z([largest_i j])
    endfor
    P = zeros(n,n);

    for i = 1:n
     P(i,z(i)) = 1;
    endfor

    A = P*matrix
    [L,R] = algo3(A,n);
    for i = 1:n
      if R(i,i) == 0
       error('matrix not invertable');
      endif
      if L(i,i) == 0
       error('matrix not invertable');
      endif
    endfor
end
