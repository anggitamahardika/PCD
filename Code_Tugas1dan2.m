%membaca gambar
a = imread('C:\Octave\Picture\IMG_2265.JPG');
%subplot(1,2,1); imshow(a);

%TUGAS 1 No.2
%Merubah citra warna menjadi keabuan dengan mengambil nilai rata-rata dari R, G dan B
Red = a(:,:,1); %untuk mengambil komponen Red (R)
Green = a(:,:,2); %untuk mengambil komponen Green (G)
Blue = a(:,:,3); %untuk mengambil komponen Blue (B)
grey = (Red+Green+Blue)/3;
%subplot(1,3,1); hist(grey); imshow(grey); 

%TUGAS 1 No.3
%syntax transformasi logaritmik dan histogram
G1 = 0.09*log(grey+1);
%subplot(2,2,2); imshow(G1); hist(G1);
G2 = 0.2*log(grey+1);
%subplot(2,2,3); imshow(G2); hist(G2);
G3 = 0.25*log(grey+1);
%subplot(2,2,4); imshow(G3); hist(G3);

%TUGAS 2 No.2
%Menambahi atau mengurangi kecerahan beserta histogram
greyA = grey+80;subplot(1,2,1); hist(greyA); %imshow(greyA);
greyB = grey-80;subplot(1,2,2); hist(greyB); %imshow(greyB);

%TUGAS 2 No.3
%Filtering Sobel pada greyA
greyA=double(greyA);
for i=1:size(greyA,1)-2
    for j=1:size(greyA,2)-2
        %Mencari nilai Gx sebagai arah penelusuran secara horizontal
        Gx=((2*greyA(i+2,j+1)+greyA(i+2,j)+greyA(i+2,j+2))-(2*greyA(i,j+1)+greyA(i,j)+greyA(i,j+2)));
        %Mencari nilai Gy sebagai arah penelusuran secara vertikal
        Gy=((2*greyA(i+1,j+2)+greyA(i,j+2)+greyA(i+2,j+2))-(2*greyA(i+1,j)+greyA(i,j)+greyA(i+2,j)));    
        %Gradien pada citra
        greyA(i,j)=sqrt(Gx.^2+Gy.^2);
    end
end
greyA = uint8(greyA);
%subplot(1,3,2);imshow(greyA);

%Filtering Sobel pada greyB
greyB=double(greyB);
for i=1:size(greyB,1)-2
    for j=1:size(greyB,2)-2
        %Mencari nilai Gx sebagai arah penelusuran secara horizontal
        Gx=((2*greyB(i+2,j+1)+greyB(i+2,j)+greyB(i+2,j+2))-(2*greyB(i,j+1)+greyB(i,j)+greyB(i,j+2)));
        %Mencari nilai Gy sebagai arah penelusuran secara vertikal
        Gy=((2*greyB(i+1,j+2)+greyB(i,j+2)+greyB(i+2,j+2))-(2*greyB(i+1,j)+greyB(i,j)+greyB(i+2,j)));    
        %Gradien pada citra
        greyB(i,j)=sqrt(Gx.^2+Gy.^2);
    end
end
greyB = uint8(greyB);
%subplot(1,3,3);imshow(greyB);