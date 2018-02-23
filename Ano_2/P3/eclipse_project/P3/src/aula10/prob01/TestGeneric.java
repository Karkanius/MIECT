package aula10.prob01;

import java.util.Iterator;
import aula04.prob02.*;
import aula09.prob03.Pessoa;
import aula09.prob03.Date;

public abstract class TestGeneric {
	
	public static void main(String[] args) {
		
		VectorGeneric<Pessoa> vp = new VectorGeneric<Pessoa>();
		for (int i=0; i<10; i++)
			vp.addElem(new Pessoa("Bebé no Vector "+i,1000+i, Date.today()));
		Iterator<Pessoa> vec = vp.iterator();
		printSet(vp.iterator());
		ListGeneric<Pessoa> lp = new ListGeneric<Pessoa>();
		while ( vec.hasNext() )
		lp.addElem( vec.next() );
		Iterator<Pessoa> lista = lp.iterator();
		while ( lista.hasNext() )
			System.out.println( lista.next() );
		
		ListGeneric<Figura> figList = new ListGeneric<Figura>();
		figList.addElem(new Circulo (1,3, 1));
		figList.addElem(new Quadrado(3,4, 2));
		figList.addElem(new Retangulo(1,2, 2,5));
		printSet(figList.iterator());
		System.out.println("Soma da Area de Lista de Figuras: " + sumArea(figList));
		
		// Partindo do principio que Quadrado extends Rectangulo:
		ListGeneric<Retangulo> quadList = new ListGeneric<Retangulo>();
		quadList.addElem(new Quadrado(3,4, 2));
		quadList.addElem(new Retangulo(1,2, 2,5));
		System.out.println("Soma da Area de Lista de Quadrados: " +
		sumArea(quadList));
	}
	
	private static double sumArea(ListGeneric<? extends Figura> f){
		double area=0;
		Iterator<? extends Figura> i = f.iterator();
		
		while(i.hasNext()){
			area+=(i.next()).getArea();
		}
		
		return area;
	}
	
	private static <T> void printSet(Iterator<T> i){
		while (i.hasNext()){
			System.out.println(i.next());
		}
	}
	
}