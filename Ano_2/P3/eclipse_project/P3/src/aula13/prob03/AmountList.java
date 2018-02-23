package aula13.prob03;

import java.util.LinkedList;
import java.util.ListIterator;

public class AmountList<T> {

	//Attributes
	private LinkedList<Pair<T, Integer>> list = new LinkedList<Pair<T, Integer>>();

	
	//Constructors
	//*default*
	
	
	//Methods
	public boolean contains(T elem) {
		ListIterator<Pair<T, Integer>> it = list.listIterator();
		while(it.hasNext()) {
			T aux = it.next().getFirst();
			if (aux.equals(elem)) { return true; }
		}
		return false;
	}
	
	public boolean increment(T elem) throws Exception {
		if (!this.contains(elem)) { throw new Exception("List does not contain element."); }
		ListIterator<Pair<T, Integer>> it = list.listIterator();
		for(int i=0; i<list.size(); i++) {
			Pair<T, Integer> aux = it.next();
			if (aux.getFirst().equals(elem)) {
				aux.setSecond(aux.getSecond()+1);
				list.set(i, aux);
				return true;
			}
		}
		return false;
	}
	
	public LinkedList<Pair<T, Integer>> getList() { return this.list; }
	
}
