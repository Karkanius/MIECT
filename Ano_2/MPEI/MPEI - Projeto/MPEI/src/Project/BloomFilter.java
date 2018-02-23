package Project;

import java.util.Arrays;

public class BloomFilter {
	
	//ATTRIBUTES
	
	private boolean[] array;				//The filter itself
	private int nElem = 0;					//Number of Elements inserted into the Bloom Filter
    private final int k;					//Number of Hash Functions
    private final int [] seeds;				//Hash Seeds
    private double fpRate = 0.001;			//False Positive Rate (defined by the user or default)

    //CONSTRUCTORES
    
    public BloomFilter(int n) {							//Number of elements the user intends to insert in the Bloom Filter
    	array = new boolean[OptimizedBloomFilterSize(n)];
    	k = OptimizedHashFunctionsAmount();
    	seeds = GenerateHashSeeds(k);
	}
    
    public BloomFilter(int n, double rate) {			//Equal to the previous constructor but with a custom False Positive Rate
    	array = new boolean[OptimizedBloomFilterSize(n, rate)];
    	k = OptimizedHashFunctionsAmount(rate);
    	seeds = GenerateHashSeeds(k);
    	fpRate = rate;
	}
	
    
  //METHODS
    
	private int [] PositionsInFilter (String str) {
		int [] positions = new int [k];
		int hashedValue = str.hashCode();
		for(int i=0; i<k; i++) { positions[i] = Math.abs((hashedValue^seeds[i])%array.length); }
		return positions;
	}
    

	public void insert(String obj) {
		int [] positions = PositionsInFilter(obj);
		for(int i=0; i<positions.length; i++){ array[positions[i]]=true; }	//BloomFilter position set to TRUE
		nElem++;															//BloomFilter number of elements incremented
	}
	

	public boolean isMember(String obj){
		int [] positions = PositionsInFilter(obj);
		for(int i=0; i<positions.length; i++){if (array[positions[i]]!=true) return false; }	//It takes only one value off to break procedure and return false
		return true;
	}
	
	
	public int size() { return nElem; }
	
	@Override
	public String toString() { return "[BloomFilter]\n"
			+ "Size  =  " + array.length + ";\n"
			+ "Number of Elements  =  " + nElem + ";\n"
			+ "Number of Hash Functions  =  " + k + ".\n";
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BloomFilter other = (BloomFilter) obj;
		if (!Arrays.equals(array, other.array))
			return false;
		if (k != other.k)
			return false;
		if (nElem != other.nElem)
			return false;
		if (Double.doubleToLongBits(fpRate) != Double.doubleToLongBits(other.fpRate))
			return false;
		return true;

	}	


	public int getNumberOfElements() { return this.nElem; }
	public static int OptimizedHashFunctionsAmount(int bfSize, int elemAmount) { return (int) Math.round((bfSize/elemAmount)*Math.log(2)); }
	public static int OptimizedHashFunctionsAmount(double errorProbability) { return (int) (Math.log(errorProbability)/Math.log(2)); }
	public int OptimizedHashFunctionsAmount() { return (int)Math.round(Math.abs(Math.log(fpRate)/Math.log(2))); }
	
	
	/*
	Variables:
		errorProbability (value between 0 and 1 but, most likely, close to 0)
		BloomFilterSize
		elemAmount (Number of elements to insert in the Bloom Filter)
		hashFunctionsAmount (Number of hash functions to be used to said Bloom Filter)
	
	hashFunctionsAmount = log2(errorProbability) <- OptimizedHashFunctionsAmount(errorProbability)
	BloomFilterSize = elemAmount*hashFunctionsAmount/ln(2)
	*/
	public static int OptimizedBloomFilterSize (int elemAmount, double errorProbability) { return (int) (elemAmount*OptimizedHashFunctionsAmount(errorProbability)/Math.log(2)); }
	public int OptimizedBloomFilterSize (int elemAmount) { return (int)Math.round(elemAmount*OptimizedHashFunctionsAmount()/Math.log(2)); }
	

	
//--------------------------------------------------------------------------
//----------------------G-E-N-E-R-A-T-E---S-E-E-D-S-------------------------
//--------------------------------------------------------------------------

    private static int[] GenerateHashSeeds(int nHashes) {
    	int [] seeds = new int [nHashes];
    	int aux;
    	seeds[0] = 0;
  		for (int i=1; i<nHashes; i++) {
  			do {
  				aux = (int) randBetween(Integer.MIN_VALUE, Integer.MAX_VALUE);
  			} while (Arrays.asList(seeds).contains(aux));
  			seeds[i] = aux;
  		}
  		return seeds;
  	}
	
    private static double randBetween(double min, double max) { return Math.random()*Math.abs(max-min)+min; }
}
