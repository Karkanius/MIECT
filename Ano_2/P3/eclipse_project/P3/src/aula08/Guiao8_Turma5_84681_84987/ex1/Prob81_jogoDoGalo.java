package G8.ex1;

import javax.swing.JFrame;

public class Prob81_jogoDoGalo{

	public static void main(String[] args) {
		JFrame jogoGalo = new JFrame("JOGO DO GALO");
		jogoGalo.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		jogoGalo.setSize(500, 500);
		
		Tabuleiro tabuleiro = new Tabuleiro();

		
		jogoGalo.setContentPane(tabuleiro);
		jogoGalo.setVisible(true);
		
	}
	
	

}
