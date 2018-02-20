/*
 * Paulo Vasconcelos
 * paulobvasconcelos@gmail.com
 * 2018 february
 * 
 */

package bloco01;

import java.util.Stack;

import KarkaniusUtils.READ;

public class prob02 {
	
	static Stack<Double> stck = new Stack<Double>();

	public static void main(String[] args) {
		
		System.out.println("--- REVERSE POLISH NOTATION CALCULATOR ---");
		String [] str = READ.readString().split("[\\s]");
		for(int i=0; i<str.length; i++) {
			try {
				stck.push(Double.parseDouble(str[i]));
			} catch (NumberFormatException e) {
				Operation.checkValidOperator(str[i].charAt(0));
				Operation op = new Operation(stck.pop(), str[i].charAt(0), stck.pop());
				stck.push(op.getResult());
			}
		}
		System.out.println("Result: "+stck.pop());

	}

}