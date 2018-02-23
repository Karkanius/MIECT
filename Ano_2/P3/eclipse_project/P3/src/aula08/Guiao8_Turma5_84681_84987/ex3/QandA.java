package G8.ex3;

import javax.swing.ImageIcon;

public class QandA { //questions and answers
	private ImageIcon image;
	private String pergunta;
	private String [] resp;
	private int soluçao;
	
	public QandA(ImageIcon image, String pergunta, String [] resp, int soluçao) {
		this.image = image;
		this.pergunta = pergunta;
		this.resp = resp;
		this.soluçao = soluçao;
	}

	public String getPergunta() {
		return pergunta;
	}

	public String [] getResp() {
		return resp;
	}

	public int getSoluçao() {
		return soluçao;
	}

	public ImageIcon getImage() {
		return image;
	}
	
	
	
	
	

}
