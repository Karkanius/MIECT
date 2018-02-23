package G8.ex3;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

import javax.swing.ImageIcon;

public class Info {
	private ArrayList<QandA> perguntas;

	public Info(File questions) throws FileNotFoundException {
		perguntas = readQuestions(questions);
	}

	public ArrayList<QandA> getPerguntas() {
		return perguntas;
	}
	
	
	private ArrayList<QandA> readQuestions(File questions) throws FileNotFoundException{
		ArrayList<QandA> perg = new ArrayList<>(15);
		Scanner in = new Scanner(questions);
		while(in.hasNextLine()) {
			String[] line = in.nextLine().split("&&");
			
			String nameImage = line[0].substring(5, line[0].length());
			ImageIcon image = new ImageIcon(nameImage);
			String pergunta = line[1];
			String [] resp = {line[2], line[3], line[4], line[5]};
			int resposta = Integer.parseInt(line[6]);
			QandA qa = new QandA(image, pergunta, resp, resposta);
			
			perg.add(qa);
		}
		in.close();
		
		return perg;

		
	}
	
	
}
