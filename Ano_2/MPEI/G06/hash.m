function [ y ] = hash( s, len, seed )
    y = seed;
    for i = 1:length(s)
       y = 31*y + s(i);
    end
    
    y = mod(y, 2^31-1);
    y = rem(y, len);
    
    if (y == 0) 
        y = len;
    end
end

