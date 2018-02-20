package KarkaniusUtils;

import java.util.Scanner;

public abstract class READ {

	static Scanner sc = new Scanner (System.in);
	
	public static String readString() {
		System.out.print((char)9205+" ");
		return sc.nextLine();
	}
	
	
	public static String readString(String text) {
		System.out.println(text);
		return readString();
	}
	
	
	public static Integer readInteger() {
		String aux = readString();
		if((!aux.equals(""))&&(!aux.equals(null))) { return Integer.parseInt(aux); }
		else { return null; }
	}
	
	
	public static Integer readInteger(String text) {
		System.out.println(text);
		return readInteger();
	}
	
	
	public static Double readDouble() {
		String aux = readString();
		for(int i=0; i<aux.length(); i++) { if(aux.charAt(i)==',') { aux = aux.substring(0,i)+'.'+aux.substring(i+1); } }
		if((!aux.equals(""))&&(!aux.equals(null))) { return Double.parseDouble(aux); }
		else { return null; }
	}
	
	
	public static Double readDouble(String text) {
		System.out.println(text);
		return readDouble();
	}
}
