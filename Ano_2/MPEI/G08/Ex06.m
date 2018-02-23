#
# Alínea a)
#

H = [ 0.8, 0.0, 0.3, 0.0;
      0.2, 0.9, 0.2, 0.0;
      0.0, 0.1, 0.4, 0.0;
      0.0, 0.0, 0.1, 1.0];

      
#
# Alínea b)
#

prob = (H^1000)(1,2);


#
# Alínea c)
#

passos1 = (H^1);
passos2 = (H^2);
passos10 = (H^10);
passos1000 = (H^1000);


#
# Alínea d)
#

numEstadosAbsorventes = 1;
Q = H(1:size(H,1)-numEstadosAbsorventes,1:size(H,1)-numEstadosAbsorventes);


#
# Alínea e)
#

F = inv(eye(size(H,1)-numEstadosAbsorventes)-Q);


#
# Alínea f) e g)
#

sum(F)


#
# Alínea h)
#

H = [ 0.8, 0.0, 0.39, 0.0;
      0.2, 0.9, 0.2, 0.0;
      0.0, 0.1, 0.4, 0.0;
      0.0, 0.0, 0.01, 1.0];
      
Q = H(1:size(H,1)-numEstadosAbsorventes,1:size(H,1)-numEstadosAbsorventes);

F = inv(eye(size(H,1)-numEstadosAbsorventes)-Q);

sum(F)


#
# Alínea i)
#

H = [ 0.8, 0.0, 0.3, 0.0;
      0.2, 0.9, 0.2, 0.0;
      0.0, 0.1, 0.4, 0.0;
      0.0, 0.0, 0.1, 1.0];
      
Q = H(1:size(H,1)-numEstadosAbsorventes,1:size(H,1)-numEstadosAbsorventes);

F = inv(eye(size(H,1)-numEstadosAbsorventes)-Q);