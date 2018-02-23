package aula10.prob01;

import java.util.Iterator;
import java.util.LinkedList;

public class ListGeneric<T> {

	LinkedList<T> linkList = new LinkedList<T>();
	
	public boolean addElem(T t){
		this.linkList.add(t);
		return true;
	}
	
	public boolean removeElem(T t){
		if (this.linkList.contains(t)) { this.linkList.remove(t); }
		return true;
	}
	
	public int totalElem(){
		return linkList.size();
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
			return i<linkList.size();
		}

		public T next() {
			return (T)linkList.get(i++);
		}
		
	}
	
	private class VectorElemBFIterator implements BFIterator{
		int i=0;
		public boolean hasPrevious() {
			return i>0;
		}

		public Object previous() {
			return linkList.get(--i);
		}

		public boolean hasNext() {
			return i<linkList.size();
		}

		public Object next() {
			return linkList.get(i++);
		}
		
	}
}