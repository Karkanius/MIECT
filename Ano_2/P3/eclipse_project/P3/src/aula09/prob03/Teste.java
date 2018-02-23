package aula09.prob03;

import java.util.Iterator;

import aula10.prob01.BFIterator;

public abstract class Teste {
	
	public static void main(String[] args) {
		
		VectorPessoas peopleArray = new VectorPessoas();
		
		for (int i=0; i<10; i++)
		peopleArray.addPessoa(new Pessoa("Bebé no Vector "+i, 1000+i, Date.today()));
		
		Iterator<Pessoa> it = peopleArray.iterator();
		while ( it.hasNext() )
			System.out.println( it.next() );
		
		
		ListaPessoas peopleList = new ListaPessoas();
		for (int i=0; i<10; i++)
			peopleList.addPessoa(new Pessoa("Bebé na Lista "+i, 2000+i, Date.today()));
		
		Iterator<Pessoa> lista = peopleList.iterator();
		while ( lista.hasNext() )
			System.out.println( lista.next() );
		
		BFIterator lpes=peopleArray.iteratorbf();
		
		for (int i=0;i<5;i++)
			System.out.println(lpes.next());
		
		for (int i=5;i>0;i--){
			System.out.println(lpes.hasPrevious());
			System.out.println(lpes.previous());
		}
		System.out.println(lpes.hasPrevious());
		
		lpes=peopleList.iteratorbf();
		
		for (int i=0;i<5;i++)
			System.out.println(lpes.next());
		
		for (int i=5;i>0;i--){
			System.out.println(lpes.hasPrevious());
			System.out.println(lpes.previous());
		}
		System.out.println(lpes.hasPrevious());
	}
}
