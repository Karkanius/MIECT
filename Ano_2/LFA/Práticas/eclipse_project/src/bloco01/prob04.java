/*
 * Paulo Vasconcelos
 * paulobvasconcelos@gmail.com
 * 2018 february
 * 
 */

package bloco01;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Scanner;
import java.util.regex.Pattern;

import KarkaniusUtils.READ;

public class prob04 {

	public static void main(String[] args) {
		
		HashMap<String, Integer> normal = new HashMap<>();
		HashMap<String, Integer> base10 = new HashMap<>();
		
		//File Reading
		Scanner scf;
		try {
			scf = new Scanner(new File("numbers.txt"));
			LinkedList<String> list = new LinkedList<String>();
			while(scf.hasNextLine()) { list.add(scf.nextLine()); }
			while(!list.isEmpty()) {
				String aux = list.get(0);
				list.removeFirst();
				String [] elements = aux.split(Pattern.quote(" - "));
				
				if(isBase10(Integer.parseInt(elements[0]))) { base10.put(elements[1], Integer.parseInt(elements[0])); }
				else { normal.put(elements[1], Integer.parseInt(elements[0])); }
				
			}
			scf.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		while(true) {
			String [] num = READ.readString().split("[\\W]");
			int total = 0;
			int subtotal = 0;
			if(num[0].equals("")) { break; }
			for(int i=0; i<num.length; i++) {
				if(base10.containsKey(num[i])) {
					total += subtotal*base10.get(num[i]);
					subtotal = 0;
				} else {
					subtotal += normal.get(num[i]);
				}
			}
			total += subtotal;
			System.out.println(total+"\n");
		}
		
	}
	
	
	private static boolean isBase10 (int n) {
		String str = String.valueOf(n);
		if((str.length()<3) || (str.charAt(0)!='1')) { return false; }
		else { for(int i=1; i<str.length(); i++) { if(str.charAt(i)!='0') { return false; } } }
		return true;
	}

}