
/*
Leer de aqui https://eva.fing.edu.uy/mod/forum/discuss.php?d=56389
*/

//Notar que la original tiene color
imshow('fing.bmp');

//Al guardarlo en una matriz se ve en B&W
A = imread('fing.bmp');
imshow(A);

//Al pasarlo a double es peor, se rompe toda la resolucion
A = double(A);
imshow(A);