package aula13.prob03;

public class Pair<T, U> {

	//Attributes
	private T first;
	private U second;
	
	
	//Constructors
	public Pair(T first, U second) {
		this.first = first;
		this.second = second;
	}


	//Methods
	public T getFirst() { return first; }
	public U getSecond() { return second; }
	public void setFirst(T first) { this.first = first; }
	public void setSecond(U second) { this.second = second; }

}