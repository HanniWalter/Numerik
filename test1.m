% Matrix erstellen (quadratisch)
A = [1 1 1 1;1 1 3 4;3 4 2 1;3 2 1 2];
B = [2 1 0 0 0;2 0 1 0 0;-7 0 0 1 0;1 0 0 0 1];
X= AxbLoesenMitPLR(A, B);
disp(X)
