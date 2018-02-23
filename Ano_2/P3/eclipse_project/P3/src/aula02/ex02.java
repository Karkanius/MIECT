package aula02;
import java.util.*;
import java.io.*;

public class ex02 {

	static Scanner sc = new Scanner (System.in);
	
	static char [][] soup;
	
	public static void main(String[] args) throws IOException {
		
		
		//File Definition and Reading
		String fileName="";
		if (args.length==0) {
			System.out.println("Insert file name and extension.");
			System.out.print((char)9205+" ");
			fileName = sc.nextLine();
		}
		else if (args.length==1) {
			fileName = args[0];
		}
		else {
			System.out.println("Program expects only one or no arguments.");
			System.out.println("TERMINATING");
			System.exit(1);
		}
		File file = new File(fileName);
		Scanner fileScanner = new Scanner (file);
		

		//Bi-Dimensional Matrix and KeyWords Queue definition
		
		int numLines = 100;
		String [] line = new String [numLines];
		
		
		Queue<String> keyWords = new LinkedList<String> ();
		
		for (int i = 0; fileScanner.hasNextLine(); i++) {
			line[i] = fileScanner.nextLine();
			numLines = i+1;
		}
		fileScanner.close();
		
		soup = new char [line[0].length()][line[0].length()];
		
		for (int i = 0; i<numLines; i++) {
			if (i<line[0].length()) {
				for (int j = 0; j < line[0].length(); j++) {
					soup[i][j]=line[i].charAt(j);
				}
			}
			else {
				String [] words = line[i].split("[ \t\n,.;:{}()!?]+");
				for (int j=0; j<words.length; j++) {
					keyWords.add(words[j].toUpperCase());
				}
			}
		}
		
		
		while (keyWords.peek()!=null) {
			String key = keyWords.poll();
			int wordSize = key.length();
			char firstLetter = key.charAt(0);
			
			for (int i = 0; i<line[0].length(); i++) {
				for (int j = 0; j<line[0].length(); j++) {
					if (soup[i][j]==firstLetter) {
						
						//UP
						if (i-wordSize>=0) {
							boolean completeWord = true;
							for (int g=0; g<wordSize; g++) {
								if (soup[i-g][j]!=key.charAt(g)) {completeWord = false; }
							}
							if (completeWord) { System.out.println(key+"\t"+i+","+j+"\tup"); }
						}
						
						//UPRIGHT
						if ((i-wordSize>=0)&&(j+wordSize<=line[0].length())) {
							boolean completeWord = true;
							for (int g=0, h=0; g<wordSize; g++, h++) {
								if (soup[i-g][j+h]!=key.charAt(g)) {completeWord = false; }
							}
							if (completeWord) { System.out.println(key+"\t"+i+","+j+"\tupright"); }
						}
						
						//RIGHT
						if (j+wordSize<=line[0].length()) {
							boolean completeWord = true;
							for (int g=0; g<wordSize; g++) {
								if (soup[i][j+g]!=key.charAt(g)) {completeWord = false; }
							}
							if (completeWord) { System.out.println(key+"\t"+i+","+j+"\tright"); }
						}
						
						//DOWNRIGHT
						if ((i+wordSize<=line[0].length())&&(j+wordSize<=line[0].length())) {
							boolean completeWord = true;
							for (int g=0, h=0; g<wordSize; g++, h++) {
								if (soup[i+g][j+h]!=key.charAt(g)) {completeWord = false; }
							}
							if (completeWord) { System.out.println(key+"\t"+i+","+j+"\tdownright"); }
						}
						
						//DOWN
						if (i+wordSize<=line[0].length()) {
							boolean completeWord = true;
							for (int g=0; g<wordSize; g++) {
								if (soup[i+g][j]!=key.charAt(g)) {completeWord = false; }
							}
							if (completeWord) { System.out.println(key+"\t"+i+","+j+"\tdown"); }
						}
						
						//DOWNLEFT
						if ((i+wordSize<=line[0].length())&&(j-wordSize>=0)) {
							boolean completeWord = true;
							for (int g=0, h=0; g<wordSize; g++, h++) {
								if (soup[i+g][j-h]!=key.charAt(g)) {completeWord = false; }
							}
							if (completeWord) { System.out.println(key+"\t"+i+","+j+"\tdownleft"); }
						}
						
						//LEFT
						if (j-wordSize>=0) {
							boolean completeWord = true;
							for (int g=0; g<wordSize; g++) {
								if (soup[i][j-g]!=key.charAt(g)) {completeWord = false; }
							}
							if (completeWord) { System.out.println(key+"\t"+i+","+j+"\tleft"); }
						}
						
						//UPLEFT
						if ((i-wordSize>=0)&&(j-wordSize>=0)) {
							boolean completeWord = true;
							for (int g=0, h=0; g<wordSize; g++, h++) {
								if (soup[i-g][j-h]!=key.charAt(g)) {completeWord = false; }
							}
							if (completeWord) { System.out.println(key+"\t"+i+","+j+"\tupleft"); }
						}
						
					}
				}
			}
		}
	}

}
