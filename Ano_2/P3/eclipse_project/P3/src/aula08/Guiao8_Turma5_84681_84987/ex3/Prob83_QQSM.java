package G8.ex3;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;

import javax.swing.JFrame;

public class Prob83_QQSM {
	public static void main(String[] args) throws FileNotFoundException, InterruptedException {
		JFrame qqsm = new JFrame("Quem Quer Ser Milionario");
		qqsm.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		qqsm.setSize(500, 500);
		
		int[] ganho = {25, 50, 125, 250, 500, 750, 1500, 2500, 5000, 10000, 16000, 3200, 64000, 125000, 250000};
		
		Info info = new Info(new File("questions.txt"));
		ArrayList<QandA> perguntas = info.getPerguntas();
		
		for (int i=0; i<perguntas.size() ; i++) {
			qqsm.setContentPane(new Desenha( perguntas.get(i), ganho[i]));
			qqsm.setVisible(true);
			//qqsm.wait();
		}
	
		//QQSM tabuleiro = new QQSM("questions.txt");
		
		//qqsm.setContentPane(tabuleiro.getTabuleiro());
		//qqsm.setVisible(true);
	}
}
