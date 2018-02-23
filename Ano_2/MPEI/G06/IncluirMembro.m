function array = IncluirMembro(array,hashes,obj); 

  for i=1:length(hashes)    
    hashValue = hash(obj, length(array), hashes(i));
    array(hashValue) = 1;
  end
end