package aula09.prob03;

import java.util.Iterator;
import java.util.LinkedList;

public class ListaPessoas {

	LinkedList<Pessoa> p = new LinkedList<Pessoa>();
	
	public boolean addPessoa(Pessoa p){
		if(this.p.add(p)) return true;
		else return false;
	}
	
	public boolean removePessoa(Pessoa p){
		if(this.p.remove(p)) return true;
		else return false;
	}
	
	public int totalPessoas(){
		return p.size();
	}
	
	public Iterator<Pessoa> iterator(){
		return new VectorIterator();
	}
	
	public BFIterator iteratorbf(){
		return new VectorBFIterator();
	}
	
	private class VectorIterator implements Iterator<Pessoa>{
		int i=0;
		@Override
		public boolean hasNext() {
			return i<p.size();
		}

		@Override
		public Pessoa next() {
			return p.get(i++);
		}
		
	}
	
	private class VectorBFIterator implements BFIterator{
		int i=0;
		@Override
		public boolean hasPrevious() {
			return i>0;
		}

		@Override
		public Pessoa previous() {
			return p.get(i--);
		}

		@Override
		public boolean hasNext() {
			return i<p.size();
		}

		@Override
		public Pessoa next() {
			return p.get(i++);
		}
		
	}
	
}