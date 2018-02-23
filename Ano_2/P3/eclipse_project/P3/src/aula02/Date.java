package aula02;

public class Date {
	
	private final int day;
	private final int month;
	private final int year;
	
	Date (int d, int m, int y) {			
		this.day = d;
		this.month = m;
		this.year = y;
	}
	
	public int getDay () { return this.day;}
	public int getMonth () { return this.month;}
	public int getYear () { return this.year;}
}