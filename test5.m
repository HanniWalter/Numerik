#fith example throws error
A = [1 2 1 1;2 1 -2 1;1 -2 -1 1;1 1 1 2];
B = [1 1 0 0 0;-2 0 1 0 0;0 0 0 1 0;3 0 0 0 1;3 0 0 0 1];
X= AxbLoesenMitPLR(A, B);
disp(X)
