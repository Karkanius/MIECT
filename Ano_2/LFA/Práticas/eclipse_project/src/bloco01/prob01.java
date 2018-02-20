/*
 * Paulo Vasconcelos
 * paulobvasconcelos@gmail.com
 * 2018 february
 * 
 */

package bloco01;

import KarkaniusUtils.READ;

public class prob01 {

	public static void main(String[] args) {
		
		System.out.println("--- SIMPLE CALCULATOR ---");
		Operation op = FETCH_OPERATION();
		System.out.println(op.operationCompleted());

	}
	
	public static Operation FETCH_OPERATION() {
		String [] str = READ.readString().split("[\\s]");
		return new Operation (	Double.parseDouble(str[0]),
								str[1].charAt(0),
								Double.parseDouble(str[2]));
	}

}