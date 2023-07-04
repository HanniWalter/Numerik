
function [P,L,R] = ZSFmitPLR(A)
    [n, m] = size(A);

    # check sqaure
    if n != m
        error('the matrix is not a square');
    end

  # create z to create P
    z = 1:n;

# creates 0 colums below the main diagonal saves swaps in z
     L = eye(n)
     for k = 1:n-1
      #row swapping
      largest_index = k;
      for i = k:n
        if abs(A(i,k)) > abs(A(largest_index,k))
          largest_index = i;
        endif
      endfor

      #swapping
      X = [k,largest_index];
      A(X,:) = A(X([2,1]),:);
      z([k largest_index]) = z([largest_index k]);

      for i = k+1 : n
        L(i,k) = A(i,k) / A(k,k);
        for j = k : n
          A(i,j) = A(i,j)- A(k,j) * L(i,k)
        endfor
      endfor
    endfor
    R = A;
   #create P from z
    P = zeros(n,n);
    for i = 1:n
     P(i,z(i)) = 1;
    endfor

    # check if invertable
    for i = 1:n
      if R(i,i) == 0
       error('matrix is not invertable');
      endif
      if L(i,i) == 0
       error('matrix is not invertable');
      endif
    endfor
end
