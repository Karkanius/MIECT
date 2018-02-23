#
# Alínea a)
#

MatrizT = [ 0.7, 0.2, 0.3;
            0.2, 0.3, 0.3;
            0.1, 0.5, 0.4];

      
#
# Alínea b)
#

prob = (MatrizT^2)(3,1)


#
# Alínea c)
#

Matriz = ones(9, 20);

for i=1:20
  Mn = M ^ i;
  Matriz(:, i) = Mn(:);  
end

subplot(2,1,1);
plot(Matriz');
title("Matriz 1");


#
# Alínea d)
#

Tn = eye(3);
Tn1 = M;
values = [];
x = max(abs(Tn1(:) - Tn(:)));
while(1)
  if(x < 1e-4)
    break;
  end
  
  values = [values Tn1(:)];

  Tn = Tn1;
  Tn1 = Tn1*M;
  x = max(abs(Tn1(:) - Tn(:)));
end

subplot(2,1,2);
plot(values');
title("Matriz 2");
