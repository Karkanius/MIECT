import java.util.*;

public class P102 {
	
	public static void main (String[] args) {
		
		//Variáveis
		
	}
}

class HanoiTowers {
	
	Stack TA, TB, TC;
	
}

class Stack <E> {
	
	E [] elem;
	int amount = 0;
	
	Stack (int n) {
		elem = newStack (n);
		amount = 0;
		}
	
	E [] newStack (int n) { return ((E[])new Object[n]); }
	
	void add (E newValue) {
		assert !(isFull()):"Stack is full, cannot add anything else.";
		assert (amount != elem.length);
		
		elem[amount] = newValue;
		amount ++;		
	}
	
	boolean isFull() { return !(elem [elem.length] == null); }
}
