function boolean = PertenceMembro(array,hashes,obj); 
  
  boolean = 1;
  for i=1:length(hashes)
    if array(hashes(i)) != 1
      boolean = 0;
    endif
  endfor
endfunction