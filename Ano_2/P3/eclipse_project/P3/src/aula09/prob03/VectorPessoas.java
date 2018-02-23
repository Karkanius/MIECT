package aula09.prob03;

import java.util.ArrayList;
import java.util.Iterator;

public class VectorPessoas {

	ArrayList<Pessoa> p = new ArrayList<>();
	
	public boolean addPessoa(Pessoa p){
		if(this.p.add(p)) { return true; }
		return false;
	
	}
	
	public boolean removePessoa(Pessoa p){
		if(this.p.remove(p)) { return true; }
		return false;
	}
	
	public int totalPessoa(){
		return p.size();
	}
	
	public Iterator<Pessoa> iterator(){
		return new VectorIterator();
	}
	
	public BFIterator iteratorbf(){
		return new VecPessoaBFIterator();
	}
	
	private class VectorIterator implements Iterator<Pessoa>{
		int i=0;
		public boolean hasNext() {
			return i<p.size();
		}

		public Pessoa next() {
			return p.get(i++);
		}
		
	}
	
	private class VecPessoaBFIterator implements BFIterator{
		int i=0;
		public boolean hasPrevious() {
			return i>0;
		}

		public Object previous() {
			return p.get(--i);
		}

		public boolean hasNext() {
			return i<p.size();
		}

		public Object next() {
			return p.get(i++);
		}
		
	}
	
}
