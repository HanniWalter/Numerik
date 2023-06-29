
function [P,L,R] = ZSFmitPLR(matrix)
    [rows, cols] = size(matrix);

    # check sqaure
    if rows != cols
        disp('Die Matrix ist nicht quadratisch.');
        L = 0
        R = 0
        P = 0
        return
    end
    #check inversable
    #todo

   #create P
    matrix_copy = matrix;
    z = 1:rows;
    for j = 1:cols
      largest_i = j;
      for i = j:rows
        if abs(matrix_copy(i,j)) > abs(matrix_copy(largest_i,j))
          largest_i = i;
        endif
      endfor
      X = [j,largest_i];
      matrix_copy(X,:) = matrix_copy(X([2,1]),:);
            z([j largest_i]) = z([largest_i j])
    endfor
    P = zeros(rows,cols);

    for i = 1:rows
     P(i,z(i)) = 1;
    endfor
    #P created

    A = P*matrix
    [L,R] = algo3(A,rows);
end
