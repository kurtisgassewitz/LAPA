close all

NX = 20;
NY = 20;

V = zeros (NX, NY);

%Boundary Conditions
V1 = 1;%right
V2 = 1;%left
V3 = 0;%top
V4 = 0;%bottom

iterations = 100;
%Iteration approach
           V(:, NX) = V1;
           V(:, 1) = V2;
           V(1, :) = V3;
           V(NY,:) = V4;
for i = 0:1:iterations
   for j=2:(NX-1)
       for k=2:(NY-1)
           V(j,k) = 0.25*(V(j+1,k) + V(j-1, k) + V(j, k+1) + V(j, k-1));
           

       end
   end
% x = 1:NX;
% y = 1:NY;
figure(1)
% [X,Y] = meshgrid(x,y);
surf(V)
% hold on;
pause(0.01)

end

figure(2)
%[A,B] = meshgrid(90.1:0.1:100);
[DX, DY] = gradient(V);
quiver(X,Y,DX,DY);
pause(0.05);

figure(3)
Vim = imboxfilt(V,3);
Vim(:, NX) = V1;
Vim(:, 1) = V2;
Vim(1, :) = V3;
Vim(NY,:) = V4;
surf(X,Y,Vim);