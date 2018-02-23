package G8.ex3;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;

public class QQSM {
	
	private ArrayList<QandA> perguntas;
	private Desenha tabuleiro ;
	//private int[] ganho = {25, 50, 125, 250, 500, 750, 1500, 2500, 5000, 10000, 16000, 3200, 64000, 125000, 250000};

	public QQSM(String name) throws FileNotFoundException {
		Info info = new Info(new File(name));
		perguntas = info.getPerguntas();
		
		for (int i=0; i<perguntas.size() ; i++) {
			//tabuleiro = new Desenha( perguntas.get(i), ganho[i]);
		}
		
	}
	
	

	public Desenha getTabuleiro() {
		return tabuleiro;
	}
	
	
	
	

}
