package MPEI;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
public class minHashing {
	
	private static int n=1;//Nr de Utilizadores
	private int nrHashFunctions;
	List<String> lista;
	public minHashing(List<String> lista, int nrHashFunctions){
		this.nrHashFunctions = nrHashFunctions;
		this.lista = lista;
	}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	/*			|Lista1 |Lista2 |Lista3 etc
	 * minhash1	| 3230  | 5002  | 2543
	 * minhash2	| 1014  | 1712  | 6023
	 * minhash3 | 5000  | 1010  | 1017
	 * 	  etc
	 */
	private int[] init(List<String> lista, int nrHashFunctions){
		int[] minhash = new int[nrHashFunctions];	
		String val;
		int hash;
		int temp;
		for(int j = 0; j < nrHashFunctions; j++){
			
			temp=999999999;
			
			for(int i=0 ; i < lista.size() ; i++){ 
				
				val = Math.sqrt(j)+lista.get(i) + Math.sqrt(j);		 
				
				hash = Math.abs(val.hashCode()/lista.size());
				
				if(hash<temp)
					temp=hash;
			}
			
			minhash[j]=temp;
			
		}
		
		n++;
		return minhash;
	}
	public int[] init(){
		return init(lista,nrHashFunctions);
	}
		
		
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
	public static double jaccardIndex(Set<Integer> set1, Set<Integer> set2) {
    	Set<Integer> intersection = new HashSet<Integer>(set1);
    	 intersection.retainAll(set2);
    	/**
         * retainAll -> Removes from this set all of its elements that are not contained in the specified collection. 
         * If the specified collection is also a set, this operation effectively modifies this set so 
         * that its value is the intersection of the two sets.
         */
        
    	Set<Integer> union = new HashSet<Integer>(set1);
        union.addAll(set2);
        /** 
         * addAll -> If the specified collection is also a set, 
         * the addAll operation effectively modifies 
         * this set so that its value is the union of the two sets.
        **/
        if (union.isEmpty()) {return 0;}
        
        return (double) intersection.size() / union.size();
    }
	static public double similarity(int[] I,int[] J){ //argumentos, 2 assinaturas
		int size=1;
		int w=0;
		int[] array;
		if(I.length == J.length){
			size = I.length;
			for(int i=0; i< size; i++){
				if(I[i] == J[i]){
					w+=1;
				}
				
			}
		}
		
		
		else if(I.length> J.length){
			size = I.length;
			array = new int[I.length];
			for(int j = 0; j<I.length; j++){
				if(j<J.length)
					array[j] = J[j];
				else
					array[j] = 0;
			}
			for(int i=0; i< size; i++){
				if(I[i] == array[i])
					w+=1;
			}
		}
		else{
			size = J.length;
			array = new int[J.length];
			for(int j = 0; j<J.length; j++){
				if(j<I.length)
					array[j] = J[j];
				else
					array[j] = 0;
			}
			for(int i=0; i<size; i++){
				if(J[i] == array[i])
					w+=1;
			}
		}

		return (double)w/size;
	}
}
