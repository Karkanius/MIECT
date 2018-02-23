package aula10.prob01;

import java.util.ArrayList;
import java.util.Iterator;


public class VectorGeneric<T> {

	ArrayList<T> arrList = new ArrayList<T>();
	
	public boolean addElem(T t){
		this.arrList.add(t);
		return true;
	}
	
	public boolean removeElem(T t){
		if (this.arrList.contains(t)) { this.arrList.remove(t); }
		return true;
	}
	
	public int totalElem(){
		return this.arrList.size();
	}
	
	public Iterator<T> iterator(){
		return new VectorIterator();
	}
	
	public BFIterator iteratorbf(){
		return new VectorElemBFIterator();
	}
	
	private class VectorIterator implements Iterator<T> {
		int i=0;
		public boolean hasNext() {
			return i<arrList.size();
		}

		public T next() {
			return (T)arrList.get(i++);
		}
		
	}
	
	private class VectorElemBFIterator implements BFIterator{
		int i=0;
		public boolean hasPrevious() {
			return i>0;
		}

		public Object previous() {
			return arrList.get(--i);
		}

		public boolean hasNext() {
			return i<arrList.size();
		}

		public Object next() {
			return arrList.get(i++);
		}
		
	}
}
