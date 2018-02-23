package aula11.prob01;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import aula04.prob02.*;
import aula09.prob03.Pessoa;
import aula09.prob03.Date;

public abstract class TestCollections {
	
	public static void main(String[] args) throws IOException {
		
		List<Pessoa> vp = new ArrayList<Pessoa>();
		for (int i=0; i<10; i++) vp.add(new Pessoa("Bebé no Vector "+i, 1000+i, Date.today()));
		
		Iterator<Pessoa> vec = vp.iterator();
		printSet(vp.iterator());
		
		List<Pessoa> lp = new LinkedList<Pessoa>();
		while ( vec.hasNext() ) lp.add( vec.next() );
		
		Iterator<Pessoa> lista = lp.iterator();
		while ( lista.hasNext() ) System.out.println( lista.next() );
		
		List<Figura> figList = new LinkedList<Figura>();
		figList.add(new Circulo (1,3, 1));
		figList.add(new Quadrado(3,4, 2));
		figList.add(new Retangulo(1,2, 2,5));
		
		printSet(figList.iterator());
		
		System.out.println("Soma da Area de Lista de Figuras: " + sumArea(figList));
		
		List<Retangulo> quadList = new LinkedList<Retangulo>();
		quadList.add(new Quadrado(3,4, 2));
		quadList.add(new Retangulo(1,2, 2,5));
		System.out.println("Soma da Area de Lista de Quadrados: " + sumArea(quadList));
		System.out.println();
		
		Set<String> differentWords = new HashSet<String>();
		
		String filename = "text_file.txt";
		
		List<String> lines = Files.readAllLines(Paths.get(filename));
		int totalWords = 0;
		for(int i=0; i<lines.size(); i++) { for(String word : lines.get(i).split(" ")) { differentWords.add(word); totalWords++; } }
		System.out.println("Número Total de Palavras: "+totalWords);
		System.out.println("Número de Diferentes Palavras: "+differentWords.size());
		WordCounter01 wc = new WordCounter01(filename);
		wc.printInfoToFile("output.txt");	
	}
	
	static double sumArea(List<? extends Figura> list) {
		
		double total = 0;
		Iterator<? extends Figura> it = list.iterator();
		while(it.hasNext())
			total += ((Figura)it.next()).getArea();
		return total;
	}
	
	static void printSet(Iterator iterator) { while(iterator.hasNext()) { System.out.println(iterator.next()); } }
}