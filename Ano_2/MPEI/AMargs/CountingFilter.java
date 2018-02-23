package MPEI;
import java.util.ArrayList;
import java.util.List;
public class CountingFilter {
	private int[] filter;
    private int numberOfAddedElements = 0; // number of elements added to the Counting filter
    private int k; // Number of Hash Functions
    private double p = 0.05; // Number of acceptable false positive rate
    private int m; // Number of bits in the bloom filter
    private int n;
    /**
     * Initializes the attributes
     * @param n
     */

    public CountingFilter(int n) {
		this.n = n;
    	m = (int)Math.round((-n*Math.log(p)/(Math.log(2)*Math.log(2))));
		filter = new int[m];
		k = (int)Math.round((m/n)*Math.log(2));
	}

	
	/**
	 * 
	 * @param value(a String)
	 * @param k(number of HashFunctions)
	 */
	
	public void Insert(String value){
		//adicionar Strings só com caracteres minusculos --> facilita
		value = value.toLowerCase();

		for(int i=0; i<k; i++){
			value = value + Math.pow(i,i+1);
			filter[Math.abs(value.hashCode()%m)]+=1; //� adicionado mais 1 à posi��oo gerada atraves do resto da hashCode(HashCode da classe String) da string e o valor maximo do filtro 
		}
		numberOfAddedElements++;
	}
	
	
	/**
	 * 
	 * @param value
	 * @returns a boolean that tells us whether the value is contained in the array or not
	 */
	public boolean isMember(String value){
		assert filter[Math.abs(value.hashCode()%m)]>=0;
		value = value.toLowerCase();
		int s=0;
		
		for(int i=0; i<k; i++){
			value = value + Math.pow(i,i+1);; 
			if((filter[Math.abs(value.hashCode()%m)])!=0)
				s++;
		}
		assert filter[Math.abs(value.hashCode()%m)]>=0;
		if(s==k)
			return true;
		return false;
	}
	
	
	public void remove(String value){
		value = value.toLowerCase();
				
		for(int i=0; i<k; i++){
			value = value + Math.pow(i,i+1);
			if(filter[Math.abs(value.hashCode()%m)]>0)
				filter[Math.abs(value.hashCode()%m)]-=1; //� subtraido 1 � posi��oo gerada atraves do resto da hashCode(HashCode da classe String) da string e o valor maximo do filtro 
		}
		numberOfAddedElements--;
	}
	
	 public int count(String value) {
		 value = value.toLowerCase();
		 if (!isMember(value))
			 return 0;
		 int tmp = Math.abs(value.hashCode()%m);
		 for (int i=0; i<k; i++) {
			 value = value + Math.pow(i,i+1);
			 if (filter[Math.abs(value.hashCode()%m)] < tmp)
				 tmp = filter[Math.abs(value.hashCode()%m)];
		 }
		 return tmp;

	 }
	
	public int size() {
		return numberOfAddedElements;
	}
	
	/**
	 * returns a string with the content of the Bloom Filter
	 */
	@Override
	public String toString() {
		return "CountingFilter caracteristicas \n filter size  =  " + m
				+ ",\n numberOfAddedElements  =  " + numberOfAddedElements + ",\n k  =  " + k;
	
	/**
	 * returns the set
	 */
	}
	public void getArray(){
		for(int i=0; i< m; i++){
			System.out.print(" "+filter[i]);
		}
	}
	
	public double ProbFalsePositive(){		
		return Math.pow((1-Math.exp((double)-k*n/m)), k);
	}


	public int getNumberOfAddedElements() {
		return numberOfAddedElements;
	}


	public int getN() {
		return n;
	}
	
	
}