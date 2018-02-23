package Project;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

public class MinHashing {
	
	
	//ATTRIBUTES
	
	private static int hashesNumber = 5000;
	private static double simIncert = 0.05;

	
	//METHODS
	
    public static LinkedList<Person> getMostSimilar(Person target, List<Person> list) {
    	LinkedList<Person> similarPeople = new LinkedList<Person>();
    	List<Person> originalList = list;
    	ArrayList<Person> listWTarget = new ArrayList<Person>();
    	listWTarget.add(target);
    	listWTarget.addAll(list);
    	LinkedList<Integer[]> minHashValues = getMinHashValues(listWTarget);
    	LinkedList<Integer> positions = getMostSimilarPositions(minHashValues);
    	for (int i=0; i<positions.size(); i++) { similarPeople.add(originalList.get(positions.get(i))); }
    	return similarPeople;
    }
         
         
    private static LinkedList<Integer> getMostSimilarPositions(LinkedList<Integer[]> minHashValues) {
    	LinkedList<Integer> positions = new LinkedList<Integer>();
    	positions.add(0);
    	double similarity=similarity(minHashValues.get(0), minHashValues.get(1));
    	for (int i=1; i<minHashValues.size()-1; i++) {
    		if ((similarity<similarity(minHashValues.get(0), minHashValues.get(i+1))+simIncert)&&(similarity>similarity(minHashValues.get(0), minHashValues.get(i+1))-simIncert)) {
    			positions.add(i);
    		} else if (similarity<similarity(minHashValues.get(0), minHashValues.get(i+1))) {
    			similarity=similarity(minHashValues.get(0), minHashValues.get(i+1));
    			positions.clear();
    			positions.add(i);
    		}
    	}
		return positions;
	}

	private static LinkedList<Integer[]> getMinHashValues(List<Person> list) {
		int [] seeds = GenerateHashSeeds(hashesNumber);
		LinkedList<Integer[]> minHashValues = new LinkedList<Integer[]>();
    	for (int i=0; i<list.size(); i++) {							//For each person in list (includes target suspect)
			LinkedList<Integer> personalHashes = list.get(i).getHashesWOName();
			ArrayList<Integer> aux = new ArrayList<Integer>();
			Integer [] personHashes = new Integer [hashesNumber];
    		for (int j=0; j<hashesNumber; j++) {					//Repeat procedure for every hash seed
    			int minValue=0;
    			aux.clear();
				for (int k=0; k<personalHashes.size(); k++) {		//Repeat procedure for every coded attribute 
					aux.add(personalHashes.get(k)^seeds[j]);
					minValue = GetMinimum(aux);
				}
				personHashes[j] = minValue;
			}
    		minHashValues.add(personHashes);
		}
		return minHashValues;
	}

    private static int GetMinimum(ArrayList<Integer> list) {
		int min = list.get(0);
		for (int i=1; i<list.size(); i++) { if (list.get(i)<min) min = list.get(i); }
		return min;
	}
    
    
    public static double similarity(Integer[] base,Integer[] object) {
        int size=1;
        int w=0;
        Integer[] array, bigger, smaller;
        if(base.length == object.length) {
            size = base.length;
            for(int i=0; i< size; i++){ if(base[i].equals(object[i])) w++; }
        } else {
        	if(base.length> object.length) {
        		bigger = base;
        		smaller = object;
        	} else {
        		bigger = base;
        		smaller = object;
        	}
        
            size = bigger.length;
            array = new Integer[size];
            for(int i=0; i<size; i++){
                if(i<smaller.length)
                    array[i] = smaller[i];
                else
                    array[i] = null;
            }
            for(int i=0; i<size; i++){ if(bigger[i].equals(array[i])) w++; }
        }
        return (double)w/size;
    }
    
    
    
    
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