package G8.ex1;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JToggleButton;

public class Tabuleiro extends JPanel{
	private static final long serialVersionUID = 1L;
	
	private static int n;
	private static int nJogadas;
	private static boolean jogadorX;
	private static JToggleButton[][] botoes;
	private static String[][] tab;
	
	Tabuleiro(){
		n = 3;
		nJogadas = 0;
		jogadorX = true;
		//method create board
		botoes = new JToggleButton [n][n];
		tab = new String[n][n];
		setLayout(new GridLayout(n,n));
		
		
		int i=0;
		for(i=0; i<n; i++) {
			for(int k = 0; k<n; k++) {
				JToggleButton b = new JToggleButton();
				this.add(b);
				botoes[i][k] = b;
				final int j = i;
				final int l = k;
				botoes[i][k].addActionListener(new ActionListener() {
					public void actionPerformed(ActionEvent e) {
						if  (jogadorX){
							botoes[j][l].setText("X");
							tab[j][l] = "X";
				        }
				        else {
				        	botoes[j][l].setText("O");
				        	tab[j][l] = "O";
				        }
						botoes[j][l].setEnabled(false);
				        botoes[j][l].setFont(new java.awt.Font("Forte", 2, 50));
				        nJogadas++;
				        jogadorX = !jogadorX;
				        
				        boolean a = fimJogo(j, l, "X") ;
				        boolean b = fimJogo(j, l, "O");
				        if(a||b) {
				        	if(a) JOptionPane.showMessageDialog(getParent(), "Resultado: o jogador X é o vencedor");
				        	else JOptionPane.showMessageDialog(getParent(), "Resultado: o jogador O é o vencedor");
				           	System.exit(0);
				        }
				        else if(nJogadas == 9) {
				        	JOptionPane.showMessageDialog(getParent(), "Resultado: empate");
				           	System.exit(0);
				        }			        
				        
					}
				});
			}
		}	
	}
	
	public static boolean fimJogo(int j, int l, String s) {
		if(nJogadas == 9) return false; //empate
		else {
			if(lines(j, s)) {
				return true;
			}
			else if(columns(l, s)) {
				return true;
			}
			else if(diagonalLeft(s)) {
				return true;
			}
			else if(diagonalRight(s)) {
				return true;
			}
		}
		return false;
	}
	
	public static boolean lines(int l, String s) {
		int number = 0;
		for(int j=0; j<n; j++) {
			if(tab[l][j]==null) return false;
			else if(tab[l][j].equals(s)) number++;
			else return false;
		}
		return number==3? true : false;
	}
	
	
	public static boolean columns(int c, String s) {
		int number = 0;
		for(int j=0; j<n; j++) {
			if(tab[j][c]==null) return false;
			else if(tab[j][c].equals(s)) number++;
			else return false;
		}
		return number==3? true : false;
	}
	
	public static boolean diagonalLeft(String s) {
		int number = 0;
		for(int i=0; i<n; i++) {
			for(int j=n-1; j>=0; j--) {
				if(tab[i][j]==null) return false;
				else if(tab[i][j].equals(s)) number++;
				else return false;
			}		
		}
		return number==3? true : false;
	}
	
	public static boolean diagonalRight(String s) {
		int number = 0;
		for(int i=0; i<n; i++) {
			for(int j=0; j<n; j++) {
				if(tab[i][j]==null) return false;
				else if(tab[i][j].equals(s)) number++;
				else return false;
			}
		
		}
		return number==3? true : false;
	}
	
	
}	

