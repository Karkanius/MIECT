/*
 * Paulo Vasconcelos
 * paulobvasconcelos@gmail.com
 * 2018 february
 * 
 */

package bloco01;

public class tests {

	public static void main(String[] args) {
		String str = "test0 test1 test2";
		String [] elems = str.split(" ", 2);
		for(int i=0; i<elems.length; i++)
			System.out.println(elems[i]);
	}

}
