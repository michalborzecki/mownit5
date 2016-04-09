function [] = zad1 (n)
  s = 0:pi/ceil(n/2):2*pi;
  t = 0:pi/n:pi;
  S = zeros(n.^2, 3);
  for i = 0:n - 1
    for j = 1:n
      S(i*n + j,1) = cos(s(i+1))*sin(t(j));
      S(i*n + j,2) = sin(s(i+1))*sin(t(j));
      S(i*n + j,3) = cos(t(j));
    end
  end
  
  A1 = [5 3 4; 0 1 0; 0 0 5];
  S1 = S*A1;
  [U1, E1, V1] = svd(A1);
  [x1, y1, z1] = get_3d_vectors(E1, V1);
  
  A2 = [45 45 45; 0 1 0; 0 0 3];
  S2 = S*A2;
  [U2, E2, V2] = svd(A2);
  [x2, y2, z2] = get_3d_vectors(E2, V2);
  
  A3 = [-1 0 0; 0 1 0; 0 0 3];
  S3 = S*A3;
  [U3, E3, V3] = svd(A3);
  [x3, y3, z3] = get_3d_vectors(E3, V3);
  
  sv1 = S*V1;
  sev1 = S*E1*V1;
  suev1 = S*U1*E1*V1;
  
  plot3(S1(:,1),S1(:,2),S1(:,3), x1, y1, z1);
  %plot3(S2(:,1),S2(:,2),S2(:,3), x2, y2, z2);
  %plot3(S3(:,1),S3(:,2),S3(:,3), x3, y3, z3);
  %plot3(sv1(:,1),sv1(:,2),sv1(:,3));
  %plot3(sev1(:,1),sev1(:,2),sev1(:,3));
  %plot3(suev1(:,1),suev1(:,2),suev1(:,3));
endfunction

function [x, y, z] = get_3d_vectors(E, V)
  x = [0 V(1,1)*E(1,1) 0 V(1,2)*E(2,2) 0 V(1,3)*E(3,3)];
  y = [0 V(2,1)*E(1,1) 0 V(2,2)*E(2,2) 0 V(2,3)*E(3,3)];
  z = [0 V(3,1)*E(1,1) 0 V(3,2)*E(2,2) 0 V(3,3)*E(3,3)];
endfunction