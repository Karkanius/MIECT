package G8.ex3;

import javax.swing.ImageIcon;

public class QandA { //questions and answers
	private ImageIcon image;
	private String pergunta;
	private String [] resp;
	private int solu�ao;
	
	public QandA(ImageIcon image, String pergunta, String [] resp, int solu�ao) {
		this.image = image;
		this.pergunta = pergunta;
		this.resp = resp;
		this.solu�ao = solu�ao;
	}

	public String getPergunta() {
		return pergunta;
	}

	public String [] getResp() {
		return resp;
	}

	public int getSolu�ao() {
		return solu�ao;
	}

	public ImageIcon getImage() {
		return image;
	}
	
	
	
	
	

}
