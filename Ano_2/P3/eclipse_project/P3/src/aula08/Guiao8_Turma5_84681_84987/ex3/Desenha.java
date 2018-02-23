package G8.ex3;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JToggleButton;

public class Desenha extends JPanel{
	private static final long serialVersionUID = 1L;
	private JToggleButton[] botoesAjuda;
	private JRadioButton[] botoesResposta;
	private static int ganhoTotal = 0;
	private static boolean respostaCerta = false; //ainda sem resposta
	
	
	Desenha(QandA questions, int ganho) throws InterruptedException {
		ImageIcon image = questions.getImage(); 
		String pergunta = questions.getPergunta();
		String [] resp = questions.getResp(); 
		int soluçao = questions.getSoluçao();
		
		//add image
		JLabel fig = new JLabel();
		fig.setIcon(image);
		this.add(fig);
		
		//ganho
		JLabel g = new JLabel(Integer.toString(ganho));
		this.add(g);
		
		//add question
		JLabel q = new JLabel(pergunta);
		this.add(q);
		
		//options 
		botoesResposta = new JRadioButton[4];
		ButtonGroup bRgroup = new ButtonGroup();
		for(int k = 0; k<4; k++) {
			JRadioButton b = new JRadioButton();
			b.setText(resp[k]);
			this.add(b);
			botoesResposta[k] = b;
			bRgroup.add(b);			
			final int j = k;
			botoesResposta[k].addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					while(!bRgroup.isSelected(botoesResposta[j].getModel())) {
							try {
								this.wait(200);
							} catch (InterruptedException e1) {
								// TODO Auto-generated catch block
								e1.printStackTrace();
							}
						}
				}
			});
			
		}
				
		if(bRgroup.isSelected(botoesResposta[soluçao].getModel()))
			respostaCerta = true;	
		
		//help
		botoesAjuda = new JToggleButton[3];
		String [] help = {"ajuda público", "Telefone", "50-50"}; 
		for(int k = 0; k<3; k++) {
			JToggleButton b = new JToggleButton();
			b.setText(help[k]);
			this.add(b);
			botoesAjuda[k] = b;
			final int j = k;
			botoesAjuda[k].addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					if(j == 0) JOptionPane.showMessageDialog(getParent(),  resp[0] + ": " + (int)(Math.random()*100) + "%" 
																  + "\n" + resp[1] + ": " + (int)(Math.random()*100) + "%"
																  + "\n" + resp[2] + ": " + (int)(Math.random()*100) + "%"
																  + "\n" + resp[3] + ": " + (int)(Math.random()*100) + "%");
					else if(j == 1) JOptionPane.showMessageDialog(getParent(),  resp[0] + ": " + (int)(Math.random()*100) + "%" 
																	   + "\n" + resp[1] + ": " + (int)(Math.random()*100) + "%"
																	   + "\n" + resp[2] + ": " + (int)(Math.random()*100) + "%"
																	   + "\n" + resp[3] + ": " + (int)(Math.random()*100) + "%");
					else if(j == 2) {
						int i=0;
						int p=0;
						while(i<2) {
							if((p != soluçao)) {
								botoesResposta[p].setEnabled(false);
								i++;
							}
							p++;
						}
					}
				}
			});
			
		}
		
		//confirm button
		JToggleButton confirm = new JToggleButton();
		confirm.setText("confirmar");
		this.add(confirm);
		confirm.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(respostaCerta) { 
					ganhoTotal += ganho;
				}
				else {
					JOptionPane.showMessageDialog(getParent(), "ganhou " + ganhoTotal);
					System.exit(0);
				}
				
				
			}
		});
		//giveUp button
		JToggleButton giveUp = new JToggleButton();
		giveUp.setText("desistir");
		this.add(giveUp);
		giveUp.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				JOptionPane.showMessageDialog(getParent(), "ganhou " + ganhoTotal);
				System.exit(0);
			}
		});
		
		
	}

}
