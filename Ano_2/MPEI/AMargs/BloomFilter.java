package MPEI;
import java.util.*;
import java.io.*;
import biblioteca.*;

public class BloomFilter {
	private int[] filter;
	private int numberOfAddedElements = 0; // number of elements added to the Bloom filter
    private int k; // Number of Hash Functions
    private double p = 0.01; // Number of acceptable false positive rate
    private int m; // Number of bits in the bloom filter
    private int n;
	
    /**
     * Initializes the attributes
     * @param n
     * @param k
     */
    
    public BloomFilter(int n) {
    	this.n = n;
		m = (int)Math.round(((-n*Math.log(p))/Math.pow((Math.log(2)),2)));
		filter = new int[m];
		k = (int)((m/n)*Math.log(2));
		
	}
    
    /**
	 * 
	 * @param value(a String)
	 * @param k(number of HashFunctions)
	 */
	
	public void Insert(String value) {
		value = value.toLowerCase();
		for(int i=0; i<k; i++){ 
			value = value + Math.pow(i,i+1);;
			filter[Math.abs(value.hashCode()%m)]=1; //É adicionado 1 à  posição gerada atraves do resto da hashCode(HashCode da classe String) da string e o valor maximo do filtro 
		}
		numberOfAddedElements++;
	}
	
	
	/**
	 * 
	 * @param value
	 * @returns a boolean that tells us whether the value is contained in the filter or not
	 */
	public boolean isMember(String value){
		value = value.toLowerCase();
		int s=0;
	
		for(int i=0; i<k; i++){
			value = value + Math.pow(i,i+1);  
			if(filter[Math.abs(value.hashCode()%m)]==1)
				s++;
		}
		if(s==k)
			return true;
		return false;
	}
	
	public void WriteBloomFilter(ArrayList<Livro> value) throws IOException{
		File p = new File("Caracteristicas_Do_BloomFilter.txt");
		PrintWriter w = new PrintWriter(p);
		w.println(toString());
		w.printf(" Probabilida de Falsos Postivos: %.7f \n",ProbFalsePositive());
		w.println("\n Lista de Livros Adicionados:");
		for(Livro linha: value) {
			w.println(" "+linha.toString());
		}
		w.close();
				
	}
	
	public int size() {
		return numberOfAddedElements;
	}
	
	/**
	 * returns a string with the content of the Bloom Filter
	 */
	@Override
	public String toString() {
		return "BloomFilter caracteristicas \n filter size  =  " + m
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
	
	
	/**
	* Compares two instances to see if they are equal.
	* @param obj is the object to compare to.
	* @return True if the objects are equal.
	*/
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BloomFilter other = (BloomFilter) obj;
		if (!Arrays.equals(filter, other.filter))
			return false;
		if (k != other.k)
			return false;
		if (m != other.m)
			return false;
		if (numberOfAddedElements != other.numberOfAddedElements)
			return false;
		if (Double.doubleToLongBits(p) != Double.doubleToLongBits(other.p))
			return false;
		return true;

	}	


	//Return the probability of a false positive given m elements, n      
	//positions in the filter and k hash functions      
	//From https://en.wikipedia.org/wiki/Bloom_filter#Probability_of_false_positives
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
